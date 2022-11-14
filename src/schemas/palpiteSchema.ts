import Joi from "joi";

export const PalpiteSchema = Joi.object({
    nome: Joi.string().required(),
    placarMandante: Joi.number().required(),
    placarVisitante: Joi.number().required(),
    marcadores: Joi.string().required(),
    jogoId: Joi.number().required()
})