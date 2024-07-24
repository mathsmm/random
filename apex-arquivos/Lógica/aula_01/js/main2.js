/* Converter uma string para número inteiro -> parseInt(variável do número) */
let numero = window.prompt('Informe um número: ')
numero = parseInt(numero)
let numeroMais20 = numero + 20
document.write('<h1>' + numeroMais20 + '</h1>')

/* Converter uma string para número flutuante (quebrado) -> parseFloat(variável do número)
toFixed(quantas casas decimais) -> limita a quantidade de casas decimais */
let valor = window.prompt('Informe o valor de um produto')
valor = parseFloat(valor)
let valorMais20 = valor + 20
document.write('<h1>' + valorMais20.toFixed(2) + '</h1>')