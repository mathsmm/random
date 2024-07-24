# from datetime import datetime

DICT_INDICADORES = {
    "cdi": 0.1168,
    "selic": 2,
    "pre_fixado": 1.0,
}

DICT_TIPOS = {
    "cdb": 1,
    "lca": 2,
    "lci": 3,
    "deb": 4,
    "cri": 5,
    "cra": 6
}

class TituloRF:
    def __init__(
        self, 
        nome: str,
        tipo: str, 
        indicador: str, 
        incide_ir: bool,
        tx_aa: float, 
        vl: float
        # venc: datetime.date
    ) -> None:
        self.nome = nome
        self.tipo = tipo
        self.indicador = indicador
        self.incide_ir = incide_ir
        self.tx_aa = tx_aa
        self.vl = vl
        # self.venc = datetime.today()

    def CDB(nome: str, valor: float, porcentagem_cdi: float):
        return TituloRF(nome, "cdb", "cdi", True, porcentagem_cdi*DICT_INDICADORES["cdi"], valor)
    
    def LCI(nome: str, valor: float, porcentagem_cdi: float):
        return TituloRF(nome, "lci", "cdi", False, porcentagem_cdi*DICT_INDICADORES["cdi"], valor)

    def LCA(nome: str, valor: float, porcentagem_cdi: float):
        return TituloRF(nome, "lca", "cdi", False, porcentagem_cdi*DICT_INDICADORES["cdi"], valor)