const express = require('express');
const usuarioController = require('../controller/UsuarioController');
const cadastroController = require('../controller/CadastroController');
const multer = require('multer');

const router = express.Router();
const crypto = require('crypto')

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

router.get('/cadastros', cadastroController.listar);

router.post('/cadastros', upload.single('img'), cadastroController.criar)

router.put('/cadastros/:id', upload.single('img'), cadastroController.alterar)

router.get('/cadastros/:id', cadastroController.show);

router.delete('/cadastros/:id', cadastroController.deletar);





module.exports = router;