const { v4: uuidv4 } = require('uuid');
const query = require('../db/db-connection');
const { multipleColumnSet } = require('../utils/common.utils');

class OrderModel {
    tableOrder = 'orders';

    find = async (params = {}) => {
        console.log(params);

        let sql = `
        SELECT 
            products.id AS product_id, 
            users.name, 
            users.avatar, 
            orders.address,
            orders.reason,
            products.picture, 
            CAST(orders.is_deleted AS SIGNED) AS is_deleted, 
            CAST(orders.id AS CHAR) AS id, 
            orders.status, 
            products.summary, 
            order_lines.price, 
            order_lines.quantity, 
            products.title, 
            products.sales 
        FROM orders
        INNER JOIN users ON orders.user_id = users.id
        LEFT JOIN order_lines ON orders.id = order_lines.order_id
        LEFT JOIN products ON order_lines.product_id = products.id
    `;

        if (Object.keys(params).length) {
            const { columnSet, values } = multipleColumnSet(params);
            sql += ` WHERE ${columnSet}`;
            return await query(sql, [...values]);
        }
        return await query(sql);
    };


    findProduct = async (params = {}) => {
        let sql = `SELECT 
              users.name, 
              users.avatar, 
              orders.address,
              orders.reason,
              products.picture, 
              CAST(orders.is_deleted AS UNSIGNED) AS is_deleted, 
              CAST(orders.id AS CHAR) AS id, 
              orders.status, 
              products.summary, 
              order_lines.price, 
              order_lines.quantity, 
              products.title, 
              products.sales 
           FROM orders
           INNER JOIN users ON orders.user_id = users.id
           LEFT JOIN order_lines ON orders.id = order_lines.order_id
           LEFT JOIN products ON order_lines.product_id = products.id`;

        return await query(sql);
    }

    findProductDetroy = async (params = {}) => {
        let sql = `SELECT 
              users.name, 
              users.avatar, 
              orders.address,
              orders.reason,
              products.id AS product_id,
              products.picture, 
              CAST(orders.is_deleted AS UNSIGNED) as is_deleted, 
              CAST(orders.id AS CHAR) as id, 
              orders.status, 
              products.summary, 
              order_lines.price, 
              order_lines.quantity, 
              products.title, 
              products.sales 
           FROM orders
           INNER JOIN users ON orders.user_id = users.id
           LEFT JOIN order_lines ON orders.id = order_lines.order_id
           LEFT JOIN products ON order_lines.product_id = products.id`;

        return await query(sql);
    }

    findProductReview = async (params = {}) => {
        const sql = `
        SELECT 
            products.id AS product_id, 
            users.name, 
            users.avatar, 
            orders.id AS order_id, 
            orders.created_at, 
            orders.is_deleted, 
            orders.status, 
            products.picture, 
            products.title, 
            products.summary, 
            order_lines.price, 
            order_lines.quantity, 
            products.sales, 
            reviews.rating, 
            reviews.comment 
        FROM orders
        INNER JOIN users ON orders.user_id = users.id
        LEFT JOIN order_lines ON orders.id = order_lines.order_id
        LEFT JOIN products ON order_lines.product_id = products.id
        LEFT JOIN reviews ON products.id = reviews.product_id 
            AND users.id = reviews.user_id
        WHERE orders.status = 3 
          AND orders.is_deleted = 0 
          AND reviews.comment IS NOT NULL;
    `;
        return await query(sql);
    };

    findSoldOrders = async () => {
        const sql = `
        SELECT
            orders.id AS order_id,
            orders.created_at AS order_date,
            orders.address AS delivery_address,
            orders.status,
            users.name AS customer_name,
            users.email AS customer_email,
            products.id AS product_id,
            products.title AS product_title,
            products.picture AS product_picture,
            order_lines.price AS product_price,
            order_lines.quantity AS quantity_sold
        FROM orders
        LEFT JOIN users ON orders.user_id = users.id
        LEFT JOIN order_lines ON orders.id = order_lines.order_id
        LEFT JOIN products ON order_lines.product_id = products.id
        WHERE orders.status = 6
        ORDER BY orders.created_at DESC;
    `;
        const result = await query(sql);
        console.log("Kết quả từ query:", result); // Thêm log ở đây
        return result;
    };

    calculateRevenue = async ({ startDate, endDate }) => {
        const sql = `
            SELECT 
                SUM(order_lines.price * order_lines.quantity) AS total_revenue
            FROM orders
            INNER JOIN order_lines ON orders.id = order_lines.order_id
            WHERE orders.status = 6
              AND orders.created_at BETWEEN ? AND ?;
        `;

        const result = await query(sql, [startDate, endDate]);
        return result[0];
    };







    findOne = async (params) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `SELECT * FROM ${this.tableOrder}
        WHERE ${columnSet}`;
        const result = await query(sql, [...values]);
        return result[0];
    }

    create = async ({ user_id, address }) => {
        const orderId = uuidv4(); // Tạo UUID hợp lệ
        const createdAt = new Date(); // Lấy thời gian hiện tại

        // Định dạng ngày theo yyyy-mm-dd HH:mm:ss
        const formattedDate = `${createdAt.getFullYear()}-${createdAt.getMonth() + 1}-${createdAt.getDate()} ${createdAt.getHours()}:${createdAt.getMinutes()}:${createdAt.getSeconds()}`;

        const sql = `INSERT INTO ${this.tableOrder}
        (id, user_id, is_deleted, status, address, created_at) 
        VALUES (?, ?, ?, ?, ?, ?)`;

        await query(sql, [orderId, user_id, 0, 1, address, formattedDate]);
        return orderId;
    };



    update = async (params, id, reason) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `UPDATE ${this.tableOrder} SET ${columnSet} WHERE id = ?`;
        const result = await query(sql, [...values, id]);
        return result;
    }

    delete = async ({ id, message }) => {
        const sql = `UPDATE ${this.tableOrder} SET is_deleted = 1, reason = ?
        WHERE id = ?`;
        const result = await query(sql, [message, id]);
        const affectedRows = result ? result.affectedRows : 0;
        return affectedRows;
    }
}

module.exports = new OrderModel;
