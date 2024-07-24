// Função = possui retorno
//  function    = palavra reservada
//  somar       = nome da função
//  numeroA     = parâmetro
//  numeroB     = parâmetro

//  function sem o return é um método

function somar(numeroA, numeroB) {
    return numeroA + numeroB;
}

function mostrarResultadoSoma(nrA, nrB) {
    let soma = somar(nrA, nrB);

    document.write('<h1>Resultado da Soma: ' + soma + '</h1>');
}

mostrarResultadoSoma(1, 90)
mostrarResultadoSoma(26, 56)
mostrarResultadoSoma(2, 76)

//=============================================================================================

function calcularMediaDeTresNotas(n1, n2, n3) {
    return (n1 + n2 + n3) / 3;
}

function obterMensagemDeConceito(media) {
    let mensagemDeConceito = '<h1>Conceito Insuficiente</h1>'

    if (media >= 9) {
        mensagemDeConceito = '<h1>Conceito A</h1>';
    } else if (media < 9 && media >= 7) {
        mensagemDeConceito = '<h1>Conceito B</h1>';
    } else if (media < 7 && media >= 5) {
        mensagemDeConceito = '<h1>Conceito C</h1>';
    }
    return mensagemDeConceito
}

function escreverMensagemConceito(nota1, nota2, nota3) {
    document.write(
        obterMensagemDeConceito(
            calcularMediaDeTresNotas(
                nota1, 
                nota2, 
                nota3
            )
        )
    );
}

let primeiraNota = parseFloat(window.prompt('Informe a primeira nota: '));
let segundaNota = parseFloat(window.prompt('Informe a segunda nota: '));
let terceiraNota = parseFloat(window.prompt('Informe a terceira nota: '));

escreverMensagemConceito(primeiraNota, segundaNota, terceiraNota);