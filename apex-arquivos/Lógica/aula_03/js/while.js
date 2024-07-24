// let contador = 1;

// while (contador <= 10) {
//     document.write('<h3>' + contador + '</h3>');
//     contador++
// }

//=================================================================

// let numeroSolicitadoPeloUsuario = parseInt(window.prompt('Informe um número: '))
// let n = 1

// while (n <= numeroSolicitadoPeloUsuario) {
//     document.write('<h3>Escrevendo ' + n + ' de ' + numeroSolicitadoPeloUsuario + '</h3>')
//     n++
// }


// OU


let numeroSolicitadoPeloUsuario = parseInt(window.prompt('Informe um número: '))
let n = 1
let continuar = true

while (continuar) {
    document.write('<h3>Escrevendo ' + n + ' de ' + numeroSolicitadoPeloUsuario + '</h3>')
    n++
    continuar = contador <= numeroSolicitadoPeloUsuario
}
