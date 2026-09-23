const Input = require('readline-sync');
const {
    CalcularMaoDeObra,
    CalcularTotal,
    VerificarDesconto
} = require("./funcoesOrcamento");

const Nome_Cliente = Input.question("Insira seu nome:  ");
const Valor_Material = Input.questionFloat("Insira o valor dos materiais:  ");
const Horas_Servico = Input.question("Horas de servico:  ");

const MaoObra = CalcularMaoDeObra (Horas_Servico);
const Calculo = CalcularTotal (Valor_Material, Horas_Servico);
const Desconto = VerificarDesconto (Calculo);

console.log("\n~~~~~~ Relatorio Orcamento ~~~~~~");
console.log(`Cliente: ${Nome_Cliente}`);
console.log(`Mao De Obra: ${MaoObra}`)
console.log(`Valor Materiais: ${Valor_Material}`);
console.log(`Horas De Servico: ${Horas_Servico}`);
console.log(`Total: ${Calculo}`)
console.log(`Desconto: ${Desconto}`);
console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");