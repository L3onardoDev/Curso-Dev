// 2. Exercicio:

// Como eu fiz:

// const Input = require('readline-sync');

// const Temperatura = Input.questionFloat("Digite a temperatura:  ");

// console.log("~~~~~ Registro De Temperatura ~~~~~")
// if (Temperatura <= 60) {
//     console.log(`${Temperatura}°C: NORMAL`)
// } else if (Temperatura <= 80) {
//     console.log(`${Temperatura}°C: ATENCAO`)
// } else {
//     console.log(`${Temperatura}°C: CRITICA`)
// }
// console.log("~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~")

// Como o professor fez:

const Input = require('readline-sync');

const Temperatura = Input.questionFloat("Digite a temperatura:  ")

let Situacao;

if (Temperatura <= 60) {
    Situacao = "NORMAL"
} else if (Temperatura <= 80) {
    Situacao = "ATENCAO"
} else {
    Situacao = "CRITICA"
}

console.log(`Temperatura: ${Temperatura}°C`);
console.log(`Situacao: ${Situacao}`);