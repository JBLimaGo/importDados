CREATE PROCEDURE GRAVA_NOTA_IMPORT (
    numero_nf integer,
    cod_rep integer,
    cod_cliente integer,
    cod_prazo integer,
    cod_tipo_mov integer,
    cfop varchar(5),
    cod_transp integer,
    nome_comprador varchar(70),
    base_icms numeric(9,2),
    base_issqn numeric(9,2),
    base_icms_subst numeric(9,2),
    total_icms numeric(9,2),
    total_issqn numeric(9,2),
    total_iva numeric(9,2),
    total_ipi numeric(9,2),
    valor_icms_subst numeric(9,2),
    valor_frete numeric(9,2),
    valor_seguro numeric(9,2),
    valor_desp_acessorios numeric(9,2),
    valor_desconto numeric(9,2),
    perc_desconto numeric(9,4),
    total numeric(9,2),
    sub_total numeric(9,2),
    obs_nf varchar(300),
    cif_fob varchar(1),
    numero_pedido integer,
    cancelado varchar(1),
    comissao numeric(9,2),
    data_pedido date,
    tipo_doc varchar(3),
    entrada_saida varchar(1),
    cod_loja integer,
    data_saida date,
    faturado varchar(1),
    n_duplicata varchar(20),
    obs blob sub_type -15 segment size 80,
    cupom varchar(10),
    peso_liquido numeric(9,3),
    peso_bruto numeric(9,3),
    qtde_itens numeric(9,3),
    placa varchar(7),
    marca_modelo varchar(30),
    n_carro varchar(10),
    frota varchar(10),
    km integer,
    valor_desconto_servico numeric(9,2),
    total_servico numeric(9,2),
    usuario_nota varchar(60),
    fatura_transferencia varchar(1),
    volume integer,
    obs_nf_memo blob sub_type 0 segment size 80,
    especie varchar(60),
    cod_rep_externo integer,
    id_nfe varchar(100),
    data_faturamento date)
returns (
    nota integer)
as
declare variable cod_portador integer;
declare variable data_atual date;
declare variable imp_cupom varchar(10);
BEGIN
 --SELECT CAST('TODAY' AS DATE) FROM RDB$DATABASE INTO :DATA_ATUAL;
 SELECT CLIENTE.BANCO FROM CLIENTE WHERE CLIENTE.CODIGO = :COD_CLIENTE INTO :COD_PORTADOR;

 IF (COD_PORTADOR IS NULL) THEN
     COD_PORTADOR = 19;

 if ( (:CUPOM IS null) or (:CUPOM = '') ) then
      IMP_CUPOM = 'N';
 ELSE
 IF (:CUPOM = 'P') THEN
      IMP_CUPOM = 'P';
 ELSE
      IMP_CUPOM = 'S';

 INSERT INTO NOTA_FISCAL (NUMERO_NF, COD_REP,COD_CLIENTE,COD_PRAZO,COD_TIPO_MOV,
  COD_LOJA,CFOP,COD_TRANSP,NOME_COMPRADOR,BASE_ICMS,BASE_ISSQN,BASE_ICMS_SUBST,
  TOTAL_ICMS,TOTAL_ISSQN,TOTAL_IVA,TOTAL_IPI,VALOR_ICMS_SUBST,VALOR_FRETE,
  VALOR_SEGURO,VALOR_DESP_ACESSORIOS,VALOR_DESCONTO,PERC_DESCONTO,TOTAL,
  SUB_TOTAL,OBS_NF,CIF_FOB,NUMERO_PEDIDO,CANCELADO,
  COMISSAO,DATA_FATURAMENTO,DATA_PEDIDO,TIPO_DOC,ENTRADA_SAIDA,COD_FORNECEDOR,DATA_SAIDA,FATURADO,ECF,N_DUPLICATA,CAIXA,OBS_MEMO,
  PLACA,MARCA_MODELO,N_CARRO,FROTA,KM,VALOR_DESCONTO_SERVICO,TOTAL_SERVICO,CUPOM,
  PESO_LIQUIDO,PESO_BRUTO,QTDE_ITENS,USUARIO_NOTA,FATURA_TRANSFERENCIA,VOLUME,OBS_NF_MEMO,ESPECIE,COD_REP_EXTERNO,COD_PORTADOR,ID_NFE)
   VALUES 
 (:NUMERO_NF, :COD_REP,:COD_CLIENTE,:COD_PRAZO,:COD_TIPO_MOV,:COD_LOJA,:CFOP,
  :COD_TRANSP,:NOME_COMPRADOR,:BASE_ICMS,:BASE_ISSQN,:BASE_ICMS_SUBST,
  :TOTAL_ICMS,:TOTAL_ISSQN,:TOTAL_IVA,:TOTAL_IPI,:VALOR_ICMS_SUBST,:VALOR_FRETE,
  :VALOR_SEGURO,:VALOR_DESP_ACESSORIOS,:VALOR_DESCONTO,:PERC_DESCONTO,
  :TOTAL,:SUB_TOTAL,:OBS_NF,:CIF_FOB,:NUMERO_PEDIDO,:CANCELADO,
  :COMISSAO,:DATA_FATURAMENTO,:DATA_PEDIDO,:TIPO_DOC,:ENTRADA_SAIDA,0,:DATA_SAIDA,:FATURADO,:IMP_CUPOM,:N_DUPLICATA,'N',:OBS,
  :PLACA,:MARCA_MODELO,:N_CARRO,:FROTA,:KM,:VALOR_DESCONTO_SERVICO,:TOTAL_SERVICO,:CUPOM,
  :PESO_LIQUIDO,:PESO_BRUTO,:QTDE_ITENS,:USUARIO_NOTA,:FATURA_TRANSFERENCIA,:VOLUME,:OBS_NF_MEMO,:ESPECIE,:COD_REP_EXTERNO,:COD_PORTADOR,:ID_NFE)
  RETURNING NOTA_FISCAL.NUMERO_NF INTO :NOTA;

END
