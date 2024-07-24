document.write('<p>Escrevendo texto com aspas simples</p>')
document.write("<p>Escrevendo texto com aspas duplas</p>")

let nome = "Matheus"
let sobreNome = " Marchi Moro"
let idade = 17

document.write('<h3>Dados do usuário</h3>')
document.write('<p>Nome completo: ' + nome + sobreNome + ' </p>')
document.write('<p>Idade: ' + idade + ' </p>')

let wNome = window.prompt('Informe seu nome')
let wSobreNome = window.prompt('Informe seu sobrenome')
let wIdade = window.prompt('Informe sua idade')

document.write('<h3>Dados do usuário</h3>')
document.write('<p>Nome completo: ' + wNome + ' ' + wSobreNome + ' </p>')
document.write('<p>Idade: ' + wIdade + ' </p>')
