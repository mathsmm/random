matriz = [
    [1, 2, -1],
    [3, 7,  4],
    [0, 3,  2]
] # Det: -19

# matriz = [
#     [1, 7], 
#     [3, 2]
# ]

# matriz = [
#     [1,2,3,4],
#     [3,4,5,2],
#     [4,3,8,2],
#     [4,4,7,2]
# ]

# Regra de chió para diminuir ordens 
# de matrizes quadradas
def rec_chio(mtx: list, len_list: int, multipliers: list = []):
    if mtx[0][0] == 0:
        return

    if len_list == 1:
        for el in multipliers:
            mtx[0][0] = mtx[0][0] * el

        return mtx

    for k in range(len_list):
        mtx[0][k] = mtx[0][k] / mtx[0][0]

    multipliers.append(mtx[0][0])

    _m = list()
    for q in range(0, len_list - 1):
        _m.append(list(range(q * 2, len_list - 1 + q * 2)))

    i = 0
    while i < len_list - 1:
        j = 0
        while j < len_list - 1: 
            _m[i][j] = mtx[i+1][j+1] - (mtx[i+1][0] * mtx[0][j+1])
            j += 1
        i += 1

    return rec_chio(_m, len(_m), multipliers)

print(rec_chio(matriz, len(matriz)))