// for

function escreverNaTela10Vezes(mensagem) {
    for (let i = 0; i < 10; i++) {
        document.write('<p>' + mensagem + '</p>')
    }
}

escreverNaTela10Vezes('Matheus')

//==================================================================================

let mensagem = "Olá, boa noite!"
document.write('<h3>' + mensagem + '</h3>')

let nome = "Matheus"
let idade = 17
let email = "blabla@gmail.com"

// Aspas:
let dados1 = 'Teu nome: ' + nome + '; tua idade: ' + idade + '; teu email: ' + email;

// Interpolação de string (Crase):
let dados2 = `Teu nome: ${nome}; tua idade: ${idade}; teu email: ${email}`;

document.write(dados1 + '<br>');
document.write(dados2);