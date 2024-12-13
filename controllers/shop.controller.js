const { validationResult } = require('express-validator');
const ProductModel = require('../models/product.model');
const CartModel = require('../models/cart.model');
const CartItemModel = require('../models/cart-item.model');
const OrderModel = require('../models/order.model');
const OrderLineModel = require('../models/order-line.model');
const ReviewModel = require('../models/review.model');
const { checkEmptyArray } = require('../utils/array.utils');
const helperModel = require('../models/helper.model');

exports.getCart = (req, res, next) => {
    const { cartId } = req.params;
    CartItemModel.find({ cart_id: cartId })
        .then(async (listProduct) => {
            return res.json({
                success: true,
                error: null,
                data: {
                    cart_id: cartId,
                    products: listProduct
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};


exports.postCart = (req, res, next) => {
    const { id } = req.currentUser;
    const { products } = req.body;

    CartModel.create({ created_by: id, status: 1 })
        .then(async (idCart) => {
            if (checkEmptyArray(products)) {
                for (item of products) {

                    const { product_id, quantity } = item;
                    const product = await ProductModel.findOne({ id: product_id })
                    await CartItemModel.create({
                        cart_id: idCart.toString(),
                        product_id,
                        quantity: quantity,
                        price: product.price
                    })
                }
            }
            return res.json({
                success: true,
                error: null,
                data: {
                    id: idCart
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error,
            });
        });
};

exports.updateCart = (req, res, next) => {
    const { products, cart_id } = req.body;

    CartItemModel.delete(cart_id)
        .then(async () => {
            if (checkEmptyArray(products)) {
                for (item of products) {
                    const { product_id } = item;
                    const product = await ProductModel.findOne({ id: product_id })
                    await CartItemModel.create({
                        cart_id: cart_id,
                        product_id,
                        quantity: 1,
                        price: product.price
                    })
                }
            }
            return res.json({
                success: true,
                error: null,
                data: {
                    id: idCart
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};

exports.deleteCart = (req, res, next) => {
    const { cart_id } = req.body;

    CartModel.delete(cart_id)
        .then(async () => {
            return res.json({
                success: true,
                error: null,
                data: {
                    isSuccedd: true
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error,
            });
        });
};

exports.postCartDeleteProduct = (req, res, next) => {
    const { cart_id, product_id } = req.body;

    CartItemModel.delete({
        cart_id,
        product_id
    }).then(result => {
        return res.json({
            success: true,
            error: null,
            data: {
                isSuccedd: true
            }
        });
    }).catch(error => {
        return res.json({
            success: false,
            data: null,
            error: error
        });
    })
};

exports.postOrder = async (req, res, next) => {
    // const { id } = req.currentUser;
    const { products, user_id, address } = req.body;

    const oderId = await OrderModel.create({ user_id, address })
    console.log(oderId);
    if (checkEmptyArray(products)) {
        for (item of products) {
            const { product_id, quantity } = item;
            const product = await ProductModel.findOne({ id: product_id })
            await OrderLineModel.create({
                order_id: oderId,
                product_id,
                quantity: quantity,
                price: product?.price ?? 0
            })
        }
    }
    return res.json({
        success: true,
        error: null,
        data: {
            id: oderId
        }
    });
};

//update đơn hàng
exports.updateOrder2 = (req, res, next) => {
    const { order_id, status, reason } = req.query;

    // Sử dụng let để cho phép thay đổi giá trị
    let params = {};
    if (status == 5) {
        params.is_deleted = 1;
    } else {
        params.status = status;
    }

    // Nếu reason có giá trị, thêm vào params
    if (reason) {
        params.reason = reason;
    }

    // Cập nhật đơn hàng ban đầu
    OrderModel.update(params, order_id)
        .then(() => {
            // Nếu status là 2, thực hiện cập nhật status lên 3 sau 10-30 giây
            if (status == 2) {
                const delay = Math.floor(Math.random() * (30000 - 10000 + 1)) + 10000; // Random từ 10s đến 30s
                setTimeout(() => {
                    OrderModel.update({ status: 3 }, order_id)
                        .then(() => {
                            console.log(`Đơn hàng ${order_id} đã được cập nhật status lên 3.`);
                        })
                        .catch(error => {
                            console.error(`Lỗi cập nhật status lên 3 cho đơn hàng ${order_id}:`, error);
                        });
                }, delay);
            }

            return res.json({
                success: true,
                error: null,
                data: {
                    id: order_id
                }
            });
        })
        .catch(error => {
            console.error("Lỗi Cập Nhật Đơn Hàng:", error);
            return res.json({
                success: false,
                data: null,
                error: error.message || "Đã xảy ra lỗi trong quá trình cập nhật đơn hàng."
            });
        });
};




exports.deleteOrder = (req, res, next) => {
    const { order_id, reason } = req.body;
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        console.log(errors);
        return res.json({
            success: false,
            data: null,
            error: errors
        });
    }

    OrderModel.delete({
        id: order_id,
        message: reason
    }).then(result => {
        return res.json({
            success: true,
            error: null,
            data: {
                id: order_id
            }
        });
    }).catch(error => {
        console.log(error);
        return res.json({
            success: false,
            data: null,
            error: error
        });
    })
};

exports.getListOrders = (req, res, next) => {
    const { user_id } = req.query;

    OrderModel.find({ user_id: user_id })
        .then(async (listOrder) => {
            const listFilterOder = [];

            listOrder.forEach(element => {
                const isCheck = listFilterOder.findIndex(el => element.id === el.id);

                // Lấy các trường từ element
                const { id, product_id, price, quantity, title, sales, picture } = element;

                // Xóa các trường đã sử dụng để tối ưu bộ nhớ
                delete element.price;
                delete element.quantity;
                delete element.title;
                delete element.sales;
                delete element.picture;

                // Tạo đối tượng sản phẩm mới
                let newObj = { product_id, price, quantity, title, sales, picture };
                newObj = helperModel.convertLinkStaticObj(newObj, "picture");

                if (title) {
                    if (isCheck === -1) {
                        // Nếu đơn hàng chưa tồn tại, thêm mới vào danh sách
                        element.prices_order = parseInt(price ?? 0);
                        element.sales_order = parseInt(sales ?? 0);
                        element.products = [newObj];
                        listFilterOder.push(element);
                    } else {
                        // Nếu đơn hàng đã tồn tại, cập nhật sản phẩm
                        listFilterOder[isCheck].prices_order += parseInt(price ?? 0);
                        listFilterOder[isCheck].sales_order += parseInt(sales ?? 0);
                        listFilterOder[isCheck].products.push(newObj);
                    }
                }
            });

            console.log(listFilterOder);
            return res.json({
                success: true,
                error: null,
                data: {
                    list: listFilterOder
                }
            });
        })
        .catch(error => {
            console.error(error);
            return res.json({
                success: false,
                data: null,
                error: error.message || "Lỗi khi lấy danh sách đơn hàng"
            });
        });
};


exports.getListAllOrdersDetroy = (req, res, next) => {
    OrderModel.findProductDetroy()
        .then(async (listOrder) => {
            const listFilterOder = new Map();

            listOrder.forEach(element => {
                element = helperModel.convertLinkStaticObj(element, "picture");

                // Lấy các trường cần thiết
                const { id, product_id, price, quantity, title, sales, picture, reason } = element;
                const newObj = { product_id, price, quantity, title, sales, picture };

                if (!listFilterOder.has(id)) {
                    // Nếu đơn hàng chưa tồn tại, thêm mới vào Map
                    const { address, status, is_deleted, name, avatar } = element;
                    listFilterOder.set(id, {
                        id,
                        name,
                        avatar,
                        address,
                        reason, // Lý do
                        status,
                        is_deleted,
                        prices_order: parseInt(price ?? 0),
                        sales_order: parseInt(sales ?? 0),
                        products: [newObj],
                    });
                } else {
                    // Nếu đơn hàng đã tồn tại, cập nhật sản phẩm
                    const existingOrder = listFilterOder.get(id);
                    existingOrder.prices_order += parseInt(price ?? 0);
                    existingOrder.sales_order += parseInt(sales ?? 0);
                    existingOrder.products.push(newObj);
                    listFilterOder.set(id, existingOrder);
                }
            });

            const result = Array.from(listFilterOder.values());

            return res.json({
                success: true,
                error: null,
                data: {
                    list: result
                }
            });
        })
        .catch(error => {
            console.error(error);
            return res.json({
                success: false,
                data: null,
                error: error.message || "Lỗi khi lấy danh sách đơn hàng bị hủy"
            });
        });
};



exports.getListAllOrdersReview = (req, res, next) => {
    OrderModel.findProductReview()
        .then(async (listOrder) => {
            const listFilterOder = [];
            listOrder.forEach(element => {
                const isCheck = listFilterOder.findIndex(el => element.order_id === el.order_id);
                element = helperModel.convertLinkStaticObj(element, "picture");

                // Lấy các trường cần thiết
                const { product_id, price, quantity, title, sales, picture, comment, rating } = element;

                // Xóa các trường đã lưu vào đối tượng mới
                delete element.price;
                delete element.quantity;
                delete element.title;
                delete element.sales;
                delete element.picture;

                // Tạo đối tượng mới
                const newObj = { product_id, price, quantity, title, sales, picture, comment, rating };

                if (isCheck === -1) {
                    // Nếu chưa tồn tại, thêm mới vào danh sách
                    element.prices_order = parseInt(price ?? 0);
                    element.sales_order = parseInt(sales ?? 0);
                    element.products = [newObj];
                    listFilterOder.push(element);
                } else {
                    // Nếu đã tồn tại, cập nhật danh sách
                    listFilterOder[isCheck].prices_order += parseInt(price ?? 0);
                    listFilterOder[isCheck].sales_order += parseInt(sales ?? 0);
                    listFilterOder[isCheck].products.push(newObj);
                }
            });

            return res.json({
                success: true,
                error: null,
                data: {
                    list: listFilterOder
                }
            });
        })
        .catch(error => {
            console.error(error);
            return res.json({
                success: false,
                data: null,
                error: error.message || "Lỗi lấy danh sách đánh giá"
            });
        });
};


exports.getListAllOrders = (req, res, next) => {
    OrderModel.findProduct()
        .then(async (listOrder) => {
            const listFilterOder = new Map();

            listOrder.forEach(element => {
                // Chuyển đổi ảnh liên kết nếu cần
                element = helperModel.convertLinkStaticObj(element, "picture");

                // Lấy các trường cần thiết
                const { id, price, quantity, title, sales, picture } = element;
                const newObj = { price, quantity, title, sales, picture };

                if (!listFilterOder.has(id)) {
                    // Nếu đơn hàng chưa tồn tại, thêm mới vào Map
                    const { reason, address, status, is_deleted } = element;
                    listFilterOder.set(id, {
                        id,
                        reason,
                        address,
                        status,
                        is_deleted,
                        prices_order: parseInt(price ?? 0),
                        sales_order: parseInt(sales ?? 0),
                        products: [newObj],
                    });
                } else {
                    // Nếu đơn hàng đã tồn tại, cập nhật sản phẩm
                    const existingOrder = listFilterOder.get(id);
                    existingOrder.prices_order += parseInt(price ?? 0);
                    existingOrder.sales_order += parseInt(sales ?? 0);
                    existingOrder.products.push(newObj);
                    listFilterOder.set(id, existingOrder);
                }
            });

            const result = Array.from(listFilterOder.values());
            console.log(" \n +++++++++++++++++++++++++++++" + result);
            return res.json({
                success: true,
                error: null,
                data: {
                    list: result
                }
            });
        })
        .catch(error => {
            console.error(error);

            return res.json({
                success: false,
                data: null,
                error: error.message || "Lỗi khi lấy danh sách đơn hàng"
            });
        });
};


exports.postReviewOrder = (req, res, next) => {
    const { order_id, review } = req.body;
    OrderModel.update({
        review
    }, order_id)
        .then(async () => {
            return res.json({
                success: true,
                error: null,
                data: {
                    id: order_id
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};

exports.updateOrder = (req, res, next) => {
    const { order_id } = req.body;
    OrderModel.update({
        status: 0
    }, order_id)
        .then(async () => {
            return res.json({
                success: true,
                error: null,
                data: {
                    id: order_id
                }
            });
        })
        .catch(error => {
            console.log(error);
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};


exports.getOrders = (req, res, next) => {
    const { orderId } = req.params;
    OrderLineModel.find({ order_id: orderId })
        .then(async (listProduct) => {
            return res.json({
                success: true,
                error: null,
                data: {
                    order_id: orderId,
                    products: listProduct
                }
            });
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};

exports.postReview = (req, res, next) => {
    // Lấy dữ liệu từ body và đổi tên biến để phù hợp với DB
    const { userId: user_id, productId: product_id, rating, comment } = req.body;

    console.log("Nhận dữ liệu từ client:", req.body);

    // Kiểm tra dữ liệu nhập
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.json({
            success: false,
            data: null,
            error: errors.array()
        });
    }

    // Gọi model để tạo đánh giá
    ReviewModel.create({ user_id, product_id, rating, comment })
        .then((idReview) => {
            if (!idReview) {
                throw new Error("Không thể tạo đánh giá");
            }
            return res.json({
                success: true,
                error: null,
                data: {
                    reviewId: idReview
                }
            });
        })
        .catch((error) => {
            console.error("Lỗi tạo đánh giá:", error);
            return res.json({
                success: false,
                data: null,
                error: error.message || "Không thể tạo đánh giá."
            });
        });

};
exports.getListReviews = (req, res, next) => {
    ReviewModel.findReviews()
        .then((reviews) => {
            if (!reviews || reviews.length === 0) {
                console.log("No reviews found");
                return res.json({
                    success: true,
                    data: [],
                    message: "No reviews found"
                });
            }

            // Safely convert product pictures and user avatars
            const formattedReviews = reviews.map(review => ({
                review_id: review.review_id,
                order_id: review.order_id || "N/A",
                order_date: review.order_date || "N/A",
                product_id: review.product_id,
                product_title: review.product_title,
                product_picture: helperModel.convertLinkStatic([review.product_picture], "picture")[0],
                user_id: review.user_id,
                user_name: review.user_name,
                user_avatar: helperModel.convertLinkStatic([review.user_avatar], "avatar")[0],
                rating: review.rating,
                comment: review.comment
            }));

            console.log("Review list:", formattedReviews);
            return res.json({
                success: true,
                data: formattedReviews
            });
        })
        .catch(error => {
            console.error("Error fetching reviews:", error);
            return res.json({
                success: false,
                error: error.message || "Failed to fetch reviews"
            });
        });
};

exports.getSoldOrders = async (req, res) => {
    try {
        const soldOrders = await OrderModel.findSoldOrders();
        if (!soldOrders || soldOrders.length === 0) {
            return res.json({
                success: true,
                message: "No sold orders found",
                data: []
            });
        }

        // Định dạng dữ liệu trả về
        const formattedOrders = soldOrders.map(order => ({
            order_id: order.order_id,
            order_date: order.order_date,
            delivery_address: order.delivery_address,
            customer_name: order.customer_name,
            customer_email: order.customer_email,
            product_id: order.product_id,
            product_title: order.product_title,
            product_picture: order.product_picture,
            product_price: order.product_price,
            quantity_sold: order.quantity_sold
        }));

        return res.json({
            success: true,
            data: formattedOrders
        });
    } catch (error) {
        console.error("Error fetching sold orders:", error);
        return res.status(500).json({
            success: false,
            message: "Failed to retrieve sold orders",
            error: error.message
        });
    }
};


exports.getRevenueStatistics = async (req, res) => {
    const { startDate, endDate } = req.query;

    if (!startDate || !endDate) {
        return res.status(400).json({
            success: false,
            message: "Start date and end date are required."
        });
    }

    try {
        const result = await OrderModel.calculateRevenue({ startDate, endDate });

        return res.json({
            success: true,
            data: {
                totalRevenue: result.total_revenue || 0
            }
        });
    } catch (error) {
        console.error("Error fetching revenue statistics:", error);
        return res.status(500).json({
            success: false,
            message: "Failed to fetch revenue statistics."
        });
    }
};


