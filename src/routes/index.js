const express = require('express');
const usuarioController = require('../controller/UsuarioController');
const produtoController = require('../controller/ProdutoController');
const FaleConoscoController = require('../controller/FaleConoscoController');
const AnuncioController = require('../controller/AnuncioController')

const multer = require('multer');

const router = express.Router();
const crypto = require('crypto');
const AuthController = require('../controller/AuthController');


const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images/')
    },
    filename:(req, file,cb)=>{
        const extensaoArquivo = file.originalname.split('.')[1]
        const novoNomeArquivo = crypto.randomBytes(16).toString('hex');
        cb(null, `${novoNomeArquivo}.${extensaoArquivo}`);
    }
})

const upload = multer({storage});

router.get('/ping',(req, res) => {
    res.json({
        "pong" : "true"
    })
})


router.get('/usuarios', usuarioController.listar)

router.post('/usuarios', upload.single('img'), usuarioController.criar)

router.put('/usuarios/:id', upload.single('img'), usuarioController.alterar)

router.get('/usuarios/:id', usuarioController.show);

router.delete('/usuarios/:id', usuarioController.deletar);



router.get('/produtos', produtoController.listar)

router.post('/produtos', upload.single('img'), produtoController.criar)

router.put('/produtos/:id', upload.single('img'), produtoController.alterar)

router.get('/produtos/:id', produtoController.show)

router.delete('/produtos/:id', produtoController.deletar)



router.post('/faleConosco', upload.single('file'), FaleConoscoController.criar );


router.get('/anuncios', AnuncioController.listar)

router.post('/anuncios', upload.single('img'), AnuncioController.criar)

// router.put('/anuncios/:id', upload.single('img'), AnuncioController.alterar)

router.get('/anuncios/:id', AnuncioController.show)

// router.delete('/anuncios/:id', AnuncioController.deletar)

router.post('/login', AuthController.login)

module.exports = router;