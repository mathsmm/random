import utilidades as ut
from modelos.titulo_rf import TituloRF
from simuladores import juros_compostos
from comparadores import comp_titulo_rf

# juros_compostos.calcula_por_mes_e_printa()
titulos = []
titulos.append(TituloRF.CDB("CDB 125%", 1000, 1.20))
titulos.append(TituloRF.LCA("LCA 95% ", 1000, 0.95))
comp_titulo_rf.compara_em_meses_e_printa(titulos, 12)