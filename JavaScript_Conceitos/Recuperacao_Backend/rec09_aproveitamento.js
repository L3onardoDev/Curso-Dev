const Input = require('readline-sync');

function CalcularAproveitamento(Util, Total) {
    return (Util / Total) * 100;
}

function ClassificarAproveitamento(Percentual) {
    if (Percentual >= 90) {
        return "EXCELENTE";
    } else if (Percentual >= 75 && Percentual <= 89.99) {
        return "ADEQUADO";
    } else {
        return "REVISAR PROCESSO";
    }
}

const Quantidade_Total = Input.questionFloat("Quantidade Total: ");
const Quantidade_Util = Input.questionFloat("Quantidade Util: ");

const Calcular = CalcularAproveitamento(Quantidade_Util, Quantidade_Total);
const Classificacao = ClassificarAproveitamento(Calcular);

console.log("\n~~~~~~ Relatorio Materia Prima ~~~~~~");
console.log(`Quantidad Total: ${Quantidade_Total}`);
console.log(`Quantidad Util: ${Quantidade_Util}`);
console.log(`Calculo: ${Calcular.toFixed(2)}%`);
console.log(`Classificação: ${Classificacao}`);
console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");