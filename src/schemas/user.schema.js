import joi from 'joi';

const userSchema = joi.object({
    name: joi.required().string().min(3).max(50),
    email: joi.string().required().email(),
    password: joi.string().required().min(6).max(50),
    confirmPassword: joi.ref("password")
});

export default userSchema;