const Input = require('readline-sync');

const Banco_Dados = []

for (let i = 0; i < 6; i++) {
    console.log(`~~~~~~ Cadastro De Setores ${i+1} ~~~~~~`);
    const NovoNome = Input.question("Insira o nome do setor: ");

    Banco_Dados.push(NovoNome);
}

console.log("~~~~~~~~ Setor Cadastrado ~~~~~~~~~");
for (let i = 0; i < Banco_Dados.length; i++) {
    console.log(`${i + 1} - ${Banco_Dados[i]}`);
}