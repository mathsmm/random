import utilidades as ut


# Valor investido inicialmente
valor_inicial = 50000.00
# Valor investido mensalmente
valor_mensal = 3500.00
# Periodicidade da taxa de juros. Ela pode ser uma taxa de 10% anual por exemplo
# 'a' para anual ou 'm' para mensal
p_taxa_juros = ut.DICT_PERIODICIDADE["a"]
# Taxa de juros em porcentagem (14.15% converte para 0.1415)
taxa_juros = 10
# Periodicidade do tanto de tempo investido. Podem ser 24 meses ou 2 anos por exemplo
# 'a' para anual ou 'm' para mensal
p_tempo_investido = ut.DICT_PERIODICIDADE["a"]
# Tempo que o cara vai ficar investindo
tempo_investido = 4
# Periodicidade do tanto de tempo calculado. Podem ser 36 meses ou 3 anos por exemplo
# 'a' para anual ou 'm' para mensal
p_tempo_calculado = ut.DICT_PERIODICIDADE["a"]
# Tempo calculado
tempo_calculado = 11

def calcula_por_mes():
    """**Simula juros compostos para uma quantidade 'tempo_investido' e para uma 
    quantidade 'tempo_calculado'.**
    - 'tempo_investido' governa quantos anos ou meses o 'valor_mensal' será investido;
    - 'tempo_calculado' governa quantos anos ou meses os juros serão calculados no total.
    Por exemplo, para 2 anos de tempo investido e 3 anos de tempo calculado, o valor
    mensal será contabilizado apenas nos dois primeiros anos. Após isto, será mais
    um ano de juros sendo calculados, dando o total de 3 anos;
    - As variáveis 'p_tempo_investido' e 'p_tempo_calculado' estão relacionadas à
    periodicidade dos tempos. Podem ser anuais ou mensais. Se for mensal, 'tempo_investido'
    e 'tempo_calculado' deverão ter valores em MESES. Se for anual, deverão ter valores 
    em ANOS;
    - 'taxa_juros' possui a taxa de juros e também tem uma variável de periodicidade
    'p_taxa_juros'.<br><br>
    **Retorno:**<br>
    list -> [Número do mês, montante atual, juros ganhos]
    """
    resultado = []
    taxa_real  = taxa_juros / 100 / p_taxa_juros
    meses_investidos = range(tempo_investido * p_tempo_investido)
    meses_calculados = range(tempo_calculado * p_tempo_calculado)
    montante = valor_inicial
    for i in meses_investidos:
        montante += valor_mensal
        juros_mes = montante * taxa_real
        montante += juros_mes
        resultado.append([
            i + 1,    # Mês
            montante, # Montante atual
            juros_mes # Juros do mês
        ])
    for j in range(len(meses_investidos), len(meses_calculados)):
        juros_mes = montante * taxa_real
        montante += juros_mes
        resultado.append([
            j + 1,    # Mês
            montante, # Montante atual
            juros_mes # Juros do mês
        ])
    return resultado

def calcula_por_mes_e_printa():
    juros_acumulado = 0
    lista_resultado = calcula_por_mes()
    print("Ano\tMês\tMontante\tJuros ganhos")
    i = 0
    for l in lista_resultado:
        juros_acumulado = juros_acumulado + l[2]
        print(
            f"{((l[0]-1)//12)+1}\t" + \
            f"{((l[0]-1)%12)+1}\t" + \
            f"{ut.float_para_reais(l[1])}\t" + \
            f"{ut.float_para_reais(l[2])}"
        )
        i += 1
    print(f"Total investido: R$ {ut.float_para_reais(valor_inicial+valor_mensal*(tempo_investido*p_tempo_investido))}")
    print(f"Total de juros: R$ {ut.float_para_reais(juros_acumulado)}")
    print(f"Valor final: R$ {ut.float_para_reais(lista_resultado[-1][1])}")