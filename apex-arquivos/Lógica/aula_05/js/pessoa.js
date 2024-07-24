// Variáveis = Cria-se com letra minúscula no início da palavra
// Classes = Cria-se com letra MAIÚSCULA no início da palavra

let Pessoa = {
    nome: 'Diego',
    idade: 33,

    apresentacao: function () {
        // return this.nome.concat(' - ').concat(this.idade);
        // OU:
        return `${this.nome} - ${this.idade}`;
    }
}

document.write(Pessoa.apresentacao());

