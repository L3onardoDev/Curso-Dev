// 1. Exercicio:

const Input = require('readline-sync');

const Nome_Produto = Input.question("Digite o nome do produto:  ");
const Quantidade_Produzida = Input.questionInt("Digite a quantidade produzida por hora:  ");
const Horas_Trabalhadas = Input.questionInt("Digite a quantidade de horas trabalhadas:  ");

const Calculo = Quantidade_Produzida * Horas_Trabalhadas;

console.log("~~~~~ Relatorio De Produção ~~~~~");
console.log(`Produto: ${Nome_Produto}`);
console.log(`Producao por hora: ${Quantidade_Produzida} por hora`);
console.log(`Horas trabalhadas: ${Horas_Trabalhadas} horas`);
console.log(`Total de pecas produzidas: ${Calculo} pecas`);
console.log("~~~~~ ~~~~~~~~~~~~~~~~~~~~~ ~~~~~");
