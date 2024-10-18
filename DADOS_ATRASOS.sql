--Codigo SQL para analisar os atrasos da base de titulos e ver os volumes por atraso:

--CTE para tratamentos das datas:
with tb_titulo as 
(select tt.id_revendedor, tt.vlr_pedido ,tt.forma_pagamento,
strftime('%Y-%m-%d', substr(dt_vencimento , 7, 4) || '-' || substr(dt_vencimento, 4, 2) || '-' || substr(dt_vencimento, 1, 2)) AS dt_vencimento,
strftime('%Y-%m-%d', substr(dt_pagamento , 7, 4) || '-' || substr(dt_pagamento , 4, 2) || '-' || substr(dt_pagamento , 1, 2)) AS dt_pagamento
from tb_titulos tt)

--Codigo analisando os dados, utilizando julianday, pois utilizei o dbeaver:
SELECT tr.nm_revendedor ,

  (SELECT MAX(julianday((dt_pagamento)) - julianday((dt_vencimento)))
  FROM tb_titulo
  WHERE (dt_vencimento) >= DATE('now', '-30 days')
  ) AS MAX_DIAS_ATRASO_1M,

  (SELECT MAX(julianday((dt_pagamento)) - julianday((dt_vencimento)))
   FROM tb_titulo
  WHERE dt_vencimento >= DATE('now', '-90 days')) AS MAX_DIAS_ATRASO_3M,
  
SUM(CASE WHEN dt_vencimento >= DATE('now', '-90 days') 
     THEN CAST(REPLACE(vlr_pedido, ',', '.') AS REAL)
     ELSE 0 
    END) AS TOTAL_FATURADO_3M,

COUNT(CASE WHEN dt_vencimento >= DATE('now', '-90 days') AND ( forma_pagamento = 'Boleto a Prazo') THEN 1 END) AS QTD_TITULOS_BOLETO_3M 

FROM tb_titulo tt 

left join tb_revendedor tr on tt.id_revendedor = tr.id_revendedor 

GROUP by tr.nm_revendedor

