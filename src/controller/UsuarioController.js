const usuarios = require('../model/Usuario');
let  Usuarios = require('../model/Usuario');
// const date = new Date();
const UsuarioController = {
    async criar(req, res) {
        const {nomeCompleto, email, senha, rg, cpf, genero, endereco, bairro, numero, estado, cidade, complemento, dataNasc } = req.body;
       
        const novoUsuario = {
            id: Usuarios[Usuarios.length-1]?.id ? Usuarios[Usuarios.length-1]?.id+1 : 1,
            nomeCompleto:nomeCompleto,
            email:email,
            senha:senha,
            rg:rg,
            cpf:cpf,
            genero:genero,
            endereco:endereco,
            bairro:bairro,
            numero:numero,
            estado:estado,
            cidade:cidade,
            complemento:complemento,
            dataNasc:dataNasc,



        }
        Usuarios.push(novoUsuario);
        return res.status(201).json(novoUsuario)
    },
    async listar(req, res) {
        return res.status(200).json(Usuarios);
       
    },
    async alterar(req, res){
        //pegar o id via parametro da url de requisiçao
        const paramId = req.params.id;
        // return res.status(201).json({id: paramId});
        const {nomeCompleto, email, senha, rg, cpf, genero, endereco, bairro, numero, estado, cidade,complemento, dataNasc} = req.body;
        
        const usuario = Usuarios.find(usuario => usuario.id === parseInt(paramId) ? true : false);
        const usuarioIndex = Usuarios.findIndex(usuario => usuario.id === parseInt(paramId))
       
        
        //return res.status(201).json(post);
        //alterar as informaçoes
        usuario.nomeCompleto = nomeCompleto;
        usuario.email = email;
        usuario.senha = senha;
        usuario.rg = rg;
        usuario.estado = estado;
        usuario.cpf = cpf;
        usuario.senha = senha;
        usuario.genero = genero;
        usuario.endereco = endereco;
        usuario.cidade = cidade;
        usuario.estado = estado;
        usuario.bairro = bairro;
        usuario.numero = numero;
        usuario.dataNasc = dataNasc;
        usuario.complemento = complemento;

        
       

        //salvar as alteraçoes

        Usuarios[usuarioIndex] = usuario;

        return res.status(201).json(usuario);
    },
    async show(req, res) {
        const paramId = req.params.id;
        const usuario = usuarios.find(usuario => usuario.id === parseInt(paramId) ? true : false);
        return res.status(201).json(usuario);
    },
    async deletar(req, res) {
        const paramId = req.params.id;
        const usuarioIndex = Usuarios.findIndex(usuario => usuario.id === parseInt(paramId))

        Usuarios = [
            ...Usuarios.slice(0, usuarioIndex),
            ...Usuarios.slice(usuarioIndex+1, Usuarios.length)
            ]
        
        return res.status(200).json({Usuario: "Usuario deletado com sucesso!"})

    }
}
module.exports = UsuarioController;