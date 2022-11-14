import Joi from "joi";

export const PalpiteSchema = Joi.object({
    nome: Joi.string().required(),
    mandante: Joi.number().required(),
    visitante: Joi.number().required(),
    marcadores: Joi.string().required(),
    jogoId: Joi.number().required()
})