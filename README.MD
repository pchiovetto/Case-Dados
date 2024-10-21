Codigo:DADOS_ATRASO.sql

O código SQL é dividido em duas partes principais:

Common Table Expression (CTE): A CTE tb_titulo realiza o tratamento das datas de vencimento e pagamento, convertendo os formatos de data para YYYY-MM-DD usando a função strftime. Isso facilita as operações de comparação de datas posteriores.

Consulta Principal: A consulta analisa os dados tratados, utilizando a função julianday para calcular os dias de atraso entre a data de pagamento e a data de vencimento. Os resultados incluem:

MAX_DIAS_ATRASO_1M: O maior número de dias de atraso em títulos vencidos nos últimos 30 dias.
MAX_DIAS_ATRASO_3M: O maior número de dias de atraso em títulos vencidos nos últimos 90 dias.
TOTAL_FATURADO_3M: O total faturado nos últimos 90 dias, considerando apenas os títulos vencidos.
QTD_TITULOS_BOLETO_3M: A quantidade de títulos que foram pagos através de boleto a prazo nos últimos 90 dias.

Codigo:DADOS_ATRASO.sql
