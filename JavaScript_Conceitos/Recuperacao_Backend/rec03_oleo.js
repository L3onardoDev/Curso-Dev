const Input = require('readline-sync');

const Nivel_Oleo = Input.question("Insira o nivel do oleo em %:  ");

if (Nivel_Oleo >= 40 && Nivel_Oleo <= 80) {
    console.log("Nivel Normal")
} else {
    console.log("Inpecao Necessaria")
}

console.log(`Valor Informado: ${Nivel_Oleo}%`);