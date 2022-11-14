import Joi from "joi";
export var PalpiteSchema = Joi.object({
    nome: Joi.string().required(),
    mandante: Joi.number().required(),
    visitante: Joi.number().required(),
    marcadores: Joi.string().required(),
    jogoId: Joi.number().required()
});
