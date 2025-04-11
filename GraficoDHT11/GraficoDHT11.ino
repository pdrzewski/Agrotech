#include "DHT.h" //importa a biblioteca

#define TIPO_SENSOR DHT11 //define o tipo de sensor especificamente a DHT11
const int PINO_SENSOR_DHT11 = A0;// atribui a variável o numero da porta que consta o sensor

DHT sensorDHT(PINO_SENSOR_DHT11, TIPO_SENSOR); //passa os parametros para a função

int static_variablemin = 20;// variavel da temperatura mínima
int static_variablemax = 30;// variavel da temperatura máxima
int umidade_static_variablemin = 7;// variavel da umidade mínima
int umidade_static_variablemax = 13;// variavel da umidade máxima

void setup() {
Serial.begin(9600);//taxa de bits que é transferido entre o arduino e a porta serial usb
sensorDHT.begin();//inicia o método da biblioteca
}

void loop() { //método em loop, será executado constantemente
// variaveis float que pegam o valor através da leitura dos sensor
float umidade = sensorDHT.readHumidity(); //lê a umidade e atribui a variável umidade
float temperatura = sensorDHT.readTemperature(); //lê a temperatura e atribui a variável temperatura
umidade= umidade - 4;// ajuste para a faixa de umidade

if(isnan (temperatura) || isnan(umidade)){ //se a temperatura ou a umidade não for um númeroa
Serial.println("Erro ao ler os dados do sensor"); //printa no console e quebra a linha
}else {//se não for nulo
Serial.print(umidade); // definição da label da variavel de umidade atual
Serial.print(";");
Serial.println(temperatura);
}

delay(1000); //tempo estimado de 1 segundo
}
