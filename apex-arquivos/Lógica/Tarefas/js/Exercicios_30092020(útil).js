/*
    for (let index = frase.length; index >= 1; index--) {
        charAt(index)
    }

    1) Escreva um script que solicite uma frase ao usuário e em seguida 
    apresente a frase digitada separada em duas partes.

    Dicas:
    utilizar matematica (dividir por 2)

    Eu sou o Diego
    Eu sou 
    o Diego
*/

/*
    2) Escreva um script que solicite uma frase para o usuário 
    e em seguida escreva a frase invertida.

    Exemplo:
    Aula de lógica na quarta feira
    arief atrauq an acigól ed aluA
*/

function escreverFraseDivididaEmDuasPartes(frase) {
    let iDividido = frase.length / 2

    document.write(`<h2>${frase.substring(0, iDividido)}</h2>`)
    document.write(`<h2>${frase.substring(iDividido)}</h2>`)
}

// Solução ruim (escreve mais de um document.write):
function escreverFraseAoContrario1(frase) {
    for (let index = frase.length; index > -1; index--) {
        document.write(`${frase.charAt(index)}`)
    }
}

// Solução boa (constrói a frase antes de escrevê-la):
// Concatena cada letra à variável fraseAoContrario
function escreverFraseAoContrario2(frase) {
    let fraseAoContrario = ""
    for (let index = frase.length; index > -1; index--) {
        fraseAoContrario = fraseAoContrario + frase.charAt(index)
    }
    document.write(`<p>${fraseAoContrario}</p>`)
}

// OU:
function escreverFraseAoContrario3(frase) {
    let fraseAoContrario = ""
    for (let index = frase.length; index > -1; index--) {
        fraseAoContrario += frase.charAt(index)
    }
    document.write(`<p>${fraseAoContrario}</p>`)
}

let frase = window.prompt('Informe uma frase')
escreverFraseAoContrario1(frase)
escreverFraseAoContrario2(frase)
escreverFraseAoContrario3(frase)