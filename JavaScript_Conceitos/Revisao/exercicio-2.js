const Input = require('readline-sync');

let Acumulador = 0; // Acumulador Iniciado Em 0.

for (let Inspecao = 1; Inspecao <= 6; Inspecao++) {
    const Valor = Input.questionFloat(`Digite a medida [${Inspecao}]:  `);
    Acumulador += Valor;
}

const Media = Acumulador / 6;

console.log(`Total de defeitos: ${Acumulador.toFixed(2)}`);
console.log(`Media de defeitos: ${Media.toFixed(2)}`)