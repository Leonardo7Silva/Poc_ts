import { Request, Response } from "express";
import { 
    listarPalpites, 
    insertPalpite, 
    deletarPalpite, 
    atualizarPalpite,
    validarPalpite } from "../repositories/papitesRepositorie.js";
import { PalpiteType } from "../protocols/palpite.js";
import { PalpiteSchema } from "../schemas/palpiteSchema.js";

async function getPalpites(req:Request, res:Response){
    try{
        const palpite = await listarPalpites();
        return res.send(palpite.rows);
    }catch(error){
        return res.status(500).send(error.message);
    }
    
};

async function inserirPalpite(req:Request, res:Response){
    const newPalpite = req.body as PalpiteType 

    const valid = PalpiteSchema.validate(newPalpite, {abortEarly: false});
    if(valid.error){
        const erros= valid.error.details
        return res.status(400).send(erros.map((value)=>value.message))
    }

    try{
        const insercao = await insertPalpite(newPalpite);
        return res.send(`${insercao.rowCount} palpite inserido`);
    }catch(error){
        return res.status(500).send(error.message);
    };
};
async function mudarPalpite(req:Request, res:Response){
    const {id} = req.params;
    const newPalpite = req.body as PalpiteType 

    const valid = PalpiteSchema.validate(newPalpite, {abortEarly: false});
    if(valid.error){
        const erros= valid.error.details
        return res.status(400).send(erros.map((value)=>value.message))
    }
    
    try{
        const pesquisa = await validarPalpite(Number(id));
        if(!pesquisa){
            return res.status(404).send("Esse palpite não existe")
        };
        const mudanca = await atualizarPalpite(newPalpite, Number(id));
        return res.send(`${mudanca.rowCount} palpite atualizado`);
    }catch(error){
        return res.status(500).send(error.message);
    }
};

async function apagarPalpite(req:Request, res:Response){
    const {id} = req.params;
    
    try{
        const pesquisa = await validarPalpite(Number(id));
        if(!pesquisa){
            return res.status(404).send("Esse palpite não existe")
        };
        const apagar = await deletarPalpite(Number(id));
        return res.send(`${apagar.rowCount} Palpite apagado`)

    }catch(error){
        return res.status(500).send(error.message);
    }
}
 
export{
    getPalpites,
    inserirPalpite,
    apagarPalpite,
    mudarPalpite
}