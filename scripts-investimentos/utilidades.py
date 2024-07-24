DICT_PERIODICIDADE = {
    "a": 12, # anual
    "m": 1   # mensal
}

def float_para_reais(n):
    return "{:,.2f}" \
        .format(float(n)) \
        .replace('.','v') \
        .replace(',','.') \
        .replace('v',',')

def print_float_em_reais(n):
    print("R$ " + str(float_para_reais(n)))