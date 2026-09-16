const Input = require('readline-sync');

const Ciclos = Input.questionInt("Digite a quantidade de ciclos:  ");

let Acumulado = 0;

for (let Ciclo = 1; Ciclo <= 10; Ciclo++) {
    Acumulado += Ciclos;
    console.log(`Ciclo ${Ciclo} - Producao Acumulada: ${Acumulado}`);
}