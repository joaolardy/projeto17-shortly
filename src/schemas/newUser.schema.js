import joi from 'joi';

const newUserSchema = joi.object({
    name: joi.string().required().min(3).max(50),
    email: joi.string().required().email(),
    password: joi.string().required().min(4).max(50),
    confirmPassword: joi.ref('password')
}).with('password', 'confirmPassword')

export default newUserSchema;