export function validateSchema(schema) {
  return (req, res, next) => { 
    const { error } = schema.validate(req.body, {abortEarly: false});
    if (error && error.length) {
      return res.status(422).send(error.details.map(detail => detail.message));
    }

    next();
  }
}