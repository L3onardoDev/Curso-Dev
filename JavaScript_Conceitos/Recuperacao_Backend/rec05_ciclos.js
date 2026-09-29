const Input = require('readline-sync');

const Quantidade_Pecas = Input.questionInt("Insira a quantidade produzida por ciclo: ");

for (let i = 0; i < 12; i++) {
    let Calculo = Quantidade_Pecas * (i + 1);
    
    console.log(`Ciclo: ${i+1} = ${Calculo}`);
}
