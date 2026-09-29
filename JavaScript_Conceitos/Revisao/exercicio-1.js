const Input = require('readline-sync');

// Minha versão:

// const Temperatura = Input.questionFloat("Informe a temperatura:  ");

// if (Temperatura <= 60) {
//     console.log(`${Temperatura}°C: NORMAL`)
// } else if (Temperatura >= 60 && Temperatura <= 80) {
//     console.log(`${Temperatura}°C: ATENCAO`)
// } else {
//     console.log(`${Temperatura}°C: CRITICA`)
// }

// Versão Professor:

const Temperatura = Input.questionFloat("Digite a temperatura:  ");

if (Temperatura <= 60) {
    console.log(`A temperatura de ${Temperatura}°C esta em um nivel NORMAL`);
} else if (Temperatura <= 80) {
    console.log(`A temperatura de ${Temperatura}°C esta em um nivel de ATENCAO`);
} else {
    console.log(`A temperatura de ${Temperatura}°C esta em um nivel de CRITICA`)
}