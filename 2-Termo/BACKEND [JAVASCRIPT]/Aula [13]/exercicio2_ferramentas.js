const fs = require('fs');
const Input = require('readline-sync');

const Array = []

const Quantidade_Ferramentas = Input.questionInt(`Digite a quantidade de ferramentas:  `);

    for (let i = 0; i < Quantidade_Ferramentas; i++) {
        console.log(`\n~~~~~~ Nova Ferramenta - [${i+1}] ~~~~~~`)
        let Nome = Input.question("Digite o nome: ");
        let Quantidade = Input.question("Digite a quantidade: ");
        let CustoUnitario = Input.questionFloat("Custo Unitario (R$): ");

        const ListaFerramentas = {
            nome: Nome,
            quantidade: Quantidade,
            custouni: CustoUnitario
        };
        
        Array.push(ListaFerramentas);
    }

const FerramentasGravar = JSON.stringify(Array, null, 2);

fs.writeFileSync("ferramentas.json", FerramentasGravar);
console.log(`\nGravacao concluída com sucesso.`);