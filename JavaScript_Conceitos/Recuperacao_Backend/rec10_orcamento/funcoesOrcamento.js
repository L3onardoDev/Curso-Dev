function CalcularMaoDeObra (Horas) {
    return Horas * 95;
}

function CalcularTotal (ValorMateriais, Horas) {
    const MaoDeObra = CalcularMaoDeObra(Horas);
    return ValorMateriais + MaoDeObra;
}

function VerificarDesconto (Total) {
    if (Total >= 1000) {
        console.log("DESCONTO DE 10%")
    }
    return "SEM DESCONTO";
}   

module.exports = {
    CalcularMaoDeObra,
    CalcularTotal,
    VerificarDesconto
};