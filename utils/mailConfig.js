const nodemailer = require("nodemailer");

// Cấu hình Nodemailer
const transporter = nodemailer.createTransport({
    service: "Gmail", // Có thể thay thế bằng "Outlook" hoặc các dịch vụ khác
    auth: {
        user: "khactrungcc18@gmail.com",  // Email của bạn truongzxs4@gmail.com,   ocbd uufa mlyw jwyc
        pass: "xfbc oiet tclr zgvu"
    },
});

module.exports = transporter;
