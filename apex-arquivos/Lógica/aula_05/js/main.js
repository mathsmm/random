let palavra1 = window.prompt('Informe a primeira palavra');
let palavra2 = window.prompt('Informe a segunda palavra');
let palavra3 = window.prompt('Informe a terceira palavra');
let palavra4 = window.prompt('Informe a quarta palavra');

// document.write(`<p>${palavra1} - ${palavra2} - ${palavra3} - ${palavra4}</p>`);
// OU:
// let palavrasConcatenadas = palavra1 + ' - ' + palavra2 + ' - ' + palavra3 + ' - ' + palavra4;
// OU:
// let palavrasConcatenadas = palavra1.concat(' - ' + palavra2 + ' - ' + palavra3 + ' - ' + palavra4);
// OU:
let palavrasConcatenadas = `${palavra1} - ${palavra2} - ${palavra3} - ${palavra4}`;

document.write(`<p>${palavrasConcatenadas}</p>`);