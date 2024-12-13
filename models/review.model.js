const { v4: uuidv4 } = require('uuid');
const query = require('../db/db-connection');
const { multipleColumnSet } = require('../utils/common.utils');

class ReviewModel {
    tableReviews = 'reviews';

    find = async (params = {}) => {
        let sql = `SELECT * FROM ${this.tableReviews}`;
        if (!Object.keys(params).length) return await query(sql);
        const { columnSet, values } = multipleColumnSet(params)
        sql += ` WHERE ${columnSet}`;
        return await query(sql, [...values]);
    }

    findOne = async (params) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `SELECT * FROM ${this.tableReviews}
        WHERE ${columnSet}`;
        const result = await query(sql, [...values]);
        return result[0];
    }

    create = async ({ user_id, product_id, rating, comment }) => {
        const sqlReview = `
        INSERT INTO ${this.tableReviews} (id, user_id, product_id, rating, comment) 
        VALUES (?, ?, ?, ?, ?)
    `;
        try {
            const reviewId = uuidv4();
            await query(sqlReview, [
                reviewId,
                user_id,
                product_id,
                rating || null,
                comment || null
            ]);
            return reviewId;
        } catch (error) {
            console.error("Lỗi khi tạo đánh giá:", error);
            return null;
        }
    };


    update = async (params, id) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `UPDATE user SET ${columnSet} WHERE id = ?`;
        const result = await query(sql, [...values, id]);
        return result;
    }

    delete = async (id) => {
        const sql = `DELETE FROM ${this.tableReviews}
        WHERE id = ?`;
        const result = await query(sql, [id]);
        const affectedRows = result ? result.affectedRows : 0;
        return affectedRows;
    }

    findReviews = async () => {
        const sql = `
        SELECT
            reviews.id AS review_id,
            reviews.product_id,
            reviews.user_id,
            reviews.rating,
            reviews.comment,
            DATE_FORMAT(reviews.created_at, '%Y-%m-%d') AS review_date,
            COALESCE(users.name, 'Unknown') AS user_name,
            COALESCE(users.avatar, 'default_avatar.png') AS user_avatar,
            COALESCE(products.title, 'Unknown Product') AS product_title,
            COALESCE(products.picture, 'default_product.png') AS product_picture,
            COALESCE(orders.id, 'N/A') AS order_id,
            DATE_FORMAT(orders.created_at, '%Y-%m-%d') AS order_date
        FROM reviews
        LEFT JOIN users ON reviews.user_id = users.id
        LEFT JOIN products ON reviews.product_id = products.id
        LEFT JOIN order_lines ON reviews.product_id = order_lines.product_id
        LEFT JOIN orders ON order_lines.order_id = orders.id
        ORDER BY reviews.created_at DESC;
    `;
        return await query(sql);
    };


}



module.exports = new ReviewModel;
