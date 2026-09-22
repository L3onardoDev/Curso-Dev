const Input = require('readline-sync');

const Banco_Dados = []

for (let i = 0; i < 4; i++) {
    console.log(`~~~ Estoque - ${i+1} ~~~`);
    const Materiais = {
        nome: Input.question("Digite o nome:  "),
        quantidade: Input.questionInt("Digite a quantidade:  "),
        estoque: Input.questionInt("Digite a quantidade do estoque minimo:  ")
    };
    
    Banco_Dados.push(Materiais);
}

console.log("~~~~~~ Relatorio Estoque ~~~~~~")

for (let i = 0; i < Banco_Dados.length; i++) {
    const Material = Banco_Dados[i];

    let Situacao;
    if (Material.quantidade < Material.estoque) {
        Situacao = "Estoque Baixo";
    } else {
        Situacao = "Estoque Ok";
    };
    console.log(`Material: ${Material.nome}`);
    console.log(`Quantidade: ${Material.quantidade}`);
    console.log(`Estoque Minimo: ${Material.estoque}`);
    console.log(`Situacao: ${Situacao}`)
    console.log("-".repeat(20))
}