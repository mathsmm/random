let palavra = window.prompt('Informe uma palavra');

document.write(`<p>A palavra "${palavra}" contém ${palavra.length} caracteres</p>`)

//OU:

document.write(
    '<p>A palavra "'
    .concat(palavra)
    .concat('" contém ')
    .concat(palavra.length)
    .concat(' caracteres </p>')
)