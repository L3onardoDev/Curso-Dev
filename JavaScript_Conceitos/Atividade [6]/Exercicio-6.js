// const Input = require('readline-sync');

// const Producao_Registrada = Input.questionInt("Digite a quantidade produzida em 5 horas:  ");

// let Acumulador = 0;

// for (let i = 1; i <= 5; i++) {
//     Acumulador += Producao_Registrada;
//     const Media = Acumulador / 5;
//     console.log(`Total: ${Acumulador} - Media: ${Media}`);
// }

// Novo

const Input = require('readline-sync');

let Acumulador = 0;

for (let i = 1; i <= 5; i++) {
    const Producao_Registrada = Input.questionInt(`Digite a quantidade da hora ${i+0} :  `);
    Acumulador += Producao_Registrada;
    const Media = Acumulador / 5;
    console.log(`Total: ${Acumulador} - Media: ${Media}`);
}
