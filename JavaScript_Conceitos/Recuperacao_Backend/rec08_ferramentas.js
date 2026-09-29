const Input = require('readline-sync');

const Banco_Dados = []

for (let i = 0; i < 4; i++) {
    console.log(`\n~~~~~~ Estoque Ferramentas - ${i+1} ~~~~~~`);
    const Nome = Input.question("Insira o nome:  ");
    const Quantidade = Input.questionInt("Insira a quantidade:  ");
    const EstoqueMin = Input.questionInt("Insira a quantidade do estoque:  ");

    const NovaFerramenta = {
        nome: Nome,
        quantidade: Quantidade,
        estoque: EstoqueMin
    };
    
    Banco_Dados.push(NovaFerramenta);
}

console.log("\n~~~~~~ Relatorio ~~~~~~");

for (let i = 0; i < Banco_Dados.length; i++) {
    const Item = Banco_Dados[i];

    console.log(`\nNome: ${Item.nome}`)
    console.log(`Quantidade: ${Item.quantidade}`)
    console.log(`Estoque: ${Item.estoque}`)

    if (Item.quantidade < Item.estoque) {
        console.log("Situação: REPOR");
    } else {
        console.log("Situação: ESTOQUE SUFICIENTE");
    }
}