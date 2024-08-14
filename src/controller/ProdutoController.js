let  produtos = require('../model/Produto');
const pool = require('../database/mysql')
// const date = new Date();
const ProdutoController = {


    async criar(req, res) {
        // console.log(req.body)
        const {NOME, MARCA, ESTADO_USO, DESCRICAO, DATA, PRECO, usuarios_id} = req.body;
      

        let sql = `INSERT INTO produtos (NOME, MARCA, ESTADO_USO, DESCRICAO, DATA, PRECO, usuarios_id) VALUES(?,?,?,?,?,?,?)`
        const result = await pool.query(sql,[NOME, MARCA, ESTADO_USO, DESCRICAO, DATA, PRECO, usuarios_id, 1])
        const insertId = result[0]?.insertId;
        if(!insertId){
            return res.status(401).json({message: 'erro ao criar produto!'})
        }
        const sql_select = `SELECT * from produtos where PRODUTO_ID = ?`
        const [rows] = await pool.query(sql_select, [insertId])
        return res.status(201).json(rows[0])
    },




    async listar(req, res) {
        let sql = "select * from produtos";
        const [rows] = await pool.query(sql);

        return res.status(200).json(rows);
    },

    async show(req, res) {
        const paramId = req.params.id;
        const sql_select = `SELECT * from produtos where produto_id = ?`
        const [rows] =await pool.query(sql_select, [Number(paramId)])
        return res.status(201).json(rows[0])
        
    },

    async deletar(req, res) {
        const paramId = req.params.id;
        let sql = `DELETE from produtos WHERE PRODUTO_ID = ?`
        const result = await pool.query(sql, [Number(paramId)])
        const affectedRows = result[0]?.affectedRows;
        if(!affectedRows) {
            return res.status(401).json({message: 'erro ao deletar produto!'})
        }
        return res.status(200).json({mensagem: "Produto deletado com sucesso!"})
    },


    async alterar(req, res) {
        //pegar o id via parametro da url de requisicao
        const paramId = req.params.id;
        //return res.status(201).json({id: paramId});
        //pegou os valores do form via body
        const {NOME, MARCA, ESTADO_USO, DESCRICAO, DATA, PRECO, USUARIOS_ID} = req.body;
        
        let sql = "UPDATE produtos SET NOME = ?, MARCA = ?, ESTADO_USO = ?, DESCRICAO = ?, DATA = ?, PRECO = ?, USUARIOS_ID = ? WHERE PRODUTO_ID = ?"
        const result = await pool.query(sql, [NOME, MARCA, ESTADO_USO, DESCRICAO, DATA, PRECO, USUARIOS_ID, Number(paramId)])
        const changedRows = result[0]?.changedRows;
        if(!changedRows) {
            return res.status(401).json({message: 'erro ao alterar produto!'})
        }
        const sql_select = `SELECT * from produtos where PRODUTO_ID = ?`
        const [rows] =await pool.query(sql_select, [paramId])
        return res.status(201).json(rows[0])      
    }


   
}
module.exports = ProdutoController;