
let numero = window.prompt("Informe um número. Será dito se é um número múltiplo de cinco")

/*
if (numero >= 5 && numero % 5 === 0) {
    document.write('É MÚLTIPLO DE CINCO')
} else {
    document.write('NÃO É MÚLTIPLO DE CINCO')
}
*/

if (numero < 5){
    document.write('Informe um número MAIOR que cinco')
} else if (numero % 5 === 0) {
    document.write('É MÚLTIPLO DE CINCO')
} else {
    document.write('NÃO É MÚLTIPLO DE CINCO')
}