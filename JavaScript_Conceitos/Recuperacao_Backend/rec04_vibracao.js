const Input = require('readline-sync');

const Vibracao = Input.questionFloat("Insira o valor da vibracao:  ");

if (Vibracao < 3) {
    console.log("Situacao: ESTAVEL")
} else if (Vibracao >= 3 && Vibracao <= 6) {
    console.log("Situacao: ATENCAO")
} else {
    console.log("Situacao: CRITICA")
}

console.log(`Valor Informado: ${Vibracao}mm/s`)