let  Cadastro = require('../model/Cadastro');
const date = new Date();
const CadastroController = {
    async criar(req, res) {
        console.log(req.body)
        const {nome, preco, quantidade, descricao } = req.body;
      
        // const data = date.toLocaleDateString('pt-BR', {
        //     day: '2-digit',
        //     month: '2-digit',
        //     year: 'numeric',
        //     hour: '2-digit',
        //     minute: '2-digit'
        //   }).replace(',',' ');
          let imgUrl = 'http://localhost:3333/images/'
          if(req.file){
            imgUrl = imgUrl + `${req.file.filename}`

          }
       
        const novoCadastro = {
            id: Cadastros[Cadastros.length-1]?.id ? Cadastros[Cadastros.length-1]?.id+1 : 1,
            nome: nome,
           preco: preco,
           quantidade:quantidade,
           descricao:descricao,
           mensagem: mensagem,
            img: imgUrl,
        }
        let sql = `INSERT INTO posts (nome, mensagem, img, user_id)VALUES(?,?,?,?)`
        const result = await pool.query(sql,[nome, mensagem,preco, quantidade,descricao, imgUrl, 1])
        const insertId = result[0]?.insertId;
        if(!insertId){
            return res.status(401).json({message: 'erro ao criar postagem!'})
        }
        const sql_select = `SELECT * from posts where id = ?`
        const [rows] = await pool.query(sql_select, [insertId])
        Cadastros.push(novoCadastro);
        return res.status(201).json(novoCadastro)
    },
    async listar(req, res) {
        return res.status(200).json(Cadastros);
        const [rows] = await pool.query(sql);
        return res.status(200).json(rows);
       
    },
    async alterar(req, res){
        //pegar o id via parametro da url de requisiçao
        const paramId = req.params.id;
        // return res.status(201).json({id: paramId});
        const {nome, preco, quantidade, descricao} = req.body;
      
        // const data = date.toLocaleDateString('pt-BR', {
        //     day: '2-digit',
        //     month: '2-digit',
        //     year: 'numeric',
        //     hour: '2-digit',
        //     minute: '2-digit'
        //   }).replace(',',' ');
          let imgUrl = 'http://localhost:3333/images/'
          if(req.file){
            imgUrl = imgUrl + `${req.file.filename}`

          }
        //recuperar a postagem a partir do id
        
        const cadastro = Cadastros.find(cadastro => cadastro.id === parseInt(paramId) ? true : false);
        const cadastroIndex = Cadastros.findIndex(cadastro => cadastro.id === parseInt(paramId))
       
        
        // return res.status(201).json(post);
        //alterar as informaçoes
        cadastro.nome = nome;
        cadastro.cadastro = cadastro;
        cadastro.quantidade = quantidade;
        cadastro.descricao = descricao;
        cadastro.img = imgUrl;
        
        //salvar as alteraçoes

        let sql = "UPDATE posts SET nome = ?, mensagem = ?, img = ? WHERE id = ?"
        const result = await pool.query(sql, [nome, mensagem, imgUrl,Number(paramId)])
        const changedRows = result[0]?.changedRows;
    
        if(!changedRows){
            return res.status(401).json({message: 'erro ao alterar postagem!'})
        }
        const sql_select = `SELECT * from posts where id = ?`
        const [rows] = await pool.query(sql_select, [insertId])
        return res.status(201).json(rows[0])

        // Cadastros[cadastroIndex] = cadastro;

        // return res.status(201).json(cadastro);
    },
    async show(req, res) {
        const paramId = req.params.id;
        const cadastro = Cadastros.find(cadastro => cadastro.id === parseInt(paramId) ? true : false);
        return res.status(201).json(cadastro);
    },
    async deletar(req, res) {
        const paramId = req.params.id;
        const cadastroIndex = Cadastros.findIndex(cadastro => cadastro.id === parseInt(paramId))

        Cadastros = [
            ...Cadastros.slice(0, cadastroIndex),
            ...Cadastros.slice(cadastroIndex+1, Cadastros.length)
            ]
        
        return res.status(200).json({mensagem: "Cadastro deletado com sucesso!"})

    }
}
module.exports = CadastroController;