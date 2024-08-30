let Usuarios = require('../model/Usuario');
const pool = require('../database/mysql');
const bcrypt = require('bcrypt');
// const date = new Date();
const UsuarioController = {
   
    async criar(req, res) {
         console.log(req.body)
         const {email, senha, nome, endereco, bairro, cidade, uf, cep} = req.body;
         
         const sql_select_existe = `SELECT * from login where email = ?`
        const [result_existe] = await pool.query(sql_select_existe, [email])
        console.log([result_existe])
        // if(result_existe[0] && result_existe[0].length > 0)
        //     return res.status(401).json({message: 'Erro ao criar usuario'})
         
         let sql = `INSERT INTO usuarios (nome, endereco, bairro, cidade, uf, cep) VALUES (?,?,?,?,?,?)`
         const result = await pool.query(sql, [nome, endereco, bairro, cidade, uf, cep])
         const insertId = result[0]?.insertId;
         if(!insertId) {
             return res.status(400).json({message: 'erro ao criar usuario!'})
         }

         //criptografa o password
        const salt = await bcrypt.genSalt(10);
        const hashSenha = await bcrypt.hash(String(senha), salt);

         let sql_login = `INSERT INTO login (usuarios_usuario_id, email, senha) VALUES (?,?,?)`
         const result_login = await pool.query(sql_login, [insertId, email, hashSenha])
         
         const sql_select = `SELECT * from usuarios where USUARIO_ID = ?`
         const [rows] =await pool.query(sql_select, [insertId])
         return res.status(201).json(rows[0])
    },
    async listar(req, res) {
        let sql = "select * from usuarios";
        const [rows] = await pool.query(sql);

        return res.status(200).json(rows);
    },

    async show(req, res) {
        const paramId = req.params.id;
        const sql_select = `SELECT * from usuarios where usuario_id = ?`
        const [rows] =await pool.query(sql_select, [Number(paramId)])
        return res.status(201).json(rows[0])
        
    },


    async deletar(req, res) {
        const paramId = req.params.id;
        let sql = `DELETE from usuarios WHERE USUARIO_ID = ?`
        const result = await pool.query(sql, [Number(paramId)])
        const affectedRows = result[0]?.affectedRows;
        if(!affectedRows) {
            return res.status(401).json({message: 'erro ao deletar usuario!'})
        }
        return res.status(200).json({mensagem: "Usuario deletado com sucesso!"})
    },

    async alterar(req, res) {
        //pegar o id via parametro da url de requisicao
        const paramId = req.params.id;
        //return res.status(201).json({id: paramId});
        //pegou os valores do form via body
        const {NOME, BAIRRO, ENDERECO, CIDADE, CEP, TELEFONE, UF} = req.body;
        
        let sql = "UPDATE usuarios SET NOME = ?, BAIRRO = ?, ENDERECO = ?, CIDADE = ?, CEP = ?, TELEFONE = ?, UF = ? WHERE USUARIO_ID = ?"
        const result = await pool.query(sql, [NOME, BAIRRO, ENDERECO, CIDADE, CEP, TELEFONE, UF, Number(paramId)])
        const changedRows = result[0]?.changedRows;
        if(!changedRows) {
            return res.status(401).json({message: 'erro ao alterar postagem!'})
        }
        const sql_select = `SELECT * from usuarios where usuario_id = ?`
        const [rows] =await pool.query(sql_select, [paramId])
        return res.status(201).json(rows[0])      
    },

}
module.exports = UsuarioController;