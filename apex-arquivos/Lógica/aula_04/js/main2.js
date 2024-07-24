// ".length"  ->  propriedade

let nomeA = "Diego";

document.write(`<h3>O nome ${nomeA} possui ${nomeA.length} caracteres!</h3>`);

//==================================================================================

let nomeB = "Drego Cugrkr";

// Substitui apenas o primeiro caractere (o primeiro "r") que encontrar
document.write(`<h3>${nomeB} => ${nomeB.replace('r', 'i')}`);


// Substitui todos os caracteres (todos os "r") que encontrar
document.write(`<h3>${nomeB} => ${nomeB.replace(/r/g, 'i')}`);

//==================================================================================

let alunoC = "Aluno: ";
let nomeC = "Diego ";
let sobreNomeC = "Cugiki";

// Concatenar strings:
document.write(`<h3>${alunoC.concat(nomeC, sobreNomeC)}</h3>`);

//==================================================================================

function verificaSeExistePalavraNaFrase(frase, palavra) {
    let index = frase.indexOf(palavra);

    if (index > -1) {
        document.write(`<p>A frase "${frase}" contém "${palavra}"</p>`)
        document.write(`<p>Índice ${index}</p>`)
    } else {
        document.write(`<p>A frase "${frase}" NÃO contém "${palavra}"</p>`)
    }
}

let frase = "Hojé é segunda feira e tem aula de lógica!";
let palavra = window.prompt('Informe a palavra a ser procurada da frase "Hojé é segunda feira e tem aula de lógica"');

verificaSeExistePalavraNaFrase(frase, palavra)

//==================================================================================

let fraseE = "Hoje é segunda feira e tem aula de lógica!";

// Corta a frase a partir do índice de uma letra
document.write(`<h2>${fraseE.substring(0, 21)}</h2>`);
document.write(`<h2>${fraseE.substring(23)}</h2>`);

//==================================================================================

let fraseF = "Hoje é segunda feira e tem aula de lógica!";

for (let index = 0; index < fraseF.length; index++) {
    document.write(`<p>${fraseF.charAt(index)}</p>`);
}

//==================================================================================

let fraseG = "Hoje é segunda feira e tem aula de lógica!";

// Transforma para frase com letras maiúsculas e minúsculas, respectivamente
document.write(`<h2>${fraseF.toUpperCase()}</h2>`);
document.write(`<h2>${fraseF.toLowerCase()}</h2>`);