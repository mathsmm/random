function calcularMedia3Numeros(numero1, numero2, numero3) {
    return (numero1, numero2, numero3) / 3;
}

function calcularAreaRetangulo(base, altura) {
    return base * altura;
}

function calcularAreaTriangulo(base, altura) {
    return (base * altura) / 2;
}

function escreverMensagem100VezesNaTela(mensagem) {
    let contador = 1
    while (contador <= 100) {
        document.write('<p>' + contador + ' - ' + mensagem + '</p>')
        contador++
    }
}

function escreverMensagemNaTela(mensagem,quantidade) {
    let contador = 1
    while (contador <= quantidade) {
        document.write('<p>' + mensagem + '</p>')
        contador++
    }
}
