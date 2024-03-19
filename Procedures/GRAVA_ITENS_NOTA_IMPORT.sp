CREATE PROCEDURE GRAVA_ITENS_NOTA_IMPORT (
    cod_produto integer,
    descricao_produto varchar(80),
    numero_nf integer,
    sequencia integer,
    aliquota_icms numeric(9,2),
    valor_ipi numeric(18,4),
    qtde_pedido numeric(9,3),
    qtde_atendida numeric(9,3),
    valor_venda numeric(18,4),
    valor_operacional numeric(18,4),
    valor_liquido numeric(18,4),
    valor_desconto numeric(18,4),
    perc_desconto numeric(9,2),
    peso_bruto numeric(9,2),
    peso_liquido numeric(9,2),
    cod_catalago varchar(30),
    tipo_doc varchar(3),
    isentantribut varchar(1),
    cod_loja integer,
    base_icms numeric(9,2),
    cfop varchar(5),
    valor_compra numeric(18,4),
    obs_item_vendido blob sub_type 0 segment size 80,
    cliente integer,
    fornecedor integer,
    cod_tipo_mov integer,
    situacao_tributaria varchar(3),
    base_icms_substituicao numeric(9,2),
    valor_icms_substituicao numeric(9,2),
    valor_icms numeric(18,4),
    desconto_extra numeric(18,4),
    aliquota_iva numeric(9,4),
    aliquota_icms_iva numeric(9,4),
    aliquota_ipi numeric(9,4),
    valor_frete numeric(18,4),
    valor_seguro numeric(18,4),
    valor_outras_despesas numeric(18,4),
    valor_outras numeric(18,4),
    coeficiente_reducao numeric(18,4),
    coeficiente_reducao_iva numeric(18,4),
    n_pedido_compra varchar(50),
    n_item_compra varchar(10),
    data_atual date)
returns (
    nota integer)
as
declare variable var_empresa integer;
declare variable var_cst_pis_cofins varchar(2);
declare variable var_pis numeric(18,4);
declare variable var_cofins numeric(18,4);
declare variable var_loja_preco integer;
BEGIN
 --SELECT CAST('TODAY' AS DATE) FROM RDB$DATABASE INTO :DATA_ATUAL;

 SELECT LOJA.EMPRESA FROM LOJA WHERE LOJA.CODIGO = :COD_LOJA INTO :VAR_EMPRESA;
 SELECT EMPRESA.preco_loja FROM EMPRESA WHERE EMPRESA.codigo = :var_empresa into :var_loja_preco;



      INSERT INTO ITENS_NOTA(COD_LOJA,COD_PRODUTO,DESCRICAO_PRODUTO,NUMERO_NF,SEQUENCIA,
                             ALIQUOTA_ICMS,VALOR_IPI,QTDE_PEDIDO,QTDE_ATENDIDA,VALOR_VENDA,
                             VALOR_OPERACIONAL,VALOR_LIQUIDO,VALOR_DESCONTO,PERC_DESCONTO,
                             PESO_BRUTO,PESO_LIQUIDO,COD_CATALAGO,TIPO_DOC,VALOR_ISENTA,
                             BASE_ICMS,CFOP, VALOR_COMPRA,OBS_ITEM_VENDIDO,COD_CLIENTE,COD_FORNECEDOR,COD_TIPO_MOV,DATA,
                             SITUACAO_TRIBUTARIA,BASE_ICMS_SUBSTITUICAO,VALOR_ICMS_SUBSTITUICAO,VALOR_ICMS,
                             DESCONTO_EXTRA,
                             ALIQUOTA_IVA,
                             ALIQUOTA_ICMS_IVA,
                             ALIQUOTA_IPI,
                             VALOR_FRETE,
                             VALOR_SEGURO,
                             VALOR_OUTRAS_DESPESAS,
                             VALOR_OUTRAS,
                             COEFICIENTE_REDUCAO,
                             COEFICIENTE_REDUCAO_IVA,
                             CST_PIS_COFINS,
                             ALIQUOTA_PIS,
                             ALIQUOTA_COFINS,
                             N_PEDIDO_COMPRA,
                             N_ITEM_COMPRA
                             )
                            VALUES
                            (:COD_LOJA, :COD_PRODUTO,:DESCRICAO_PRODUTO,:NUMERO_NF,
                            :SEQUENCIA,:ALIQUOTA_ICMS,:VALOR_IPI,:QTDE_PEDIDO,
                            :QTDE_ATENDIDA,:VALOR_VENDA,:VALOR_OPERACIONAL,
                            :VALOR_LIQUIDO,:VALOR_DESCONTO,:PERC_DESCONTO,
                            :PESO_BRUTO,:PESO_LIQUIDO,:COD_CATALAGO,
                            :TIPO_DOC,0,:BASE_ICMS,:CFOP,:VALOR_COMPRA,:OBS_ITEM_VENDIDO,:CLIENTE,:FORNECEDOR,:COD_TIPO_MOV,:DATA_ATUAL,
                            :SITUACAO_TRIBUTARIA,:BASE_ICMS_SUBSTITUICAO,:VALOR_ICMS_SUBSTITUICAO,:VALOR_ICMS,
                            :DESCONTO_EXTRA,
                            :ALIQUOTA_IVA,
                            :ALIQUOTA_ICMS_IVA,
                            :ALIQUOTA_IPI,
                            :VALOR_FRETE,
                            :VALOR_SEGURO,
                            :VALOR_OUTRAS_DESPESAS,
                            :VALOR_OUTRAS,
                            :COEFICIENTE_REDUCAO,
                            :COEFICIENTE_REDUCAO_IVA,
                            :VAR_CST_PIS_COFINS,
                            :VAR_PIS,
                            :VAR_COFINS,
                            :N_PEDIDO_COMPRA,
                            :N_ITEM_COMPRA
                            )
                            RETURNING ITENS_NOTA.NUMERO_NF INTO :NOTA;


END
