const Input = require('readline-sync');

let Soma = 0;

for (let i = 1; i <= 6; i++) {
    const Medicao = Input.questionFloat(`Digite a medicao ${i}: `);
    Soma += Medicao;
}

const Media = Soma / 6;

console.log("~~~~~~ Resultado Das Medicoes ~~~~~~");
console.log(`Soma das medicoes: ${Soma}`);
console.log(`Media Final: ${Media}`);
console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");