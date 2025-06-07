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

function buscarMedidasEmTempoReal(idSensor) {

    var instrucaoSql = `SELECT temperatura, 
                        umidade,
                        TIME(data_dado) as momento_grafico
                        FROM dados da
                        INNER JOIN sensor se
                        ON se.id = da.fkSensor
                        WHERE fkSensor = ${idSensor}
                        ORDER BY momento_grafico;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function condicao() {
    var instrucaoSql = `SELECT da.data_dado momento_grafico,
	                    temperatura,
                        umidade,
                        da.fkSensor
                        FROM dados da
                        INNER JOIN (SELECT fkSensor, 
                                    MAX(data_dado) data_dado 
                                    FROM dados 
                                    GROUP BY fksensor) AS men
                        ON men.fksensor = da.fksensor
                        AND men.data_dado = da.data_dado;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function gerarHistorico(idSensor) {
    var instrucaoSql = `SELECT DATE_FORMAT(data_dado, '%d-%m-%y %H:%i:%s') AS data,
                        temperatura,
                        umidade
                        FROM dados
                        WHERE fkSensor = ${idSensor}
                        ORDER BY data_dado;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarSensoresDoSilo,
    condicao,
    gerarHistorico
}
