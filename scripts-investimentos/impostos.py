
import sys

# Período e alíquota
TABELA_IR_INVESTIMENTOS = [
    (0,   180,         0.225),
    (181, 360,         0.20),
    (361, 720,         0.175),
    (721, sys.maxsize, 0.15)
]

TABELA_IR = [
    (0.00,    2259.20,            0.0),
    (2259.21, 2826.65,            0.075),
    (2826.66, 3751.05,            0.15),
    (3751.06, 4664.68,            0.225),
    (4664.68, float(sys.maxsize), 0.275)
]

def ir_investimentos(valor_ganho: float, dias_corridos: int):
    """**Retorna o 'valor_ganho' multiplicado pela alíquota do período.**<br>
    - até 180 dias: 22,5%;
    - de 181 a 360 dias: 20%;
    - de 361 a 720 dias: 17,5%;
    - acima de 720 dias: 15%.
    TODO: Fazer esta rotina consultar a tabela atualizada
    """
    for faixa in TABELA_IR_INVESTIMENTOS:
        if dias_corridos >= faixa[0] and dias_corridos <= faixa[1]:
            return valor_ganho * faixa[2]
    return None # Logicamente nunca vai retornar None

# def ir(valor: float):
#     for faixa in TABELA_IR:
#         pass

def iof(valor_ganho: float, dias_corridos: int):
    if dias_corridos >= 30:
        return 0.0
    else:
        if dias_corridos % 3 == 0:
            return valor_ganho*round(1.0-((dias_corridos//3)*0.1), 2)
        elif dias_corridos % 3 == 1:
            return valor_ganho*round((1.0-((dias_corridos//3)*0.1))-0.04, 2)
        elif dias_corridos % 3 == 2:
            return valor_ganho*round((1.0-((dias_corridos//3)*0.1))-0.07, 2)

# for i in range(1, 31):
#     print(iof(100, i))
