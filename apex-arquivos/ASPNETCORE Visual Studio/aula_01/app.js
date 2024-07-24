function mudarCor(novaCor) {
    var elemento = document.getElementById("paragrafo");
    elemento.style.color = novaCor;
}

function mudarCorPelaTag() {
    var listaH2 = document.getElementsByTagName("h2");

    for (var elemento of listaH2) {
        elemento.style.color = "green";
    }
}

function mudarCorPelaClasse() {
    var listaClass = document.getElementsByClassName("classeLabel");

    for (var elemento of listaClass) {
        elemento.style.color = "red";
    }
}

function mudarCorPeloNome() {
    var listaInput = document.getElementsByName("nomeDoInput");

    for (var elemento of listaInput) {
        elemento.style.color = "blue";
    }
}

mudarCorPelaTag();
mudarCorPelaClasse();
mudarCorPeloNome();