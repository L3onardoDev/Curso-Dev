const Input = require('readline-sync');

function CalcularAproveitamento (Util, Total) {
    return (Util / Total ) * 100;
}

function ClassificarAproveitamento (Percentual) {
    if (Percentual >= 90){
        console.log("EXCELENTE" )
    } else if (Percentual >= 75 && Percentual <= 89.99) {
        console.log("ADEQUADO")
    } else {
        console.log("REVISAR PROCESSO")
    }
}