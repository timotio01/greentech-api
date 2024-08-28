let Anuncios = require('../model/Anuncio');
const pool = require('../database/mysql');
// const date = new Date();
const AnuncioController = {
   
    async criar(req, res) {
         
         const {data_vigencia, descricao, preco, produtos_id, status, usuarios_id} = req.body;
         
         
         let sql = `INSERT INTO anuncios (data_vigencia, descricao, preco, produtos_id, status, usuarios_id) VALUES (?,?,?,?,?,?)`
         const result = await pool.query(sql, [data_vigencia, descricao, preco, produtos_id, status, usuarios_id, 1])
         const insertId = result[0]?.insertId;
         if(!insertId) {
             return res.status(401).json({message: 'erro ao criar anuncio!'})
         }
         
         const sql_select = `SELECT * from anuncios where anuncio_ID = ?`
         const [rows] =await pool.query(sql_select, [insertId])
         return res.status(201).json(rows[0])
    

        }
    }
        
    module.exports = AnuncioController;
    