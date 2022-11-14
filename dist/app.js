import express from "express";
import { getPalpites, inserirPalpite, apagarPalpite, mudarPalpite } from "./controllers/palpitesController.js";
import dotenv from "dotenv";
dotenv.config();
var server = express();
server.use(express.json());
server.get('/hello', function (req, res) {
    return res.send("ok");
});
server.get("/palpites", getPalpites);
server.post("/palpites", inserirPalpite);
server["delete"]("/palpites/:id", apagarPalpite);
server.put("/palpites/:id", mudarPalpite);
server.listen(process.env.PORT, function () {
    console.log("Listenig on ".concat(process.env.PORT, "..."));
});
