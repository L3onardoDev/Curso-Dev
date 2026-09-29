const Input = require('readline-sync');

const Operadores = [];

for (let Operador = 0; Operador < 5; Operador++) {
    const Nome_Operadores = Input.question(`Insira o nome do operador [${Operador+1}]:  `);
    Operadores.push(Nome_Operadores);
}

for (let i = 0; i < Operadores.length; i++) {
    console.log(`${i+1} - ${Operadores[i]}`)
}