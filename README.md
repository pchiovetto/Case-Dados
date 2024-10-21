#####Codigo:DADOS_ATRASO.sql

Análise de atrasos dos titulos.

O código SQL é dividido em duas partes principais:

Common Table Expression (CTE): A CTE tb_titulo realiza o tratamento das datas de vencimento e pagamento, convertendo os formatos de data para YYYY-MM-DD usando a função strftime. Isso facilita as operações de comparação de datas posteriores.

Consulta Principal: A consulta analisa os dados tratados, utilizando a função julianday para calcular os dias de atraso entre a data de pagamento e a data de vencimento. Os resultados incluem:

MAX_DIAS_ATRASO_1M: O maior número de dias de atraso em títulos vencidos nos últimos 30 dias.

MAX_DIAS_ATRASO_3M: O maior número de dias de atraso em títulos vencidos nos últimos 90 dias.

TOTAL_FATURADO_3M: O total faturado nos últimos 90 dias, considerando apenas os títulos vencidos.

QTD_TITULOS_BOLETO_3M: A quantidade de títulos que foram pagos através de boleto a prazo nos últimos 90 dias.

#####Codigo:DADOS_ATRASO.sql

Análise de Registros de Aplicação

Este repositório contém um script SQL para sincronizar registros entre duas fontes de dados (GCP e On-Premise) e comparar suas informações. O objetivo é identificar registros não registrados no GCP e avaliar as diferenças nos dados entre as duas tabelas.

Descrição do Código
O código é dividido em duas partes principais:

Inserção de Dados:

Utiliza CTEs (Common Table Expressions) para selecionar dados de duas fontes: application_record_gcp e application_record_local.
Realiza um INSERT na tabela application_record_gcp com registros da tabela application_record_local que ainda não existem na tabela GCP.
Comparação de Dados:

Com relacionamentos entre as tabelas via ID e not exists, foram identificados os arquivos que não fora ingeridos na CLOUD, logo podemos novamente inserir esses registros.

Realizei um JOIN entre as duas tabelas, agrupando e somando as quantidades de registros de acordo com CODE_GENDER e FLAG_OWN_CAR.
A consulta gera uma comparação das quantidades de registros para cada tabela, permitindo uma análise detalhada das diferenças.

#####Codigo:DADOS_OLEOS.py

Análise de Dados de Óleos
Este repositório contém um script Python que realiza a análise de arquivos CSV relacionados a importações de óleos, filtrando e agrupando dados relevantes para posterior ingestão no Google Cloud Platform (GCP).

Descrição do Código
O código executa as seguintes etapas:

Leitura dos Arquivos CSV: Carrega os dados dos arquivos IMP_2023.csv e IMP_2024.csv, utilizando pandas.

Unificação dos DataFrames: Combina os dados de ambos os anos em um único DataFrame.

Filtragem dos Dados: Aplica filtros para selecionar registros específicos, considerando:

CO_PAIS igual a 275 (Brasil)
CO_VIA igual a 1 (aérea)
CO_NCM igual a 33030010 (código NCM específico)
SG_UF_NCM igual a 'SP' (São Paulo)
Agrupamento e Agregação: Agrupa os dados filtrados pelos campos CO_ANO e CO_MES, somando várias colunas de interesse (QT_ESTAT, KG_LIQUIDO, VL_FOB, VL_FRETE, VL_SEGURO).

Exibição dos Resultados: Mostra o DataFrame agrupado resultante.

