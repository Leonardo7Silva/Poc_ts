import pg from "pg";
import dotenv from "dotenv";
dotenv.config();
var Pool = pg.Pool;
//O typescript n aceitou process no port, perguntar para o tutor
/*const connection = new Pool({
    host: process.env.HOST,
    port: 5432,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
});*/
var connection = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false
    }
});
export { connection };
