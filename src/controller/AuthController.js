const pool = require('../database/mysql');
const bcrypt = require('bcrypt');

const AuthController = {
    

    async login(req, res) {
        // pega os dados do body
        const{email, senha} = req.body;
        //monta o select
        const sql_select = `SELECT * from login where email = ?`
        // retorna o select
        const [rows] =await pool.query(sql_select, [email])
        console.log(rows)
        // verifica se existe email 
        if(!rows?.length)
            return res.status(201).json({message: 'Login incorreto'})

        console.log(rows[0]?.senha)
        // compare no hash do password
        const isPasswordValid = await bcrypt.compare(String(senha), String(rows[0]?.senha) )
        console.log(isPasswordValid)
        //se nao der match ou seja password nao eh valido retorna erro
        if(!isPasswordValid)
            return res.status(201).json({message: 'Login incorreto'}) 
        //remove do json a chave password
        //delete rows[0]?.password

        const sql_select_usuario = `SELECT * from usuarios where USUARIO_ID = ?`
         const [rows_usuario] =await pool.query(sql_select_usuario, [rows[0]?.usuarios_usuario_id])
         return res.status(201).json(rows_usuario[0])


    }
}
module.exports = AuthController;