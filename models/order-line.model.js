const { v4: uuidv4 } = require('uuid');
const query = require('../db/db-connection');
const { multipleColumnSet } = require('../utils/common.utils');

class OrderLineModel {
    tableCartItem = 'order_lines';

    find = async (params = {}) => {
        let sql = `SELECT CONVERT(products.id, NCHAR) product_id, CONVERT(products.category_id, NCHAR) category_id, title, slug, picture, summary, description, order_lines.price, order_lines.quantity, created_by FROM ${this.tableCartItem} LEFT JOIN products ON products.id = order_lines.product_id`;
        if (!Object.keys(params).length) return await query(sql);
        const { columnSet, values } = multipleColumnSet(params)
        sql += ` WHERE ${columnSet}`;
        return await query(sql, [...values]);
    }

    findOne = async (params) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `SELECT * FROM ${this.tableCartItem}
        WHERE ${columnSet}`;
        const result = await query(sql, [...values]);
        return result[0];
    }

    create = async ({ order_id, product_id, price, quantity }) => {
        const lineId = uuidv4();
        console.log(lineId + " " + order_id + " " + product_id + " " + price + " " + quantity);
        const sql = `INSERT INTO ${this.tableCartItem}
        (id, order_id, product_id, price, quantity) VALUES (?, ?, ?, ?, ?)`;
        const result = await query(sql, [lineId, order_id, product_id, price, quantity]);
        return lineId;
    }


    update = async (params, id) => {
        const { columnSet, values } = multipleColumnSet(params)
        const sql = `UPDATE user SET ${columnSet} WHERE id = ?`;
        const result = await query(sql, [...values, id]);
        return result;
    }

    delete = async (id) => {
        const sql = `DELETE FROM ${this.tableCartItem}
        WHERE id = ?`;
        const result = await query(sql, [id]);
        const affectedRows = result ? result.affectedRows : 0;
        return affectedRows;
    }
}

module.exports = new OrderLineModel;
