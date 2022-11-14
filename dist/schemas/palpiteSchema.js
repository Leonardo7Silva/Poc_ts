import Joi from "joi";
export var PalpiteSchema = Joi.object({
    nome: Joi.string().required(),
    placarMandante: Joi.number().required(),
    placarVisitante: Joi.number().required(),
    marcadores: Joi.string().required(),
    jogoId: Joi.number().required()
});
