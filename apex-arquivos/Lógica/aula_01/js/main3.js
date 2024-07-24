let valor = window.prompt('Informe o valor de um produto')
valor = parseFloat(valor)

let desconto = window.prompt('Informe o valor em porcentagem de desconto (0-100')
desconto = parseFloat(desconto)

let valorTotal = valor - (valor * desconto / 100)

document.write('<h1>' + valorTotal.toFixed(2) + '</h1>')