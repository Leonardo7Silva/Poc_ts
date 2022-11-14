import express from "express";
import {getPalpites, inserirPalpite, apagarPalpite, mudarPalpite} from "./controllers/palpitesController.js"
import dotenv from "dotenv";

dotenv.config();

const server = express();
server.use(express.json());

server.get('/hello', (req, res) =>{
    return res.send("ok")
});

server.get("/palpites", getPalpites);
server.post("/palpites", inserirPalpite);
server.delete("/palpites/:id", apagarPalpite);
server.put("/palpites/:id", mudarPalpite);

server.listen(process.env.PORT, ()=>{
    console.log(`Listenig on ${process.env.PORT}...`)
})