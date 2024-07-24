/*
    1 - Escreva uma função que calcule o valor da média de 3 números.
    2 - Escreva uma função que calcule a área de um retângulo (base X altura)
    3 - Escreva uma função que calcule a área de um triângulo (base x altura / 2)
    4 - Escreva um método que escreva uma mensagem na tela 100 vezes
    5 - Escreva um método para a impressão de mensagens
        este método deve receber como parâmetros uma mensagem
        e o número de vezes que a mensagem deve aparecer.

    OBS:    Todas as funcões e métodos devem ser chamadas para testes
            Enviar até no máximo segunda (28/09) 12:00
            diego.cugiki@hotmail.com
 */

//==================================================================================

function calcularMediaTresNumeros(numero1, numero2, numero3) {
    return (numero1 + numero2 + numero3) / 3
}


function calcularAreaRetangulo(baseRetangulo, alturaRetangulo) {
    return baseRetangulo * alturaRetangulo
}


function calcularAreaTriangulo(baseTriangulo, alturaTriangulo) {
    return (baseTriangulo * alturaTriangulo) / 2
}


function escreverMensagemCemVezes(mensagemQueVaiAparecerCemVezes) {
    let contadorMinimo = 1
    let contadorMaximo = 100
    while (contadorMinimo <= contadorMaximo) {
        document.write('<p>' + mensagemQueVaiAparecerCemVezes + '</p>')
        contadorMinimo++
    }
}


function escreverMensagem(mensagem, numeroDeVezesQueVaiAparecer) {
    let contador = 1
    while (contador <= numeroDeVezesQueVaiAparecer) {
        document.write('<h2>' + mensagem + '</h2>')
        contador++
    }
}


document.write('<h2>' + calcularMediaTresNumeros(10, 9, 8) + '</h2>')

document.write('<h2>' + calcularAreaRetangulo(5, 10) + '</h2>')

document.write('<h2>' + calcularAreaTriangulo(3, 8) + '</h2>')

escreverMensagemCemVezes("Olá, Diego")

escreverMensagem("Minhas costas doem", 3)