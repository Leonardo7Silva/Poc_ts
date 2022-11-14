import { PalpiteType } from "../protocols/palpite.js";
import { QueryResult } from "pg";
import { connection } from "../database/database.js";



async function listarPalpites(): Promise<QueryResult<PalpiteType[]>>{
    const palpiteList = await connection.query(`
    SELECT * FROM palpites;
    `);

    return palpiteList;
};


async function insertPalpite(body:PalpiteType): Promise<QueryResult>{
    return await connection.query(`
    INSERT INTO "palpites"(
        "name",
        "jogoId", 
        "placarMandante", 
        "placarVisitante", 
        marcadores) 
        VALUES($1, $2, $3, $4, $5)
    `, [body.nome, 
        body.jogoId, 
        body.mandante, 
        body.visitante, 
        body.marcadores
    ])
};

async function deletarPalpite(id:number): Promise<QueryResult>{
    return await connection.query(`
    DELETE FROM palpites 
    WHERE id = $1;
    `, [id]);
};

async function atualizarPalpite(body:PalpiteType, id:number): Promise<QueryResult> {
    return await connection.query(`
    UPDATE palpites 
    SET 
    "placarMandante" = $1, 
    "placarVisitante" = $2, 
    marcadores = $3 
    WHERE id = $4
    `,[
        body.mandante,
        body.visitante,
        body.marcadores,
        id
    ])    
};

async function validarPalpite(id: number): Promise<boolean>{
    const pesquisa = await connection.query(`
    SELECT * FROM palpites WHERE id = $1;
    `, [id]);
    if(pesquisa.rowCount === 0){
        return false
    };

    return true;
};

export {
    listarPalpites,
    insertPalpite,
    deletarPalpite,
    atualizarPalpite,
    validarPalpite
}