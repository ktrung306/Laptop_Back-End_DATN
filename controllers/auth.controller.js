const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config();
const { validationResult } = require('express-validator');
const UserModel = require('../models/user.model');
const credentialModel = require('../models/credential.model');
const transporter = require("../utils/mailConfig");
const crypto = require("crypto");

const passwwordDefault = '123456789';
let userSail = {
    user_id: null,
    hasher: '10',
    password_hash: '',
    password_salt: '10'
}

exports.postLogin = (req, res, next) => {
    const { email, password } = req.body;

    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.json({
        success: false,
        data: null,
        error: errors
    });

    //kiểm tra xem email hay là số điện thoại
    const isPhone = email.match(/^\d+$/);
    const key = isPhone ? 'phoneNumber' : 'email';
    UserModel.findOne({ [key]: email })
        .then(async (user) => {
            if (!user || !password) return res.json({
                success: false,
                data: null,
                error: {}
            });
            const passwordResult = await credentialModel.findOne({ user_id: user.id })

            bcrypt.compare(password, passwordResult.password_hash)
                .then(doMatch => {
                    const secretKey = process.env.SECRET_JWT || "";
                    user.id = `${user.id}`
                    const token = doMatch ? jwt.sign({ ...user }, secretKey, { expiresIn: 60 * 60 }) : '';
                    if (token) return res.json({
                        success: true,
                        error: null,
                        data: {
                            token: token,
                            ...user
                        }
                    })
                    else return res.json({
                        success: false,
                        data: null,
                        error: {}
                    });
                })
                .catch(error => {
                    return res.json({
                        success: false,
                        data: null,
                        error: error
                    });
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

exports.postSignup = (req, res, next) => {
    const { slug, email, name, avatar, bio, company, password, role, phoneNumber } = req.body;
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.json({
        success: false,
        data: null,
        error: errors
    });

    bcrypt.hash(password, 12)
        .then(async (hashedPassword) => {
            const idUser = await UserModel.create({
                slug, email, name, avatar, bio, company, role, phoneNumber
            })
            userSail.password_hash = hashedPassword
            userSail.user_id = idUser
            if (idUser) await credentialModel.create(userSail)
            return res.json({
                success: true,
                error: null,
                data: {
                    id: idUser
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

exports.postLogout = (req, res, next) => {
    return res.json({
        success: true,
        error: null,
        data: {
            isSuccess: true
        }
    });
};

exports.postReset = (req, res, next) => {
    const { email } = req.body;
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.json({
        success: false,
        data: null,
        error: errors
    });

    UserModel.findOne({ email: email })
        .then(async (user) => {
            if (!user) return res.json({
                success: false,
                data: null,
                error: {}
            });
            bcrypt.hash(passwwordDefault, 12)
                .then(async (hashedPassword) => {
                    userSail.password_hash = hashedPassword;
                    const { id } = user;
                    userSail.user_id = id
                    await credentialModel.delete(id)
                    await credentialModel.create(userSail)
                    return res.json({
                        success: true,
                        error: null,
                        data: {
                            id: user.id.toString()
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
        })
        .catch(error => {
            return res.json({
                success: false,
                data: null,
                error: error
            });
        });
};

exports.postNewPassword = async (req, res, next) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).json({
            success: false,
            message: "Vui lòng nhập địa chỉ email!",
        });
    }

    try {
        // Tìm người dùng bằng email
        const user = await UserModel.findOne({ email });
        if (!user) {
            return res.status(404).json({
                success: false,
                message: "Email không tồn tại trong hệ thống!",
            });
        }

        // Tạo mật khẩu mới
        const newPassword = crypto.randomBytes(4).toString("hex");
        const hashedPassword = await bcrypt.hash(newPassword, 12);

        // Cập nhật mật khẩu trong cơ sở dữ liệu
        await credentialModel.update({ password_hash: hashedPassword }, user.id);

        // Cấu hình thông tin email
        const mailOptions = {
            from: '"Quản Lý Laptop" <your-email@gmail.com>', // Tên người gửi
            to: email,
            subject: "Khôi Phục Mật Khẩu",
            text: `Mật khẩu mới của bạn là: ${newPassword}`,
            html: `<p>Xin chào ${user.name},</p>
                   <p>Mật khẩu mới của bạn là: <b>${newPassword}</b></p>
                   <p>Vui lòng đăng nhập và thay đổi mật khẩu ngay khi có thể.</p>`,
        };

        // Gửi email
        await transporter.sendMail(mailOptions);

        return res.status(200).json({
            success: true,
            message: "Mật khẩu mới đã được gửi đến email của bạn!",
        });
    } catch (error) {
        console.error("Lỗi khi gửi email:", error.message);
        return res.status(500).json({
            success: false,
            message: "Không thể gửi email khôi phục mật khẩu!",
            error: error.message,
        });
    }
};


exports.postChangePassword = async (req, res) => {
    const { email, oldPassword, newPassword } = req.body;

    if (!email || !oldPassword || !newPassword) {
        return res.status(400).json({ success: false, message: "Thiếu email, mật khẩu cũ hoặc mật khẩu mới." });
    }

    console.log("Email:", email);
    console.log("Old Password:", oldPassword);
    console.log("New Password:", newPassword);

    try {
        // Tìm người dùng
        const user = await UserModel.findOne({ email });
        console.log("User:", user);
        if (!user) {
            return res.status(404).json({ success: false, message: "Người dùng không tồn tại." });
        }

        // Lấy thông tin mật khẩu
        const credentials = await credentialModel.findOne({ user_id: user.id });
        console.log("Credentials:", credentials);
        if (!credentials) {
            return res.status(404).json({ success: false, message: "Không tìm thấy thông tin mật khẩu." });
        }

        // Kiểm tra mật khẩu cũ
        const isMatch = await bcrypt.compare(oldPassword, credentials.password_hash);
        if (!isMatch) {
            return res.status(400).json({ success: false, message: "Mật khẩu cũ không chính xác." });
        }

        // Tạo mật khẩu mới
        const hashedPassword = await bcrypt.hash(newPassword, 12);
        console.log("Hashed Password:", hashedPassword);

        // Cập nhật mật khẩu (dùng `credentials.user_id`)
        console.log("Updating credentials for user_id:", credentials.user_id);
        await credentialModel.update({ password_hash: hashedPassword }, credentials.user_id);

        return res.json({ success: true, message: "Đổi mật khẩu thành công." });
    } catch (error) {
        console.error("Lỗi hệ thống:", error);
        return res.status(500).json({ success: false, message: "Đã xảy ra lỗi." });
    }


};

exports.updateProfile = async (req, res) => {
    const { user_id, name, phoneNumber, gender, dateOfBirth, image } = req.body;
    console.log("Request body:", req.body);
    if (!user_id || !name || !phoneNumber || !gender || !dateOfBirth) {
        return res.status(400).json({
            success: false,
            message: "Vui lòng nhập đầy đủ thông tin!",
        });
    }

    try {
        // Kiểm tra xem người dùng có tồn tại không
        const user = await UserModel.findOne({ id: user_id });
        if (!user) {
            return res.status(404).json({
                success: false,
                message: "Người dùng không tồn tại!",
            });
        }

        // Cập nhật thông tin người dùng
        const updateData = {
            name,
            phoneNumber,
            gender,
            date_of_birth: dateOfBirth,
            avatar: image || user.avatar, // Giữ ảnh cũ nếu không có link mới
        };

        const updatedRows = await UserModel.update(updateData, user_id);

        if (!updatedRows) {
            return res.status(400).json({
                success: false,
                message: "Cập nhật thất bại!",
            });
        }

        return res.json({
            success: true,
            message: "Cập nhật thông tin cá nhân thành công!",
            data: { user_id, ...updateData },
        });

    } catch (error) {
        console.error("Lỗi hệ thống:", error);
        return res.status(500).json({
            success: false,
            message: "Đã xảy ra lỗi khi cập nhật!",
            error: error.message,
        });
    }
};











