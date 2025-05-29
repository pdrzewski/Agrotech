var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/sensores/:idSilo", function (req, res) {
    medidaController.buscarSensoresDoSilo(req, res);
});

router.get("/ultimas/:idSilo/:idSensor", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idSensor", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/condicao", function (req, res) {
    medidaController.condicao(req, res);
})

module.exports = router;