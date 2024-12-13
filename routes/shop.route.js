const express = require('express');
const shopController = require('../controllers/shop.controller');
const auth = require('../middleware/auth.middleware');
const { createReviewSchema, createOrderSchema } = require('../middleware/validators/reviewValidator.middleware');

const router = express.Router();

router.get('/cart/:cartId', auth(), shopController.getCart);
router.post('/cart', auth(), shopController.postCart);
router.post('/cart-delete-item', auth(), shopController.postCartDeleteProduct);
router.post('/orders', shopController.postOrder);
router.get('/orders', shopController.getListOrders);
router.get('/orders/all', shopController.getListAllOrders);
router.get('/orders/detroy', shopController.getListAllOrdersDetroy);
router.get('/orders/review', shopController.getListAllOrdersReview);
router.post('/ordersStatus', createOrderSchema, shopController.updateOrder2);
router.post('/review', createReviewSchema, shopController.postReview);
router.post('/reviews/order', shopController.postReviewOrder);
router.post('/order/update', shopController.updateOrder);
router.get('/orders/:orderId', shopController.getOrders);
router.get('/reviews', shopController.getListReviews);
router.get("/order/sold", shopController.getSoldOrders);
router.get('/revenue-statistics', shopController.getRevenueStatistics);


module.exports = router;
