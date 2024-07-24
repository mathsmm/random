import datetime
import utilidades as ut
import impostos
from modelos.titulo_rf import TituloRF

def compara_em_meses(titulos: 'list[TituloRF]', meses: int):
    resultado = []
    for t in titulos:
        tx_am = t.tx_aa/12
        ganho = (t.vl*(1+tx_am)**meses)-t.vl
        resultado.append([
            t.nome, 
            t.vl, 
            ganho-(impostos.ir_investimentos(ganho, meses*30) if t.incide_ir else 0.0)
        ])
    return resultado

def compara_em_meses_e_printa(titulos: 'list[TituloRF]', meses: int):
    resultado = compara_em_meses(titulos, meses)
    print("Nome    \tValor inicial\tGanho")
    for r in resultado:
        print(f"{r[0]}\t{ut.float_para_reais(r[1])}\t{ut.float_para_reais(r[2])}")