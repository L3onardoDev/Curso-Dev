const fs = require('fs');
console.log("~~~~~~ SISTEMA DE PERSISTENCIA: REGISTRO DE MÁQUINAS ~~~~~~");

const maquinasIndustriais = [
{ id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operacional: true },
{ id: 102, nome: "Fresadora Ferramenteira", setor: "Usinagem", operacional: false },
{ id: 103, nome: "Prensa Hidraulica 50T", setor: "Estampagem", operacional: true },
{ id: 104, nome: "Compressor", setor: "Utilidades", operacional: false }
];

const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2);

const nomeDoArquivo = "maquinas.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log(`\nGravacao concluída com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo}' gerado.`);