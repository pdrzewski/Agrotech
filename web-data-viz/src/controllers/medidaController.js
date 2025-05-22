var medidaModel = require("../models/medidaModel");

function buscarSensoresDoSilo(req, res) {
    var idSilo = req.params.idSilo;

    medidaModel.buscarSensoresDoSilo(idSilo)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum sensor encontrado para este silo!");
            }
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 10;
    var idSilo = req.params.idSilo;
    var idSensor = req.params.idSensor;

    medidaModel.buscarUltimasMedidas(idSilo, idSensor, limite_linhas)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}


function buscarMedidasEmTempoReal(req, res) {

    var idSensor = req.params.idSensor;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idSensor).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarSensoresDoSilo
}