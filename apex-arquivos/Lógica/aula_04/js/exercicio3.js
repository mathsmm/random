let palavra = window.prompt('Informe uma palavra');

for (let index = 0; index < palavra.length; index++) {
    document.write(`<p>${index} - ${palavra.charAt(index)}</p>`)
}