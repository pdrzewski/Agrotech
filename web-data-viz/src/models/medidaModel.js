var database = require("../database/config");

function buscarSensoresDoSilo(idSilo) {
    var instrucaoSql = `SELECT id FROM sensor WHERE fkSilo = ${idSilo}`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas(idSilo, idSensor, limite_linhas) {
    var instrucaoSql = `SELECT temperatura, 
                        umidade, 
                        data_dado,
                        TIME(data_dado) as momento_grafico
                        FROM dados da
                        INNER JOIN sensor se
                        ON se.id = da.fkSensor
                        WHERE fkSilo = ${idSilo}
                        AND fkSensor = ${idSensor}
                        ORDER BY momento_grafico
                        LIMIT ${limite_linhas};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idSilo, idSensor, limite_linhas) {

    var instrucaoSql = `SELECT temperatura, 
                        umidade, 
                        data_dado,
                        TIME(data_dado) as momento_grafico
                        FROM dados da
                        INNER JOIN sensor se
                        ON se.id = da.fkSensor
                        WHERE fkSilo = ${idSilo}
                        AND fkSensor = ${idSensor}
                        ORDER BY momento_grafico
                        LIMIT ${limite_linhas};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarSensoresDoSilo
}
