Python:

import pandas as pd

# Lendo os arquivos CSV
df_2023 = pd.read_csv('/content/IMP_2023.csv', delimiter=';', quotechar='"')
df_2024 = pd.read_csv('/content/IMP_2024.csv', delimiter=';', quotechar='"')

# Unificando os DataFrames
df_unificado = pd.concat([df_2023, df_2024], ignore_index=True)

# Filtrando os dados
df_filtrado = df_unificado[
    (df_unificado['CO_PAIS'] == 275) & 
    (df_unificado['CO_VIA'] == 1) & 
    (df_unificado['CO_NCM'] == 33030010) & 
    (df_unificado['SG_UF_NCM'] == 'SP')
]

# Agrupando pelos campos CO_ANO e CO_MES e somando várias colunas
df_agrupado = df_filtrado.groupby(['CO_ANO', 'CO_MES']).agg({
    'QT_ESTAT': 'sum',
    'KG_LIQUIDO': 'sum',
    'VL_FOB': 'sum',
    'VL_FRETE': 'sum',
    'VL_SEGURO': 'sum'
}).reset_index()

# Exibindo o DataFrame agrupado
print(df_agrupado)
