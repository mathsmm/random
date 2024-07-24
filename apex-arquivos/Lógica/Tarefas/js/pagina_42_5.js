/*
Escreva um script que solicite as 3 notas de um aluno e em seguida calcule 
o valor da média das notas. 
Caso a média seja maior ou igual a 9 escreva a mensagem “Conceito A”, 
caso a nota seja menor que 9 e maior ou igual a 7 escreva a mensagem “Conceito B”, 
caso a nota seja menor que 7 e maior ou igual a 5 escreva a mensagem “Conceito C”, 
se a nota for menor que 5 escreva a mensagem “Conceito Insuficiente”;

==========

mandem para: diego.cugiki@hotmail.com
*/

// VERSÃO 1:

// let nota1 = window.prompt("Informe a primeira nota de três")
// nota1 = parseFloat(nota1)

// if (nota1 < 0 || nota1 > 10) {
//     document.write('<h1>Coloque valores que estejam entre 0 e 10</h1>')

// } else {
//     let nota2 = window.prompt("Informe a segunda nota de três")
//     nota2 = parseFloat(nota2)

//     if (nota2 < 0 || nota2 > 10) {
//         document.write('<h1>Coloque valores que estejam entre 0 e 10</h1>')

//     } else {
//         let nota3 = window.prompt("Informe a terceira nota de três")
//         nota3 = parseFloat(nota3)

//         if (nota3 < 0 || nota3 > 10) {
//             document.write('<h1>Coloque valores que estejam entre 0 e 10</h1>')

//         } else {
//             let media = (nota1 + nota2 + nota3) / 3
//             media = parseFloat(media)
//             document.write('<h1>A média é: ' + media.toFixed(2) + '</h1>')

//             if (media >= 9 && media <= 10) {
//                 document.write('<h2>Conceito A</h2>')
//             } else if (media >= 7 && media < 9) {
//                 document.write('<h2>Conceito B</h2>')
//             } else if (media >= 5 && media < 7) {
//                 document.write('<h2>Conceito C</h2>')
//             } else {
//                 document.write('<h2>Conceito Insuficiente</h2>')
//             }
//         }
//     }
// }

// VERSÃO 2:

let nota1 = window.prompt("Informe a primeira nota de três")
nota1 = parseFloat(nota1)

let nota2 = window.prompt("Informe a primeira nota de três")
nota2 = parseFloat(nota2)

let nota3 = window.prompt("Informe a primeira nota de três")
nota3 = parseFloat(nota3)

if ((nota1 >= 0 && nota1 <= 10) && (nota2 >= 0 && nota2 <= 10) && (nota3 >= 0 && nota3 <= 10)) {
    let media = (nota1 + nota2 + nota3) / 3
    media = parseFloat(media)
    document.write('<h1>A média é: ' + media.toFixed(2) + '</h1>')

    if (media >= 9 && media <= 10) {
         document.write('<h2>Conceito A</h2>')
         } else if (media >= 7 && media < 9) {
         document.write('<h2>Conceito B</h2>')
         } else if (media >= 5 && media < 7) {
         document.write('<h2>Conceito C</h2>')
         } else {
         document.write('<h2>Conceito Insuficiente</h2>')
         }
} else {
    document.write('<h1>Coloque valores que estejam entre 0 e 10</h1>')
}