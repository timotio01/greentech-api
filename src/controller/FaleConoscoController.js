let  FaleConosco = require('../model/FaleConosco');
const Pool = require('../database/mysql');


// const date = new Date();
const FaleConoscoController = {
    async criar(req, res) {
        // const {nome, mensagem} = JSON.parse(req.body.post);
        const {nome, email, telefone, mensagem} = req.body
       
        // inserir no banco
        let sql = `INSERT INTO faleconosco (nome, email, telefone, mensagem) VALUES (?,?,?,?)`
        const result = await Pool.query(sql, [nome, email, telefone, mensagem])
        const insertId = result[0]?.insertId;
        if(!insertId) {
            return res.status(401).json({message: 'erro ao criar mensagem!'})
        }
        const sql_select = `SELECT * from faleconosco where faleconosco_id = ?`
        const [rows] = await Pool.query(sql_select, [insertId])
        return res.status(201).json(rows[0])
    },
    
}
module.exports = FaleConoscoController;