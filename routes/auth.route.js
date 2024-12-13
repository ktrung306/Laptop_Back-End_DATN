const express = require('express');
const authController = require('../controllers/auth.controller');
const auth = require('../middleware/auth.middleware');
const upload = require('../middleware/multer');
const { createUserSchema, loginUserSchema, resetUserSchema } = require('../middleware/validators/userValidator.middleware');

const router = express.Router();

router.post(
    '/login',
    loginUserSchema,
    authController.postLogin
);
router.post(
    '/signup',
    createUserSchema,
    // auth(),
    authController.postSignup
);
router.post('/logout', authController.postLogout);
router.post('/reset', resetUserSchema, authController.postReset);
router.post('/new-password', resetUserSchema, authController.postNewPassword);
router.post('/change-password', authController.postChangePassword);
router.post('/update-profile', authController.updateProfile);

module.exports = router;
