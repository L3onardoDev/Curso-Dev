const fs = require('fs');

const Sensores = [
{ codigo: 1, tipo: "Temperatura", leituraAtual: 51, status: "Operando" },
{ codigo: 2, tipo: "Pressão", leituraAtual: 4, status: "Alerta" },
{ codigo: 3, tipo: "Temperatura", leituraAtual: 145.5, status: "Operando" }
]

const ValoresGravados = JSON.stringify(Sensores, null, 2);

fs.writeFileSync("sensores.json", ValoresGravados);
console.log(`\nValores gravados com sucesso.`);