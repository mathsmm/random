function Pessoa(pNome, pIdade) {
    this.nome = pNome;
    this.idade = pIdade;

    this.ObterNomeEIdade = function() {
        return `Nome: ${this.nome} - Idade: ${this.idade}`;
    }
}

// Dois objetos do mesmo tipo:
let pessoaDiego = new Pessoa("Diego", 33);
let pessoaPedro = new Pessoa("Pedro", 57);
// pessoaDiego e pessoaPedro -> objetos
// Pessoa -> tipo

// Objeto: Classe com parâmetros


// Array (lista) com strings:
// "[]" -> define que é um array, uma lista
let nomes = ["Diego", "Matheus","Felipe", "Jonathas", "Marcela", "Alexandre"];

for (let i = 0; i < nomes.length; i++) {
    document.write(`<p>${nomes[i]}</p>`);
}

// Array (lista) com objetos:
// "[]" -> define que é um array, uma lista
let pessoas = [];

pessoas.push(pessoaDiego);
pessoas.push(pessoaPedro);
// Adicionou-se os objetos pessoaDiego e pessoaPedro à array pessoas

for (let i = 0; i < pessoas.length; i++) {
document.write(`<p>${pessoas[i].ObterNomeEIdade()}</p>`)
}
//pessoas[i] -> busca o objeto que está em determinado índice.
// Para i = 0, pessoas[i] = pessoaDiego
// Para i = 1, pessoas[i] = pessoaPedro