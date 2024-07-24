function somar(numero1, numero2) {
    return numero1 + numero2;
}

function subtrair(numero1, numero2) {
    return numero1 - numero2;
}

function multiplicar(numero1, numero2) {
    return numero1 * numero2;
}

function dividir(numero1, numero2) {
    return numero1 / numero2;
}

let n1 = 1;
let n2 = 33;

let soma = somar(n1, n2)
let subtracao = subtrair(n1, n2);
let multiplicacao = multiplicar(n1, n2);
let divisao = dividir(n1, n2);

// Quanto menos document.write utilizar, melhor.
document.write(`<p>Soma: ${soma}</p>
                <p>Subtração: ${subtracao}</p>
                <p>Multiplicação: ${multiplicacao}</p>
                <p>Divisão: ${divisao}</p>`);