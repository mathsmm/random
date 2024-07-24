
let opcaoDoUsuario = parseInt(
    window.prompt('1 - Sacar; 2 - Depositar; 3 - Verificar saldo')
);

let mensagemRetorno = "Opção inválida";

switch (opcaoDoUsuario) {
    case 1: mensagemRetorno = "Você escolheu a opção sacar"; break;
    case 2: mensagemRetorno = "Você escolheu a opção depositar"; break;
    case 3: mensagemRetorno = "Você escolheu a opção verificar saldo"; break;
    default: break;
}

document.write(`<p>${mensagemRetorno}</p>`);