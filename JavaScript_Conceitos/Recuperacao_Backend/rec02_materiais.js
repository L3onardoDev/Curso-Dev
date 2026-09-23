const Input = require('readline-sync');

const Nome_Peca = Input.question("Insira o nome da peca:  ");
const Quantidade_Comprada = Input.questionInt("Insira a quantidade comprada:  ");
const Valor = Input.questionFloat("Insira o preco unitario:  ");

const Calculo = Quantidade_Comprada * Valor;

console.log("~~~~~~ Nota Fiscal ~~~~~~");
console.log(`Produto: ${Nome_Peca}`);
console.log(`Quantidade: ${Quantidade_Comprada}`);
console.log(`Preco Unitario: ${Valor}`);
console.log(`Valor Total: ${Calculo.toFixed(2)}`);
console.log("~~~~~~~~~~~~~~~~~~~~~~~~~");