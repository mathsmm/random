/*  Criar um método para escrever dados de um contato na tela
    contendo: Nome, Idade e E-mail.

    A apresentação deve usar <p></p>
        exemplo:
            Nome: Diego
            Idade: 33
            E-mail: diego@dominio.com
            -------------------------------

    Chamar o método para os contatos:
        Diego, 33, diego@dominio.com
        Jonathas, 31, jonathas@dominio.com
        Marcela, 28, marcela@dominio.com
        Alexandre, 22, alexandre@dominio.com
        Matheus, 17, matheus@dominio.com
        Felipe, 16, felipe@dominio.com
*/


function escreverDadosDeUmContatoNaTela(nome, idade, email) {
    document.write(`<p>Nome: ${nome}</p>
                    <p>Idade: ${idade}</p>
                    <p>E-mail: ${email}</p>
                    <p>---------------------------------------------`)
}

escreverDadosDeUmContatoNaTela("Diego", 33, "diego@dominio.com")
escreverDadosDeUmContatoNaTela("Jonathas", 31, "jonathas@dominio.com")
escreverDadosDeUmContatoNaTela("Marcela", 28, "marcela@dominio.com")
escreverDadosDeUmContatoNaTela("Alexandre", 22, "alexandre@dominio.com")
escreverDadosDeUmContatoNaTela("Matheus", 17, "matheus@dominio.com")
escreverDadosDeUmContatoNaTela("Felipe", 16, "felipe@dominio.com")