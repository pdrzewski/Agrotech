var database = require("../database/config");

function buscarUltimasMedidas(idSilo, limite_linhas) {

    var instrucaoSql = `SELECT temperatura, 
                        umidade, 
                        data_dado,
                        TIME(data_dado) as momento_grafico
                        FROM dados da
                        INNER JOIN sensor se
                        ON se.id = da.fkSensor
                        WHERE fkSilo = ${idSilo};
                        `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idSilo) {

    var instrucaoSql = `SELECT temperatura, 
                        umidade,
                        TIME(data_dado) as momento_grafico
                        FROM dados da
                        INNER JOIN sensor se
                        ON se.id = da.fkSensor
                        WHERE fkSilo = ${idSilo};
                        `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
