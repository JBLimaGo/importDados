object Data_Modulo: TData_Modulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 182
  Top = 80
  Height = 534
  Width = 814
  object DB: TpFIBDatabase
    DBName = 'C:\Jefferson\Store Moto Pecas\GUARA.FDB'
    DBParams.Strings = (
      'password=cinco.25'
      'user_name=SYSDBA')
    DefaultTransaction = TR
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 740
    Top = 20
  end
  object TR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommitRetaining
    TRParams.Strings = (
      'write'
      'isc_tpb_nowait'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 743
    Top = 94
  end
  object GRAVA_ITENS_NOTA: TpFIBStoredProc
    Transaction = TR
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE GRAVA_ITENS_NOTA_IMPORT  (?COD_PRODUTO, ?DESCR' +
        'ICAO_PRODUTO, ?NUMERO_NF, ?SEQUENCIA, ?ALIQUOTA_ICMS, ?VALOR_IPI' +
        ', ?QTDE_PEDIDO, ?QTDE_ATENDIDA, ?VALOR_VENDA, ?VALOR_OPERACIONAL' +
        ', ?VALOR_LIQUIDO, ?VALOR_DESCONTO, ?PERC_DESCONTO, ?PESO_BRUTO, ' +
        '?PESO_LIQUIDO, ?COD_CATALAGO, ?TIPO_DOC, ?ISENTANTRIBUT, ?COD_LO' +
        'JA, ?BASE_ICMS, ?CFOP, ?VALOR_COMPRA, ?OBS_ITEM_VENDIDO, ?CLIENT' +
        'E, ?FORNECEDOR, ?COD_TIPO_MOV, ?SITUACAO_TRIBUTARIA, ?BASE_ICMS_' +
        'SUBSTITUICAO, ?VALOR_ICMS_SUBSTITUICAO, ?VALOR_ICMS, ?DESCONTO_E' +
        'XTRA, ?ALIQUOTA_IVA, ?ALIQUOTA_ICMS_IVA, ?ALIQUOTA_IPI, ?VALOR_F' +
        'RETE, ?VALOR_SEGURO, ?VALOR_OUTRAS_DESPESAS, ?VALOR_OUTRAS, ?COE' +
        'FICIENTE_REDUCAO, ?COEFICIENTE_REDUCAO_IVA, ?N_PEDIDO_COMPRA,?N_' +
        'ITEM_COMPRA, ?DATA_ATUAL )')
    StoredProcName = 'GRAVA_ITENS_NOTA'
    Left = 42
    Top = 175
  end
  object Produto: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE PRODUTO'
      'SET '
      '    CODIGO_ORIGINAL = :CODIGO_ORIGINAL,'
      '    APLICACAO = :APLICACAO,'
      '    DESCRICAO = :DESCRICAO,'
      '    UNIDADE = :UNIDADE,'
      '    DATA_CADASTRO = :DATA_CADASTRO,'
      '    TIPO = :TIPO,'
      '    LINHA = :LINHA,'
      '    EQUIVALENTE = :EQUIVALENTE,'
      '    KIT = :KIT,'
      '    PRODUTO_SERVICO = :PRODUTO_SERVICO,'
      '    LIVRO_PRECO = :LIVRO_PRECO,'
      '    ARGUMENTO_VENDA = :ARGUMENTO_VENDA,'
      '    TIPO_PROMOCAO = :TIPO_PROMOCAO,'
      '    DOLAR = :DOLAR,'
      '    COD_BARRA = :COD_BARRA,'
      '    CODIGO_CATALAGO = :CODIGO_CATALAGO,'
      '    GRUPO = :GRUPO,'
      '    FORNECEDOR = :FORNECEDOR,'
      '    ORIGEM = :ORIGEM,'
      '    FOTO = :FOTO,'
      '    STATUS = :STATUS,'
      '    PESO = :PESO,'
      '    PESO_BRUTO = :PESO_BRUTO,'
      '    METRAGEM = :METRAGEM,'
      '    VENDA_S_CADASTRO = :VENDA_S_CADASTRO,'
      '    INTEIRO_FRACIONARIA = :INTEIRO_FRACIONARIA,'
      '    APLICACAO_COMPLEMENTAR = :APLICACAO_COMPLEMENTAR,'
      '    OUTRO_CODIGO = :OUTRO_CODIGO,'
      '    CODIGO_ANTERIOR = :CODIGO_ANTERIOR,'
      '    CLASS_FISCAL = :CLASS_FISCAL,'
      '    FOTO2 = :FOTO2,'
      '    FOTO3 = :FOTO3,'
      '    CODIGO_FOTO = :CODIGO_FOTO,'
      '    USUARIO_CADASTRO = :USUARIO_CADASTRO,'
      '    DESCRICAO_SINTEGRA = :DESCRICAO_SINTEGRA,'
      '    MARCA = :MARCA,'
      '    TIPO_ITEM = :TIPO_ITEM,'
      '    CST_IPI  =:CST_IPI,'
      '    SINCRONIZADO = :SINCRONIZADO,'
      '    COD_ANP =:COD_ANP,'
      '   COMISSAO_MECANICO = :COMISSAO_MECANICO'
      'WHERE'
      '    EMPRESA = :OLD_EMPRESA'
      '    and CODIGO = :OLD_CODIGO'
      '')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PRODUTO'
      'WHERE'
      '        EMPRESA = :OLD_EMPRESA'
      '    and CODIGO = :OLD_CODIGO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PRODUTO('
      '    EMPRESA,'
      '    CODIGO,'
      '    CODIGO_ORIGINAL,'
      '    APLICACAO,'
      '    DESCRICAO,'
      '    UNIDADE,'
      '    DATA_CADASTRO,'
      '    TIPO,'
      '    LINHA,'
      '    EQUIVALENTE,'
      '    KIT,'
      '    PRODUTO_SERVICO,'
      '    LIVRO_PRECO,'
      '    ARGUMENTO_VENDA,'
      '    TIPO_PROMOCAO,'
      '    DOLAR,'
      '    COD_BARRA,'
      '    CODIGO_CATALAGO,'
      '    GRUPO,'
      '    FORNECEDOR,'
      '    ORIGEM,'
      '    FOTO,'
      '    STATUS,'
      '    PESO,'
      '    PESO_BRUTO,'
      '    METRAGEM,'
      '    VENDA_S_CADASTRO,'
      '    INTEIRO_FRACIONARIA,'
      '    APLICACAO_COMPLEMENTAR,'
      '    OUTRO_CODIGO,'
      '    CODIGO_ANTERIOR,'
      '    CLASS_FISCAL,'
      '    FOTO2,'
      '    FOTO3,'
      '    CODIGO_FOTO,'
      '    USUARIO_CADASTRO,'
      '    DESCRICAO_SINTEGRA,'
      '    MARCA,'
      '    TIPO_ITEM,'
      '    CST_IPI,'
      '    SINCRONIZADO,'
      '    COD_ANP,'
      '    COMISSAO_MECANICO'
      ')'
      'VALUES('
      '    :EMPRESA,'
      '    :CODIGO,'
      '    :CODIGO_ORIGINAL,'
      '    :APLICACAO,'
      '    :DESCRICAO,'
      '    :UNIDADE,'
      '    :DATA_CADASTRO,'
      '    :TIPO,'
      '    :LINHA,'
      '    :EQUIVALENTE,'
      '    :KIT,'
      '    :PRODUTO_SERVICO,'
      '    :LIVRO_PRECO,'
      '    :ARGUMENTO_VENDA,'
      '    :TIPO_PROMOCAO,'
      '    :DOLAR,'
      '    :COD_BARRA,'
      '    :CODIGO_CATALAGO,'
      '    :GRUPO,'
      '    :FORNECEDOR,'
      '    :ORIGEM,'
      '    :FOTO,'
      '    :STATUS,'
      '    :PESO,'
      '    :PESO_BRUTO,'
      '    :METRAGEM,'
      '    :VENDA_S_CADASTRO,'
      '    :INTEIRO_FRACIONARIA,'
      '    :APLICACAO_COMPLEMENTAR,'
      '    :OUTRO_CODIGO,'
      '    :CODIGO_ANTERIOR,'
      '    :CLASS_FISCAL,'
      '    :FOTO2,'
      '    :FOTO3,'
      '    :CODIGO_FOTO,'
      '    :USUARIO_CADASTRO,'
      '    :DESCRICAO_SINTEGRA,'
      '    :MARCA,'
      '    :TIPO_ITEM,'
      '    :CST_IPI,'
      '    :SINCRONIZADO,'
      '    :COD_ANP,'
      '    :COMISSAO_MECANICO'
      ')')
    RefreshSQL.Strings = (
      'select Produto.*,'
      'Linha.Descricao as Nome_Linha,'
      'Grupo.Descricao as Nome_Grupo,'
      'Marca.Descricao as Nome_Marca,'
      'Fornecedor.RAZAO_SOCIAL as Nome_Fornecedor,'
      'Fornecedor.nome_fantasia as Nome_Fornecedor_fantasia,'
      'Unidade.Descricao as Nome_Unidade,'
      'Status_Produto.Descricao as Nome_Status,'
      'Empresa.Razao_Social as Nome_Empresa,'
      'Foto_Catalogo.descricao as Descricao_Foto'
      ' from PRODUTO'
      
        '   INNER JOIN Fornecedor         ON  (Produto.Fornecedor = Forne' +
        'cedor.Codigo)'
      
        '   INNER JOIN Unidade            ON  (Produto.Unidade = Unidade.' +
        'Unidade)'
      
        '   INNER JOIN Status_Produto     ON  (Produto.Status = Status_Pr' +
        'oduto.Codigo)'
      
        '   INNER JOIN Empresa            ON  (Produto.Empresa = Empresa.' +
        'Codigo)'
      
        '   INNER JOIN Linha              ON  (Produto.Linha = Linha.Codi' +
        'go)'
      
        '   INNER JOIN Grupo              ON  (Produto.Grupo = Grupo.Codi' +
        'go)'
      
        '   INNER JOIN Marca              ON  (Produto.Marca = Marca.Codi' +
        'go)'
      
        '   LEFT OUTER JOIN FOTO_CATALOGO ON (PRODUTO.CODIGO_FOTO = FOTO_' +
        'CATALOGO.CODIGO)'
      'where(  PRODUTO.CODIGO = :Codigo_Aux and'
      '           PRODUTO.EMPRESA = :Empresa_Aux'
      '     ) and (     PRODUTO.EMPRESA = :OLD_EMPRESA'
      '    and PRODUTO.CODIGO = :OLD_CODIGO'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select Produto.*,'
      'Linha.Descricao as Nome_Linha,'
      'Grupo.Descricao as Nome_Grupo,'
      'Marca.Descricao as Nome_Marca,'
      'Fornecedor.RAZAO_SOCIAL as Nome_Fornecedor,'
      'Fornecedor.nome_fantasia as Nome_Fornecedor_fantasia,'
      'Unidade.Descricao as Nome_Unidade,'
      'Status_Produto.Descricao as Nome_Status,'
      'Empresa.Razao_Social as Nome_Empresa,'
      'Foto_Catalogo.descricao as Descricao_Foto'
      ' from PRODUTO'
      
        '   INNER JOIN Fornecedor         ON  (Produto.Fornecedor = Forne' +
        'cedor.Codigo)'
      
        '   INNER JOIN Unidade            ON  (Produto.Unidade = Unidade.' +
        'Unidade)'
      
        '   INNER JOIN Status_Produto     ON  (Produto.Status = Status_Pr' +
        'oduto.Codigo)'
      
        '   INNER JOIN Empresa            ON  (Produto.Empresa = Empresa.' +
        'Codigo)'
      
        '   INNER JOIN Linha              ON  (Produto.Linha = Linha.Codi' +
        'go)'
      
        '   INNER JOIN Grupo              ON  (Produto.Grupo = Grupo.Codi' +
        'go)'
      
        '   INNER JOIN Marca              ON  (Produto.Marca = Marca.Codi' +
        'go)'
      
        '   LEFT OUTER JOIN FOTO_CATALOGO ON (PRODUTO.CODIGO_FOTO = FOTO_' +
        'CATALOGO.CODIGO)'
      'where PRODUTO.CODIGO = :Codigo_Aux and'
      '           PRODUTO.EMPRESA = :Empresa_Aux')
    Transaction = TR
    Database = DB
    Left = 26
    Top = 21
    object ProdutoEMPRESA: TFIBIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object ProdutoCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object ProdutoAPLICACAO: TFIBStringField
      FieldName = 'APLICACAO'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoDESCRICAO: TFIBStringField
      FieldName = 'DESCRICAO'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_ORIGINAL: TFIBStringField
      FieldName = 'CODIGO_ORIGINAL'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoUNIDADE: TFIBStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 3
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoDATA_CADASTRO: TFIBDateTimeField
      FieldName = 'DATA_CADASTRO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object ProdutoTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoLINHA: TFIBIntegerField
      FieldName = 'LINHA'
      Required = True
    end
    object ProdutoEQUIVALENTE: TFIBStringField
      FieldName = 'EQUIVALENTE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoKIT: TFIBStringField
      FieldName = 'KIT'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoPRODUTO_SERVICO: TFIBStringField
      FieldName = 'PRODUTO_SERVICO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoLIVRO_PRECO: TFIBStringField
      FieldName = 'LIVRO_PRECO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoTIPO_PROMOCAO: TFIBIntegerField
      FieldName = 'TIPO_PROMOCAO'
    end
    object ProdutoCOD_BARRA: TFIBStringField
      FieldName = 'COD_BARRA'
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_CATALAGO: TFIBStringField
      FieldName = 'CODIGO_CATALAGO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoGRUPO: TFIBIntegerField
      FieldName = 'GRUPO'
      Required = True
    end
    object ProdutoOUTRO_CODIGO: TFIBStringField
      FieldName = 'OUTRO_CODIGO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoFORNECEDOR: TFIBIntegerField
      FieldName = 'FORNECEDOR'
      Required = True
    end
    object ProdutoORIGEM: TFIBIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Required = True
    end
    object ProdutoFOTO: TFIBStringField
      FieldName = 'FOTO'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object ProdutoPESO: TFIBFloatField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object ProdutoPESO_BRUTO: TFIBFloatField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object ProdutoMETRAGEM: TFIBFloatField
      FieldName = 'METRAGEM'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object ProdutoVENDA_S_CADASTRO: TFIBStringField
      FieldName = 'VENDA_S_CADASTRO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoINTEIRO_FRACIONARIA: TFIBStringField
      DefaultExpression = #39'I'#39
      FieldName = 'INTEIRO_FRACIONARIA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_ANTERIOR: TFIBStringField
      FieldName = 'CODIGO_ANTERIOR'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCLASS_FISCAL: TFIBStringField
      FieldName = 'CLASS_FISCAL'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_LINHA: TFIBStringField
      FieldName = 'NOME_LINHA'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_FORNECEDOR: TFIBStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_UNIDADE: TFIBStringField
      FieldName = 'NOME_UNIDADE'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_STATUS: TFIBStringField
      FieldName = 'NOME_STATUS'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_EMPRESA: TFIBStringField
      FieldName = 'NOME_EMPRESA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_GRUPO: TFIBStringField
      FieldName = 'NOME_GRUPO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoDias_Atraso: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Dias_Atraso'
      Calculated = True
    end
    object ProdutoARGUMENTO_VENDA: TFIBBlobField
      FieldName = 'ARGUMENTO_VENDA'
      Size = 8
    end
    object ProdutoFOTO2: TFIBStringField
      FieldName = 'FOTO2'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoFOTO3: TFIBStringField
      FieldName = 'FOTO3'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_FOTO: TFIBIntegerField
      FieldName = 'CODIGO_FOTO'
    end
    object ProdutoDESCRICAO_FOTO: TFIBStringField
      FieldName = 'DESCRICAO_FOTO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_FORNECEDOR_FANTASIA: TFIBStringField
      FieldName = 'NOME_FORNECEDOR_FANTASIA'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoDOLAR: TFIBStringField
      FieldName = 'DOLAR'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoDESCRICAO_SINTEGRA: TFIBStringField
      FieldName = 'DESCRICAO_SINTEGRA'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoMARCA: TFIBIntegerField
      FieldName = 'MARCA'
    end
    object ProdutoUSUARIO_CADASTRO: TFIBStringField
      FieldName = 'USUARIO_CADASTRO'
      Size = 35
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoNOME_MARCA: TFIBStringField
      FieldName = 'NOME_MARCA'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoTIPO_ITEM: TFIBStringField
      FieldName = 'TIPO_ITEM'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCST_IPI: TFIBStringField
      FieldName = 'CST_IPI'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoAPLICACAO_COMPLEMENTAR: TFIBStringField
      FieldName = 'APLICACAO_COMPLEMENTAR'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoSINCRONIZADO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'SINCRONIZADO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCOD_ANP: TFIBStringField
      FieldName = 'COD_ANP'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object ProdutoCOMISSAO_MECANICO: TFIBStringField
      FieldName = 'COMISSAO_MECANICO'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object GRAVA_NOTA: TpFIBStoredProc
    Transaction = TR
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE GRAVA_NOTA_IMPORT (?NUMERO_NF, ?COD_REP, ?COD_' +
        'CLIENTE, ?COD_PRAZO, ?COD_TIPO_MOV, ?CFOP, ?COD_TRANSP, ?NOME_CO' +
        'MPRADOR, ?BASE_ICMS, ?BASE_ISSQN, ?BASE_ICMS_SUBST, ?TOTAL_ICMS,' +
        ' ?TOTAL_ISSQN, ?TOTAL_IVA, ?TOTAL_IPI, ?VALOR_ICMS_SUBST, ?VALOR' +
        '_FRETE, ?VALOR_SEGURO, ?VALOR_DESP_ACESSORIOS, ?VALOR_DESCONTO, ' +
        '?PERC_DESCONTO, ?TOTAL, ?SUB_TOTAL, ?OBS_NF, ?CIF_FOB, ?NUMERO_P' +
        'EDIDO, ?CANCELADO, ?COMISSAO, ?DATA_PEDIDO, ?TIPO_DOC, ?ENTRADA_' +
        'SAIDA, ?COD_LOJA, ?DATA_SAIDA, ?FATURADO, ?N_DUPLICATA, ?OBS, ?C' +
        'UPOM, ?PESO_LIQUIDO, ?PESO_BRUTO, ?QTDE_ITENS, ?PLACA, ?MARCA_MO' +
        'DELO, ?N_CARRO, ?FROTA, ?KM, ?VALOR_DESCONTO_SERVICO, ?TOTAL_SER' +
        'VICO, ?USUARIO_NOTA, ?FATURA_TRANSFERENCIA, ?VOLUME, ?OBS_NF_MEM' +
        'O, ?ESPECIE, ?COD_REP_EXTERNO, ?ID_NFE, ?DATA_FATURAMENTO)')
    StoredProcName = 'GRAVA_NOTA'
    Left = 38
    Top = 108
  end
  object PESQUISA_USUARIO: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      'USUARIOS'
      'WHERE USUARIOS.CODIGO =:COD_USUARIO_AUX'
      '')
    Transaction = TR
    Database = DB
    DefaultFormats.DateTimeDisplayFormat = 'hh:mm AMPM'
    Left = 118
    Top = 17
    object PESQUISA_USUARIOCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object PESQUISA_USUARIONOME: TFIBStringField
      FieldName = 'NOME'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object PESQUISA_USUARIOCOD_TURNO: TFIBIntegerField
      FieldName = 'COD_TURNO'
    end
    object PESQUISA_USUARIOLOGIN: TFIBStringField
      FieldName = 'LOGIN'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object Tipo_Mov: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE TIPO_MOV'
      'SET '
      '    GRUPO_COMISSAO = :GRUPO_COMISSAO,'
      '    ORIGEM = :ORIGEM,'
      '    FATOR_NF = :FATOR_NF,'
      '    DESTINO_VDA = :DESTINO_VDA,'
      '    DESCRICAO = :DESCRICAO,'
      '    GRUPO_MOV = :GRUPO_MOV,'
      '    TIPO_DOC = :TIPO_DOC,'
      '    CFOP = :CFOP,'
      '    ENTRADA_SAIDA = :ENTRADA_SAIDA,'
      '    VENDA_SERVICO = :VENDA_SERVICO,'
      '    VISTA_PRAZO = :VISTA_PRAZO,'
      '    INATIVO = :INATIVO,'
      '    SITUACAO = :SITUACAO,'
      '    COEFICIENTE_REDUCAO = :COEFICIENTE_REDUCAO,'
      '    CFOP_SAIDA = :CFOP_SAIDA,'
      '    CFOP_ENTRADA = :CFOP_ENTRADA,'
      '    MENSAGEM_RODAPE = :MENSAGEM_RODAPE,'
      '    MODELO = :MODELO,'
      '    OBS = :OBS,'
      '    OBS1 = :OBS1,'
      '    OBS2 = :OBS2,'
      '    OBS3 = :OBS3,'
      '   TIPO_EMISSAO = :TIPO_EMISSAO'
      'WHERE'
      '    CODIGO = :OLD_CODIGO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TIPO_MOV'
      'WHERE'
      '        CODIGO = :OLD_CODIGO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TIPO_MOV('
      '    CODIGO,'
      '    GRUPO_COMISSAO,'
      '    ORIGEM,'
      '    FATOR_NF,'
      '    DESTINO_VDA,'
      '    DESCRICAO,'
      '    GRUPO_MOV,'
      '    TIPO_DOC,'
      '    CFOP,'
      '    ENTRADA_SAIDA,'
      '    VENDA_SERVICO,'
      '    VISTA_PRAZO,'
      '    INATIVO,'
      '    SITUACAO,'
      '    COEFICIENTE_REDUCAO,'
      '    CFOP_SAIDA,'
      '    CFOP_ENTRADA,'
      '    MENSAGEM_RODAPE,'
      '    MODELO,'
      '    OBS,'
      '    OBS1,'
      '    OBS2,'
      '    OBS3,'
      '    TIPO_EMISSAO'
      ')'
      'VALUES('
      '    :CODIGO,'
      '    :GRUPO_COMISSAO,'
      '    :ORIGEM,'
      '    :FATOR_NF,'
      '    :DESTINO_VDA,'
      '    :DESCRICAO,'
      '    :GRUPO_MOV,'
      '    :TIPO_DOC,'
      '    :CFOP,'
      '    :ENTRADA_SAIDA,'
      '    :VENDA_SERVICO,'
      '    :VISTA_PRAZO,'
      '    :INATIVO,'
      '    :SITUACAO,'
      '    :COEFICIENTE_REDUCAO,'
      '    :CFOP_SAIDA,'
      '    :CFOP_ENTRADA,'
      '    :MENSAGEM_RODAPE,'
      '    :MODELO,'
      '    :OBS,'
      '    :OBS1,'
      '    :OBS2,'
      '    :OBS3,'
      '    :TIPO_EMISSAO'
      ')')
    RefreshSQL.Strings = (
      'select'
      'tipo_mov.*,'
      'tipo_doc.descricao Nome_Doc,'
      'cfo.descricao nome_cfo,'
      'modelo_doc_fiscal.descricao nome_Modelo'
      'from tipo_mov'
      '   inner join tipo_doc on (tipo_mov.tipo_doc = tipo_doc.codigo)'
      '   inner join cfo on (tipo_mov.cfop = cfo.cfo)'
      
        '   left outer join modelo_doc_fiscal on (tipo_mov.modelo = model' +
        'o_doc_fiscal.modelo)'
      'where(  '
      '   ('
      '      (tipo_mov.codigo = :codigo_aux)'
      '   ) )'
      '    and (     TIPO_MOV.CODIGO = :OLD_CODIGO'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      'tipo_mov.*,'
      'tipo_doc.descricao Nome_Doc,'
      'cfo.descricao nome_cfo,'
      'modelo_doc_fiscal.descricao nome_Modelo'
      'from tipo_mov'
      '   inner join tipo_doc on (tipo_mov.tipo_doc = tipo_doc.codigo)'
      '   inner join cfo on (tipo_mov.cfop = cfo.cfo)'
      
        '   left outer join modelo_doc_fiscal on (tipo_mov.modelo = model' +
        'o_doc_fiscal.modelo)'
      'where '
      '   ('
      '      (tipo_mov.codigo = :codigo_aux)'
      '   )')
    Transaction = TR
    Database = DB
    Left = 305
    Top = 21
    object Tipo_MovCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object Tipo_MovGRUPO_COMISSAO: TFIBIntegerField
      FieldName = 'GRUPO_COMISSAO'
    end
    object Tipo_MovORIGEM: TFIBIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Required = True
    end
    object Tipo_MovFATOR_NF: TFIBIntegerField
      FieldName = 'FATOR_NF'
    end
    object Tipo_MovDESTINO_VDA: TFIBIntegerField
      DisplayLabel = 'Destino da Venda'
      FieldName = 'DESTINO_VDA'
      Required = True
    end
    object Tipo_MovDESCRICAO: TFIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovGRUPO_MOV: TFIBIntegerField
      DisplayLabel = 'Grupo de Movimento'
      FieldName = 'GRUPO_MOV'
      Required = True
    end
    object Tipo_MovTIPO_DOC: TFIBStringField
      FieldName = 'TIPO_DOC'
      Required = True
      Size = 3
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovCFOP: TFIBStringField
      FieldName = 'CFOP'
      Required = True
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovENTRADA_SAIDA: TFIBIntegerField
      DisplayLabel = 'Entrada/Saida'
      FieldName = 'ENTRADA_SAIDA'
      Required = True
    end
    object Tipo_MovVENDA_SERVICO: TFIBIntegerField
      DisplayLabel = 'Venda/Servi'#231'o'
      FieldName = 'VENDA_SERVICO'
      Required = True
    end
    object Tipo_MovVISTA_PRAZO: TFIBIntegerField
      DisplayLabel = 'Venda a Vista / Prazo'
      FieldName = 'VISTA_PRAZO'
      Required = True
    end
    object Tipo_MovINATIVO: TFIBIntegerField
      DisplayLabel = 'Ativo / Inativo'
      FieldName = 'INATIVO'
      Required = True
    end
    object Tipo_MovSITUACAO: TFIBIntegerField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Required = True
    end
    object Tipo_MovCOEFICIENTE_REDUCAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'COEFICIENTE_REDUCAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
    end
    object Tipo_MovCFOP_SAIDA: TFIBStringField
      FieldName = 'CFOP_SAIDA'
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovCFOP_ENTRADA: TFIBStringField
      FieldName = 'CFOP_ENTRADA'
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovMENSAGEM_RODAPE: TFIBStringField
      FieldName = 'MENSAGEM_RODAPE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovMODELO: TFIBStringField
      FieldName = 'MODELO'
      Required = True
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovOBS: TFIBStringField
      FieldName = 'OBS'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovNOME_DOC: TFIBStringField
      FieldName = 'NOME_DOC'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovNOME_CFO: TFIBStringField
      FieldName = 'NOME_CFO'
      Size = 200
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovNOME_MODELO: TFIBStringField
      FieldName = 'NOME_MODELO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovOBS1: TFIBStringField
      FieldName = 'OBS1'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovOBS2: TFIBStringField
      FieldName = 'OBS2'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovOBS3: TFIBStringField
      FieldName = 'OBS3'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object Tipo_MovTIPO_EMISSAO: TFIBIntegerField
      DisplayLabel = 'Tipo de Emiss'#227'o(Proprio/Terceiro)'
      FieldName = 'TIPO_EMISSAO'
      Required = True
    end
  end
  object Cliente: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT * from cliente'
      'WHERE CLIENTE.CODIGO =:CODIGO_AUX')
    Transaction = TR
    Database = DB
    Left = 216
    Top = 14
    object ClienteCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object ClienteCGC_CPF: TFIBStringField
      FieldName = 'CGC_CPF'
      Size = 18
      EmptyStrToNull = True
    end
    object ClienteINSC_ESTADUAL: TFIBStringField
      FieldName = 'INSC_ESTADUAL'
      EmptyStrToNull = True
    end
    object ClienteTELEFONE: TFIBStringField
      FieldName = 'TELEFONE'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteFAX: TFIBStringField
      FieldName = 'FAX'
      Size = 15
      EmptyStrToNull = True
    end
    object ClientePRACA: TFIBIntegerField
      FieldName = 'PRACA'
    end
    object ClienteAT_COMERCIAL: TFIBIntegerField
      FieldName = 'AT_COMERCIAL'
    end
    object ClienteBANCO: TFIBIntegerField
      FieldName = 'BANCO'
    end
    object ClienteCOMPRADOR: TFIBStringField
      FieldName = 'COMPRADOR'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteDATA_VALIDADE: TFIBDateTimeField
      FieldName = 'DATA_VALIDADE'
    end
    object ClienteALTERA_BANCO: TFIBStringField
      FieldName = 'ALTERA_BANCO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCLIENTE_EXCLUSIVO: TFIBStringField
      FieldName = 'CLIENTE_EXCLUSIVO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteVENDA_SEM_CADASTRO: TFIBStringField
      FieldName = 'VENDA_SEM_CADASTRO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteDT_PRIM_COMPRA: TFIBDateTimeField
      FieldName = 'DT_PRIM_COMPRA'
    end
    object ClienteDT_ULT_COMPRA: TFIBDateTimeField
      FieldName = 'DT_ULT_COMPRA'
    end
    object ClienteDT_MAIOR_COMPRA: TFIBDateTimeField
      FieldName = 'DT_MAIOR_COMPRA'
    end
    object ClienteVENDEDOR_INT: TFIBIntegerField
      FieldName = 'VENDEDOR_INT'
    end
    object ClienteVENDEDOR_EXT: TFIBIntegerField
      FieldName = 'VENDEDOR_EXT'
    end
    object ClienteNOME_PAI: TFIBStringField
      FieldName = 'NOME_PAI'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteNOME_MAE: TFIBStringField
      FieldName = 'NOME_MAE'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
      EmptyStrToNull = True
    end
    object ClientePRAZO: TFIBIntegerField
      FieldName = 'PRAZO'
    end
    object ClienteEND_COBRANCA: TFIBStringField
      FieldName = 'END_COBRANCA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCONCEITO: TFIBIntegerField
      FieldName = 'CONCEITO'
    end
    object ClienteENVIAR_CARTORIO: TFIBStringField
      FieldName = 'ENVIAR_CARTORIO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteNUM_TARE: TFIBStringField
      FieldName = 'NUM_TARE'
      EmptyStrToNull = True
    end
    object ClienteCONTRIBUINTE: TFIBStringField
      FieldName = 'CONTRIBUINTE'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteLIB_CLI_ATRASO: TFIBStringField
      FieldName = 'LIB_CLI_ATRASO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteLIB_CLI_LIMITE: TFIBStringField
      FieldName = 'LIB_CLI_LIMITE'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteUSU_CLIENTE_LIMITE: TFIBStringField
      FieldName = 'USU_CLIENTE_LIMITE'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteUSU_CLIENTE_ATRASO: TFIBStringField
      FieldName = 'USU_CLIENTE_ATRASO'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteUSU_CADASTRO: TFIBStringField
      FieldName = 'USU_CADASTRO'
      Size = 52
      EmptyStrToNull = True
    end
    object ClienteCONTATO: TFIBStringField
      FieldName = 'CONTATO'
      Size = 52
      EmptyStrToNull = True
    end
    object ClienteCURVA_ABC: TFIBStringField
      FieldName = 'CURVA_ABC'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCOMENTARIO: TFIBBlobField
      FieldName = 'COMENTARIO'
      Size = 8
    end
    object ClienteCOD_TRANSP: TFIBIntegerField
      FieldName = 'COD_TRANSP'
    end
    object ClienteTAXA_COBRANCA: TFIBStringField
      FieldName = 'TAXA_COBRANCA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteINSC_RG: TFIBStringField
      FieldName = 'INSC_RG'
      EmptyStrToNull = True
    end
    object ClienteATACADO_VAREJO: TFIBStringField
      FieldName = 'ATACADO_VAREJO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteACUMULA_NF: TFIBStringField
      FieldName = 'ACUMULA_NF'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCOD_CONTABIL: TFIBIntegerField
      FieldName = 'COD_CONTABIL'
    end
    object ClienteSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
    end
    object ClienteDATA_NASCIMENTO: TFIBDateTimeField
      FieldName = 'DATA_NASCIMENTO'
    end
    object ClienteSEXO: TFIBStringField
      FieldName = 'SEXO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteESTADO: TFIBStringField
      FieldName = 'ESTADO'
      Size = 2
      EmptyStrToNull = True
    end
    object ClienteMUNICIPIO: TFIBStringField
      FieldName = 'MUNICIPIO'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteDATA_CADASTRO: TFIBDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ClienteTIPO_PESSOA: TFIBStringField
      FieldName = 'TIPO_PESSOA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteENDERECO: TFIBStringField
      FieldName = 'ENDERECO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteBAIRRO: TFIBStringField
      FieldName = 'BAIRRO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteUSU_ULT_ALTERACAO: TFIBStringField
      FieldName = 'USU_ULT_ALTERACAO'
      Size = 50
      EmptyStrToNull = True
    end
    object ClienteCOMPLEMENTO: TFIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteRAZAO_SOCIAL: TFIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteNOME_FANTASIA: TFIBStringField
      FieldName = 'NOME_FANTASIA'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteCEP: TFIBStringField
      FieldName = 'CEP'
      Size = 8
      EmptyStrToNull = True
    end
    object ClienteINICIO_ATIVIDADE: TFIBDateTimeField
      FieldName = 'INICIO_ATIVIDADE'
    end
    object ClientePREDIO_PROPRIO: TFIBStringField
      FieldName = 'PREDIO_PROPRIO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteNOME_SOCIO_1: TFIBStringField
      FieldName = 'NOME_SOCIO_1'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteCPF_SOCIO_1: TFIBStringField
      FieldName = 'CPF_SOCIO_1'
      Size = 11
      EmptyStrToNull = True
    end
    object ClienteNOME_SOCIO_2: TFIBStringField
      FieldName = 'NOME_SOCIO_2'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteCPF_SOCIO_2: TFIBStringField
      FieldName = 'CPF_SOCIO_2'
      Size = 11
      EmptyStrToNull = True
    end
    object ClienteNOME_SOCIO_3: TFIBStringField
      FieldName = 'NOME_SOCIO_3'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteCPF_SOCIO_3: TFIBStringField
      FieldName = 'CPF_SOCIO_3'
      Size = 11
      EmptyStrToNull = True
    end
    object ClienteSOCIO_OBS: TFIBBlobField
      FieldName = 'SOCIO_OBS'
      Size = 8
    end
    object ClienteLIMITE_CREDITO: TFIBFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object ClienteVALOR_PRIM_COMPRA: TFIBFloatField
      FieldName = 'VALOR_PRIM_COMPRA'
    end
    object ClienteVALOR_ULT_COMPRA: TFIBFloatField
      FieldName = 'VALOR_ULT_COMPRA'
    end
    object ClienteVALOR_MAIOR_COMPRA: TFIBFloatField
      FieldName = 'VALOR_MAIOR_COMPRA'
    end
    object ClienteICMS: TFIBFloatField
      FieldName = 'ICMS'
    end
    object ClienteVLR_MIN_FAT: TFIBFloatField
      FieldName = 'VLR_MIN_FAT'
    end
    object ClienteDESCONTO_VENDA: TFIBFloatField
      FieldName = 'DESCONTO_VENDA'
    end
    object ClienteMEDIA_ATRASO: TFIBFloatField
      FieldName = 'MEDIA_ATRASO'
    end
    object ClienteDESCONTO_ACERTO: TFIBFloatField
      FieldName = 'DESCONTO_ACERTO'
    end
    object ClienteCAPITAL: TFIBFloatField
      FieldName = 'CAPITAL'
    end
    object ClienteMEDIA_VENDAS: TFIBFloatField
      FieldName = 'MEDIA_VENDAS'
    end
    object ClienteESTOQUE: TFIBFloatField
      FieldName = 'ESTOQUE'
    end
    object ClienteALUGUEL: TFIBFloatField
      FieldName = 'ALUGUEL'
    end
    object ClienteREQUISICAO: TFIBStringField
      FieldName = 'REQUISICAO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteWEB: TFIBStringField
      FieldName = 'WEB'
      Size = 40
      EmptyStrToNull = True
    end
    object ClienteCELULAR: TFIBStringField
      FieldName = 'CELULAR'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteCOBRANCA_ESCRITURAL: TFIBStringField
      FieldName = 'COBRANCA_ESCRITURAL'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteOBS_FINANCEIRO: TFIBBlobField
      FieldName = 'OBS_FINANCEIRO'
      Size = 8
    end
    object ClienteIMP_DUPLICATA: TFIBStringField
      FieldName = 'IMP_DUPLICATA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteRECEBER_PEDIDO_E_MAIL: TFIBStringField
      FieldName = 'RECEBER_PEDIDO_E_MAIL'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteASSINATURA_DIGITAL: TFIBBlobField
      FieldName = 'ASSINATURA_DIGITAL'
      Size = 8
    end
    object ClienteRETENCAO: TFIBFloatField
      FieldName = 'RETENCAO'
    end
    object ClienteNUMERO: TFIBStringField
      FieldName = 'NUMERO'
      Size = 10
      EmptyStrToNull = True
    end
    object ClienteSUFRAMA: TFIBStringField
      FieldName = 'SUFRAMA'
      EmptyStrToNull = True
    end
    object ClienteCONSUMIDOR_REVENDA: TFIBStringField
      FieldName = 'CONSUMIDOR_REVENDA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteOVER_PRICE: TFIBFloatField
      FieldName = 'OVER_PRICE'
    end
    object ClienteCONSUMIDOR: TFIBStringField
      FieldName = 'CONSUMIDOR'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteSALDO_CREDITO: TFIBFloatField
      FieldName = 'SALDO_CREDITO'
    end
    object ClienteOBS_NF: TFIBStringField
      FieldName = 'OBS_NF'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteFORMA_PGTO: TFIBIntegerField
      FieldName = 'FORMA_PGTO'
    end
    object ClienteOBS_ADMINISTRACAO: TFIBBlobField
      FieldName = 'OBS_ADMINISTRACAO'
      Size = 8
    end
    object ClienteFOTO: TFIBStringField
      FieldName = 'FOTO'
      Size = 80
      EmptyStrToNull = True
    end
    object ClientePLANO_CONTA: TFIBStringField
      FieldName = 'PLANO_CONTA'
      Size = 11
      EmptyStrToNull = True
    end
    object ClienteESTADO_CIVIL: TFIBStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteNOME_CONJUGE: TFIBStringField
      FieldName = 'NOME_CONJUGE'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteVALOR_ALUGUEL: TFIBFloatField
      FieldName = 'VALOR_ALUGUEL'
    end
    object ClienteCASA_PROPRIA: TFIBStringField
      FieldName = 'CASA_PROPRIA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteLOCAL_TRABALHO: TFIBStringField
      FieldName = 'LOCAL_TRABALHO'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteFUNCAO_TRABALHO: TFIBStringField
      FieldName = 'FUNCAO_TRABALHO'
      Size = 60
      EmptyStrToNull = True
    end
    object ClienteSINCRONIZADO: TFIBStringField
      FieldName = 'SINCRONIZADO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCOD_GRUPO_TRIBUTO: TFIBIntegerField
      FieldName = 'COD_GRUPO_TRIBUTO'
    end
    object ClienteRECEBER_SMS: TFIBStringField
      FieldName = 'RECEBER_SMS'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteIMP_MINUTA: TFIBStringField
      FieldName = 'IMP_MINUTA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCOD_USU_ULT_ALTERACAO: TFIBIntegerField
      FieldName = 'COD_USU_ULT_ALTERACAO'
    end
    object ClienteCOD_CONTA_CORRENTE: TFIBIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object ClientePARCELAR_SUBSTITUICAO: TFIBStringField
      FieldName = 'PARCELAR_SUBSTITUICAO'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteTAXA_ENTREGA: TFIBBCDField
      FieldName = 'TAXA_ENTREGA'
      Size = 2
    end
    object ClienteINSC_MUNICIPAL: TFIBStringField
      FieldName = 'INSC_MUNICIPAL'
      EmptyStrToNull = True
    end
    object ClienteDATA_NASCIMENTO_SOCIO1: TFIBDateTimeField
      FieldName = 'DATA_NASCIMENTO_SOCIO1'
    end
    object ClienteDATA_NASCIMENTO_SOCIO2: TFIBDateTimeField
      FieldName = 'DATA_NASCIMENTO_SOCIO2'
    end
    object ClienteDATA_NASCIMENTO_SOCIO3: TFIBDateTimeField
      FieldName = 'DATA_NASCIMENTO_SOCIO3'
    end
    object ClienteINFORMAR_PEDIDO_COMPRA_VENDA: TFIBStringField
      FieldName = 'INFORMAR_PEDIDO_COMPRA_VENDA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClientePERC_PIS: TFIBFloatField
      FieldName = 'PERC_PIS'
    end
    object ClientePERC_COFINS: TFIBFloatField
      FieldName = 'PERC_COFINS'
    end
    object ClientePERC_IRRF: TFIBFloatField
      FieldName = 'PERC_IRRF'
    end
    object ClientePERC_CSLL: TFIBFloatField
      FieldName = 'PERC_CSLL'
    end
    object ClienteFAIXA_FATURAMENTO: TFIBFloatField
      FieldName = 'FAIXA_FATURAMENTO'
    end
    object ClienteIMP_BOLETO: TFIBStringField
      FieldName = 'IMP_BOLETO'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object Itens_Compra: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE ITENS_COMPRA'
      'SET '
      '    COD_PRODUTO = :COD_PRODUTO,'
      '    VALOR_UNIT = :VALOR_UNIT,'
      '    DESCONTO = :DESCONTO,'
      '    ICMS = :ICMS,'
      '    IPI = :IPI,'
      '    QTDE = :QTDE,'
      '    PENDENCIA = :PENDENCIA,'
      '    SEQUENCIA = :SEQUENCIA,'
      '    TIPO_DOC_GARANTIA = :TIPO_DOC_GARANTIA,'
      '    CFOP = :CFOP,'
      '    DESCONTO_EXTRA = :DESCONTO_EXTRA,'
      '    BASE_ICMS = :BASE_ICMS,'
      '    VALOR_ICMS = :VALOR_ICMS,'
      '    VALOR_ISENTA = :VALOR_ISENTA,'
      '    VALOR_OUTRAS = :VALOR_OUTRAS,'
      '    VALOR_LIQUIDO = :VALOR_LIQUIDO,'
      '    BASE_ICMS_SUBSTITUICAO = :BASE_ICMS_SUBSTITUICAO,'
      '    VALOR_ICMS_SUBSTITUICAO = :VALOR_ICMS_SUBSTITUICAO,'
      '    VALOR_IPI = :VALOR_IPI,'
      '    COEFICIENTE_REDUCAO = :COEFICIENTE_REDUCAO,'
      '    IVA_SUBSTITUICAO = :IVA_SUBSTITUICAO,'
      '    ICMS_SUBSTITUICAO = :ICMS_SUBSTITUICAO,'
      '    QTDE_CONFERENCIA = :QTDE_CONFERENCIA,'
      '    SITUACAO_TRIBUTARIA = :SITUACAO_TRIBUTARIA,'
      '    VLR_DESCONTO_UNITARIO = :VLR_DESCONTO_UNITARIO,'
      '    ALIQUOTA_REDUCAO = :ALIQUOTA_REDUCAO,'
      '    ALIQUOTA_SUBSTITUICAO = :ALIQUOTA_SUBSTITUICAO,'
      '    VALOR_FRETE = :VALOR_FRETE,'
      '    VALOR_OUTRAS_DESPESAS = :VALOR_OUTRAS_DESPESAS,'
      '    VALOR_SEGURO = :VALOR_SEGURO,'
      '    COEFICIENTE_REDUCAO_IVA = :COEFICIENTE_REDUCAO_IVA,'
      '    CST_PIS_COFINS = :CST_PIS_COFINS,'
      '    PIS = :PIS,'
      '    COFINS = :COFINS,'
      '    BASE_PIS = :BASE_PIS,'
      '    BASE_COFINS = :BASE_COFINS,'
      '    VALOR_PIS = :VALOR_PIS,'
      '    VALOR_COFINS = :VALOR_COFINS'
      'WHERE'
      '    COD_LOJA = :OLD_COD_LOJA'
      '    and DATA_NOTA = :OLD_DATA_NOTA'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and NUM_NOTA = :OLD_NUM_NOTA'
      '    and COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and NUMERO_GARANTIA = :OLD_NUMERO_GARANTIA'
      '    and SEQUENCIA = :OLD_SEQUENCIA'
      ''
      '')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ITENS_COMPRA'
      'WHERE'
      '        COD_LOJA = :OLD_COD_LOJA'
      '    and DATA_NOTA = :OLD_DATA_NOTA'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and NUM_NOTA = :OLD_NUM_NOTA'
      '    and COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and NUMERO_GARANTIA = :OLD_NUMERO_GARANTIA'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ITENS_COMPRA('
      '    COD_LOJA,'
      '    DATA_NOTA,'
      '    COD_FORNECEDOR,'
      '    NUM_NOTA,'
      '    COD_PRODUTO,'
      '    VALOR_UNIT,'
      '    DESCONTO,'
      '    ICMS,'
      '    IPI,'
      '    QTDE,'
      '    PENDENCIA,'
      '    SEQUENCIA,'
      '    NUMERO_GARANTIA,'
      '    TIPO_DOC_GARANTIA,'
      '    CFOP,'
      '    DESCONTO_EXTRA,'
      '    BASE_ICMS,'
      '    VALOR_ICMS,'
      '    VALOR_ISENTA,'
      '    VALOR_OUTRAS,'
      '    VALOR_LIQUIDO,'
      '    BASE_ICMS_SUBSTITUICAO,'
      '    VALOR_ICMS_SUBSTITUICAO,'
      '    VALOR_IPI,'
      '    COEFICIENTE_REDUCAO,'
      '    IVA_SUBSTITUICAO,'
      '    ICMS_SUBSTITUICAO,'
      '    QTDE_CONFERENCIA,'
      '    SITUACAO_TRIBUTARIA,'
      '    VLR_DESCONTO_UNITARIO,'
      '    ALIQUOTA_REDUCAO,'
      '    ALIQUOTA_SUBSTITUICAO,'
      '    VALOR_FRETE,'
      '    VALOR_OUTRAS_DESPESAS,'
      '    VALOR_SEGURO,'
      '    COEFICIENTE_REDUCAO_IVA,'
      '    PIS,'
      '    COFINS,'
      '    BASE_PIS,'
      '    BASE_COFINS,'
      '    VALOR_PIS,'
      '    VALOR_COFINS,'
      '    CST_PIS_COFINS'
      ')'
      'VALUES('
      '    :COD_LOJA,'
      '    :DATA_NOTA,'
      '    :COD_FORNECEDOR,'
      '    :NUM_NOTA,'
      '    :COD_PRODUTO,'
      '    :VALOR_UNIT,'
      '    :DESCONTO,'
      '    :ICMS,'
      '    :IPI,'
      '    :QTDE,'
      '    :PENDENCIA,'
      '    :SEQUENCIA,'
      '    :NUMERO_GARANTIA,'
      '    :TIPO_DOC_GARANTIA,'
      '    :CFOP,'
      '    :DESCONTO_EXTRA,'
      '    :BASE_ICMS,'
      '    :VALOR_ICMS,'
      '    :VALOR_ISENTA,'
      '    :VALOR_OUTRAS,'
      '    :VALOR_LIQUIDO,'
      '    :BASE_ICMS_SUBSTITUICAO,'
      '    :VALOR_ICMS_SUBSTITUICAO,'
      '    :VALOR_IPI,'
      '    :COEFICIENTE_REDUCAO,'
      '    :IVA_SUBSTITUICAO,'
      '    :ICMS_SUBSTITUICAO,'
      '    :QTDE_CONFERENCIA,'
      '    :SITUACAO_TRIBUTARIA,'
      '    :VLR_DESCONTO_UNITARIO,'
      '    :ALIQUOTA_REDUCAO,'
      '    :ALIQUOTA_SUBSTITUICAO,'
      '    :VALOR_FRETE,'
      '    :VALOR_OUTRAS_DESPESAS,'
      '    :VALOR_SEGURO,'
      '    :COEFICIENTE_REDUCAO_IVA,'
      '    :PIS,'
      '    :COFINS,'
      '    :BASE_PIS,'
      '    :BASE_COFINS,'
      '    :VALOR_PIS,'
      '    :VALOR_COFINS,'
      '    :CST_PIS_COFINS'
      ')')
    RefreshSQL.Strings = (
      'select itens_compra.*,'
      'Produto.aplicacao,'
      'Produto.CODIGO_CATALAGO,'
      'produto_preco.icms_devido as ICMS_DEVIDO,'
      'produto_preco.rentab_vda as Rentab_Varejo,'
      'produto_preco.rentab_atc as Rentab_Atacado'
      ''
      'from Itens_compra'
      '   inner join loja on (itens_compra.cod_loja = loja.codigo)'
      '   inner join empresa on (loja.empresa = empresa.codigo)'
      
        '   inner join produto on (itens_compra.cod_produto = produto.cod' +
        'igo)'
      
        '   inner join produto_preco on (itens_compra.cod_produto = produ' +
        'to_preco.cod_produto) and (itens_compra.cod_loja = produto_preco' +
        '.loja)'
      ''
      'where(  '
      'Itens_compra.cod_loja  = :cod_loja and'
      'Itens_compra.num_nota  = :num_nota and'
      'Itens_compra.data_nota = :data_nota and'
      'Itens_compra.cod_fornecedor = :cod_fornecedor'
      '     ) and (     ITENS_COMPRA.COD_LOJA = :OLD_COD_LOJA'
      '    and ITENS_COMPRA.DATA_NOTA = :OLD_DATA_NOTA'
      '    and ITENS_COMPRA.COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and ITENS_COMPRA.NUM_NOTA = :OLD_NUM_NOTA'
      '    and ITENS_COMPRA.COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and ITENS_COMPRA.NUMERO_GARANTIA = :OLD_NUMERO_GARANTIA'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select itens_compra.*,'
      'Produto.aplicacao,'
      'Produto.CODIGO_CATALAGO,'
      'produto_preco.icms_devido as ICMS_DEVIDO,'
      'produto_preco.rentab_vda as Rentab_Varejo,'
      'produto_preco.rentab_atc as Rentab_Atacado'
      ''
      'from Itens_compra'
      '   inner join loja on (itens_compra.cod_loja = loja.codigo)'
      '   inner join empresa on (loja.empresa = empresa.codigo)'
      
        '   inner join produto on (itens_compra.cod_produto = produto.cod' +
        'igo)'
      
        '   inner join produto_preco on (itens_compra.cod_produto = produ' +
        'to_preco.cod_produto) and (itens_compra.cod_loja = produto_preco' +
        '.loja)'
      ''
      'where '
      'Itens_compra.cod_loja  = :cod_loja and'
      'Itens_compra.num_nota  = :num_nota and'
      'Itens_compra.data_nota = :data_nota and'
      'Itens_compra.cod_fornecedor = :cod_fornecedor')
    Transaction = TR
    Database = DB
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 199
    Top = 167
    object Itens_CompraCOD_LOJA: TFIBIntegerField
      DisplayWidth = 10
      FieldName = 'COD_LOJA'
    end
    object Itens_CompraDATA_NOTA: TFIBDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_NOTA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object Itens_CompraNUM_NOTA: TFIBIntegerField
      DisplayWidth = 10
      FieldName = 'NUM_NOTA'
    end
    object Itens_CompraCOD_FORNECEDOR: TFIBIntegerField
      DisplayWidth = 10
      FieldName = 'COD_FORNECEDOR'
    end
    object Itens_CompraCOD_PRODUTO: TFIBIntegerField
      DisplayWidth = 10
      FieldName = 'COD_PRODUTO'
    end
    object Itens_CompraICMS: TFIBFloatField
      DisplayWidth = 10
      FieldName = 'ICMS'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_CompraIPI: TFIBFloatField
      DisplayWidth = 10
      FieldName = 'IPI'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_CompraVALOR_UNIT: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_UNIT'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraDESCONTO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraQTDE: TFIBFloatField
      DisplayWidth = 10
      FieldName = 'QTDE'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_CompraAPLICACAO: TFIBStringField
      DisplayWidth = 50
      FieldName = 'APLICACAO'
      Size = 70
      EmptyStrToNull = True
    end
    object Itens_CompraCODIGO_CATALAGO: TFIBStringField
      DisplayWidth = 30
      FieldName = 'CODIGO_CATALAGO'
      Size = 30
      EmptyStrToNull = True
    end
    object Itens_CompraICMS_DEVIDO: TFIBFloatField
      DefaultExpression = '0'
      DisplayWidth = 10
      FieldName = 'ICMS_DEVIDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_CompraRENTAB_VAREJO: TFIBFloatField
      DefaultExpression = '0'
      DisplayWidth = 10
      FieldName = 'RENTAB_VAREJO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
    end
    object Itens_CompraRENTAB_ATACADO: TFIBFloatField
      DefaultExpression = '0'
      DisplayWidth = 10
      FieldName = 'RENTAB_ATACADO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
    end
    object Itens_CompraPENDENCIA: TFIBStringField
      DisplayWidth = 1
      FieldName = 'PENDENCIA'
      Size = 1
      EmptyStrToNull = True
    end
    object Itens_CompraSEQUENCIA: TFIBIntegerField
      DisplayWidth = 10
      FieldName = 'SEQUENCIA'
    end
    object Itens_CompraNUMERO_GARANTIA: TFIBIntegerField
      FieldName = 'NUMERO_GARANTIA'
    end
    object Itens_CompraTIPO_DOC_GARANTIA: TFIBStringField
      FieldName = 'TIPO_DOC_GARANTIA'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_CompraCFOP: TFIBStringField
      FieldName = 'CFOP'
      Size = 5
      EmptyStrToNull = True
    end
    object Itens_CompraTOTAL_LIQUIDO: TFIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraDESCONTO_EXTRA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'DESCONTO_EXTRA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_LIQUIDO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraTOTAL_BRUTO: TFIBBCDField
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '#,##0.0000'
      Calculated = True
    end
    object Itens_CompraBASE_ICMS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_ICMS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_ISENTA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ISENTA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_OUTRAS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_OUTRAS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraBASE_ICMS_SUBSTITUICAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_ICMS_SUBSTITUICAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_IPI: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraCOEFICIENTE_REDUCAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'COEFICIENTE_REDUCAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraIVA_SUBSTITUICAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'IVA_SUBSTITUICAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraICMS_SUBSTITUICAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'ICMS_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraQTDE_CONFERENCIA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'QTDE_CONFERENCIA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_CompraSITUACAO_TRIBUTARIA: TFIBStringField
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_CompraVLR_DESCONTO_UNITARIO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VLR_DESCONTO_UNITARIO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraALIQUOTA_REDUCAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_REDUCAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraALIQUOTA_SUBSTITUICAO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_SUBSTITUICAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_FRETE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_OUTRAS_DESPESAS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_OUTRAS_DESPESAS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_SEGURO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraCOEFICIENTE_REDUCAO_IVA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'COEFICIENTE_REDUCAO_IVA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraPIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'PIS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraCOFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'COFINS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraBASE_PIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_PIS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraBASE_COFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_COFINS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_PIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_PIS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraVALOR_COFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_COFINS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_CompraCST_PIS_COFINS: TFIBStringField
      FieldName = 'CST_PIS_COFINS'
      Size = 2
      EmptyStrToNull = True
    end
  end
  object Compra: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE COMPRA'
      'SET '
      '    COND_PAGTO = :COND_PAGTO,'
      '    ESPECIE = :ESPECIE,'
      '    SERIE = :SERIE,'
      '    CFOP = :CFOP,'
      '    FATURA = :FATURA,'
      '    VALOR_NOTA = :VALOR_NOTA,'
      '    BASE_CALCULO_ICMS = :BASE_CALCULO_ICMS,'
      '    BASE_CALCULO_ICMS_SUB = :BASE_CALCULO_ICMS_SUB,'
      '    VALOR_ICMS = :VALOR_ICMS,'
      '    VALOR_ICMS_SUB = :VALOR_ICMS_SUB,'
      '    VALOR_FRETE = :VALOR_FRETE,'
      '    VALOR_SEGURO = :VALOR_SEGURO,'
      '    OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '    VALOR_IPI = :VALOR_IPI,'
      '    BASE_CALCULO = :BASE_CALCULO,'
      '    DTA_ENTRADA = :DTA_ENTRADA,'
      '    USU_ENTRADA = :USU_ENTRADA,'
      '    TIP_MOV = :TIP_MOV,'
      '    TIP_DOC = :TIP_DOC,'
      '    LIVRO_FISCAL = :LIVRO_FISCAL,'
      '    VALOR_ISENTA = :VALOR_ISENTA,'
      '    BASE_RED = :BASE_RED,'
      '    GEROU_ESTOQUE = :GEROU_ESTOQUE,'
      '    BANCO = :BANCO,'
      '    IVA = :IVA,'
      '    ICM_IVA = :ICM_IVA,'
      '    BASE_ICM_REDUZIDO = :BASE_ICM_REDUZIDO,'
      '    DESCONTO = :DESCONTO,'
      '    VALOR_PRODUTO = :VALOR_PRODUTO,'
      '    CANCELADO = :CANCELADO,'
      '    DATA_CANCELAMENTO = :DATA_CANCELAMENTO,'
      '    OBS_CANCELAMENTO = :OBS_CANCELAMENTO,'
      '    COD_CANCELAMENTO = :COD_CANCELAMENTO,'
      '    USUARIO_LIBEROU = :USUARIO_LIBEROU,'
      '    DATA_LIBERACAO = :DATA_LIBERACAO,'
      '    USUARIO_CANCELADO = :USUARIO_CANCELADO,'
      '    GEROU_PROVISAO = :GEROU_PROVISAO,'
      '    ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '    ALIQUOTA_FRETE = :ALIQUOTA_FRETE,'
      '    PLANO_CONTA = :PLANO_CONTA,'
      '    REG_PLANO_CONTAS = :REG_PLANO_CONTAS,'
      '    PLANO_CONTAS = :PLANO_CONTAS,'
      '    ICMS_DEVIDO = :ICMS_DEVIDO,'
      '    QTDE_PRODUTO = :QTDE_PRODUTO,'
      '    GARANTIA = :GARANTIA,'
      '    OBS_COMPRA = :OBS_COMPRA,'
      '    TIPO_ENTRADA = :TIPO_ENTRADA,'
      '    CONFERENCIA = :CONFERENCIA,'
      '    ID_NFE = :ID_NFE,'
      '    CIF_FOB = :CIF_FOB,'
      '    ALIQ_IPI_FRETE = :ALIQ_IPI_FRETE,'
      '    VALOR_IPI_FRETE = :VALOR_IPI_FRETE,'
      '    BASE_PIS = :BASE_PIS,'
      '    VALOR_PIS = :VALOR_PIS,'
      '    BASE_COFINS = :BASE_COFINS,'
      '    VALOR_COFINS = :VALOR_COFINS,'
      '   ZERAR_BASE_SPED = :ZERAR_BASE_SPED'
      'WHERE'
      '    COD_LOJA = :OLD_COD_LOJA'
      '    and DATA_NOTA = :OLD_DATA_NOTA'
      '    and NUM_NOTA = :OLD_NUM_NOTA'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    COMPRA'
      'WHERE'
      '        COD_LOJA = :OLD_COD_LOJA'
      '    and DATA_NOTA = :OLD_DATA_NOTA'
      '    and NUM_NOTA = :OLD_NUM_NOTA'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO COMPRA('
      '    COD_LOJA,'
      '    DATA_NOTA,'
      '    NUM_NOTA,'
      '    COD_FORNECEDOR,'
      '    COND_PAGTO,'
      '    ESPECIE,'
      '    SERIE,'
      '    CFOP,'
      '    FATURA,'
      '    VALOR_NOTA,'
      '    BASE_CALCULO_ICMS,'
      '    BASE_CALCULO_ICMS_SUB,'
      '    VALOR_ICMS,'
      '    VALOR_ICMS_SUB,'
      '    VALOR_FRETE,'
      '    VALOR_SEGURO,'
      '    OUTRAS_DESPESAS,'
      '    VALOR_IPI,'
      '    BASE_CALCULO,'
      '    DTA_ENTRADA,'
      '    USU_ENTRADA,'
      '    TIP_MOV,'
      '    TIP_DOC,'
      '    LIVRO_FISCAL,'
      '    VALOR_ISENTA,'
      '    BASE_RED,'
      '    GEROU_ESTOQUE,'
      '    BANCO,'
      '    IVA,'
      '    ICM_IVA,'
      '    BASE_ICM_REDUZIDO,'
      '    DESCONTO,'
      '    VALOR_PRODUTO,'
      '    CANCELADO,'
      '    DATA_CANCELAMENTO,'
      '    OBS_CANCELAMENTO,'
      '    COD_CANCELAMENTO,'
      '    USUARIO_LIBEROU,'
      '    DATA_LIBERACAO,'
      '    USUARIO_CANCELADO,'
      '    GEROU_PROVISAO,'
      '    ALIQUOTA_ICMS,'
      '    ALIQUOTA_FRETE,'
      '    PLANO_CONTA,'
      '    REG_PLANO_CONTAS,'
      '    PLANO_CONTAS,'
      '    ICMS_DEVIDO,'
      '    QTDE_PRODUTO,'
      '    GARANTIA,'
      '    OBS_COMPRA,'
      '    TIPO_ENTRADA,'
      '    CONFERENCIA,'
      '    ID_NFE,'
      '    CIF_FOB,'
      '    ALIQ_IPI_FRETE,'
      '    VALOR_IPI_FRETE,'
      '    BASE_PIS,'
      '    BASE_COFINS,'
      '    VALOR_PIS,'
      '    VALOR_COFINS,'
      '    ZERAR_BASE_SPED'
      ')'
      'VALUES('
      '    :COD_LOJA,'
      '    :DATA_NOTA,'
      '    :NUM_NOTA,'
      '    :COD_FORNECEDOR,'
      '    :COND_PAGTO,'
      '    :ESPECIE,'
      '    :SERIE,'
      '    :CFOP,'
      '    :FATURA,'
      '    :VALOR_NOTA,'
      '    :BASE_CALCULO_ICMS,'
      '    :BASE_CALCULO_ICMS_SUB,'
      '    :VALOR_ICMS,'
      '    :VALOR_ICMS_SUB,'
      '    :VALOR_FRETE,'
      '    :VALOR_SEGURO,'
      '    :OUTRAS_DESPESAS,'
      '    :VALOR_IPI,'
      '    :BASE_CALCULO,'
      '    :DTA_ENTRADA,'
      '    :USU_ENTRADA,'
      '    :TIP_MOV,'
      '    :TIP_DOC,'
      '    :LIVRO_FISCAL,'
      '    :VALOR_ISENTA,'
      '    :BASE_RED,'
      '    :GEROU_ESTOQUE,'
      '    :BANCO,'
      '    :IVA,'
      '    :ICM_IVA,'
      '    :BASE_ICM_REDUZIDO,'
      '    :DESCONTO,'
      '    :VALOR_PRODUTO,'
      '    :CANCELADO,'
      '    :DATA_CANCELAMENTO,'
      '    :OBS_CANCELAMENTO,'
      '    :COD_CANCELAMENTO,'
      '    :USUARIO_LIBEROU,'
      '    :DATA_LIBERACAO,'
      '    :USUARIO_CANCELADO,'
      '    :GEROU_PROVISAO,'
      '    :ALIQUOTA_ICMS,'
      '    :ALIQUOTA_FRETE,'
      '    :PLANO_CONTA,'
      '    :REG_PLANO_CONTAS,'
      '    :PLANO_CONTAS,'
      '    :ICMS_DEVIDO,'
      '    :QTDE_PRODUTO,'
      '    :GARANTIA,'
      '    :OBS_COMPRA,'
      '    :TIPO_ENTRADA,'
      '    :CONFERENCIA,'
      '    :ID_NFE,'
      '    :CIF_FOB,'
      '    :ALIQ_IPI_FRETE,'
      '    :VALOR_IPI_FRETE,'
      '    :BASE_PIS,'
      '    :BASE_COFINS,'
      '    :VALOR_PIS,'
      '    :VALOR_COFINS,'
      '    :ZERAR_BASE_SPED'
      ')')
    RefreshSQL.Strings = (
      'select compra.*,'
      'FORNECEDOR.RAZAO_SOCIAL as NOME_FORNECEDOR,'
      'PRAZO.Descricao as Nome_Prazo,'
      'TIPO_DOC.Descricao as Nome_Doc,'
      'TIPO_MOV.Descricao as Nome_Movimento,'
      'TIPO_MOV.GRUPO_MOV,'
      'Loja.RAZAO_SOCIAL as Nome_Loja,'
      'Bancos.nome as Nome_Banco'
      ' from compra'
      '   INNER JOIN Loja ON  (Compra.Cod_Loja = Loja.CODIGO)'
      '   INNER JOIN Tipo_Mov ON  (Compra.Tip_Mov = Tipo_Mov.Codigo)'
      
        '   INNER JOIN Fornecedor ON  (Compra.Cod_Fornecedor = Fornecedor' +
        '.Codigo)'
      
        '   LEFT OUTER JOIN TIPO_DOC ON  (Compra.Tip_Doc = TIPO_DOC.Codig' +
        'o)'
      '   LEFT OUTER JOIN Prazo ON  (Compra.Cond_Pagto = Prazo.Codigo)'
      '   LEFT OUTER JOIN Bancos ON  (Compra.banco = bancos.banco)'
      ''
      'where(  '
      'compra.num_nota = :num_nota_Aux and'
      'compra.DATA_NOTA = :Data_aux and  '
      'compra.COD_FORNECEDOR = :Fornecedor_aux and '
      'compra.Cod_loja = :Loja_aux'
      '     ) and (     COMPRA.COD_LOJA = :OLD_COD_LOJA'
      '    and COMPRA.DATA_NOTA = :OLD_DATA_NOTA'
      '    and COMPRA.NUM_NOTA = :OLD_NUM_NOTA'
      '    and COMPRA.COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'select compra.*,'
      'FORNECEDOR.RAZAO_SOCIAL as NOME_FORNECEDOR,'
      'PRAZO.Descricao as Nome_Prazo,'
      'TIPO_DOC.Descricao as Nome_Doc,'
      'TIPO_MOV.Descricao as Nome_Movimento,'
      'TIPO_MOV.GRUPO_MOV,'
      'Loja.RAZAO_SOCIAL as Nome_Loja,'
      'Bancos.nome as Nome_Banco'
      ' from compra'
      '   INNER JOIN Loja ON  (Compra.Cod_Loja = Loja.CODIGO)'
      '   INNER JOIN Tipo_Mov ON  (Compra.Tip_Mov = Tipo_Mov.Codigo)'
      
        '   INNER JOIN Fornecedor ON  (Compra.Cod_Fornecedor = Fornecedor' +
        '.Codigo)'
      
        '   LEFT OUTER JOIN TIPO_DOC ON  (Compra.Tip_Doc = TIPO_DOC.Codig' +
        'o)'
      '   LEFT OUTER JOIN Prazo ON  (Compra.Cond_Pagto = Prazo.Codigo)'
      '   LEFT OUTER JOIN Bancos ON  (Compra.banco = bancos.banco)'
      ''
      'where '
      'compra.num_nota = :num_nota_Aux and'
      'compra.DATA_NOTA = :Data_aux and  '
      'compra.COD_FORNECEDOR = :Fornecedor_aux and '
      'compra.Cod_loja = :Loja_aux ')
    Transaction = TR
    Database = DB
    Left = 197
    Top = 117
    object CompraTotal_Produto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Produto'
      DisplayFormat = '#,#0.00'
      EditFormat = '#,#0.00'
      Calculated = True
    end
    object CompraCOD_LOJA: TFIBIntegerField
      FieldName = 'COD_LOJA'
    end
    object CompraDATA_NOTA: TFIBDateTimeField
      FieldName = 'DATA_NOTA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object CompraNUM_NOTA: TFIBIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object CompraCOD_FORNECEDOR: TFIBIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object CompraCOND_PAGTO: TFIBIntegerField
      FieldName = 'COND_PAGTO'
    end
    object CompraESPECIE: TFIBStringField
      FieldName = 'ESPECIE'
      Size = 3
      EmptyStrToNull = True
    end
    object CompraCFOP: TFIBStringField
      FieldName = 'CFOP'
      EditMask = '!9.999;1; '
      Size = 5
      EmptyStrToNull = True
    end
    object CompraFATURA: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'FATURA'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraBASE_CALCULO_ICMS: TFIBFloatField
      FieldName = 'BASE_CALCULO_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraBASE_CALCULO_ICMS_SUB: TFIBFloatField
      FieldName = 'BASE_CALCULO_ICMS_SUB'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraVALOR_ICMS: TFIBFloatField
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraVALOR_ICMS_SUB: TFIBFloatField
      FieldName = 'VALOR_ICMS_SUB'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraVALOR_FRETE: TFIBFloatField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraVALOR_SEGURO: TFIBFloatField
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraOUTRAS_DESPESAS: TFIBFloatField
      FieldName = 'OUTRAS_DESPESAS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.000'
    end
    object CompraVALOR_IPI: TFIBFloatField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraBASE_CALCULO: TFIBFloatField
      FieldName = 'BASE_CALCULO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraDTA_ENTRADA: TFIBDateTimeField
      FieldName = 'DTA_ENTRADA'
      Required = True
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object CompraUSU_ENTRADA: TFIBStringField
      FieldName = 'USU_ENTRADA'
      Size = 50
      EmptyStrToNull = True
    end
    object CompraTIP_MOV: TFIBIntegerField
      FieldName = 'TIP_MOV'
    end
    object CompraTIP_DOC: TFIBStringField
      FieldName = 'TIP_DOC'
      Size = 3
      EmptyStrToNull = True
    end
    object CompraLIVRO_FISCAL: TFIBStringField
      FieldName = 'LIVRO_FISCAL'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraVALOR_ISENTA: TFIBFloatField
      FieldName = 'VALOR_ISENTA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraBASE_RED: TFIBStringField
      FieldName = 'BASE_RED'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraGEROU_ESTOQUE: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'GEROU_ESTOQUE'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraBANCO: TFIBIntegerField
      FieldName = 'BANCO'
    end
    object CompraIVA: TFIBFloatField
      FieldName = 'IVA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraICM_IVA: TFIBFloatField
      FieldName = 'ICM_IVA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraBASE_ICM_REDUZIDO: TFIBFloatField
      FieldName = 'BASE_ICM_REDUZIDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraDESCONTO: TFIBFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object CompraCANCELADO: TFIBStringField
      FieldName = 'CANCELADO'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraDATA_CANCELAMENTO: TFIBDateTimeField
      FieldName = 'DATA_CANCELAMENTO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object CompraOBS_CANCELAMENTO: TFIBBlobField
      FieldName = 'OBS_CANCELAMENTO'
      Size = 8
    end
    object CompraCOD_CANCELAMENTO: TFIBIntegerField
      FieldName = 'COD_CANCELAMENTO'
    end
    object CompraUSUARIO_LIBEROU: TFIBStringField
      FieldName = 'USUARIO_LIBEROU'
      Size = 100
      EmptyStrToNull = True
    end
    object CompraDATA_LIBERACAO: TFIBDateTimeField
      FieldName = 'DATA_LIBERACAO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object CompraUSUARIO_CANCELADO: TFIBStringField
      FieldName = 'USUARIO_CANCELADO'
      Size = 50
      EmptyStrToNull = True
    end
    object CompraGEROU_PROVISAO: TFIBStringField
      FieldName = 'GEROU_PROVISAO'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraALIQUOTA_ICMS: TFIBFloatField
      FieldName = 'ALIQUOTA_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object CompraALIQUOTA_FRETE: TFIBFloatField
      FieldName = 'ALIQUOTA_FRETE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object CompraPLANO_CONTA: TFIBStringField
      FieldName = 'PLANO_CONTA'
      Size = 11
      EmptyStrToNull = True
    end
    object CompraREG_PLANO_CONTAS: TFIBIntegerField
      FieldName = 'REG_PLANO_CONTAS'
    end
    object CompraICMS_DEVIDO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ICMS_DEVIDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraNOME_FORNECEDOR: TFIBStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 70
      EmptyStrToNull = True
    end
    object CompraNOME_PRAZO: TFIBStringField
      FieldName = 'NOME_PRAZO'
      Size = 50
      EmptyStrToNull = True
    end
    object CompraNOME_DOC: TFIBStringField
      FieldName = 'NOME_DOC'
      Size = 50
      EmptyStrToNull = True
    end
    object CompraNOME_MOVIMENTO: TFIBStringField
      FieldName = 'NOME_MOVIMENTO'
      Size = 50
      EmptyStrToNull = True
    end
    object CompraNOME_LOJA: TFIBStringField
      FieldName = 'NOME_LOJA'
      Size = 60
      EmptyStrToNull = True
    end
    object CompraQTDE_PRODUTO: TFIBIntegerField
      FieldName = 'QTDE_PRODUTO'
    end
    object CompraNOME_BANCO: TFIBStringField
      FieldName = 'NOME_BANCO'
      Size = 60
      EmptyStrToNull = True
    end
    object CompraGRUPO_MOV: TFIBIntegerField
      FieldName = 'GRUPO_MOV'
    end
    object CompraGARANTIA: TFIBStringField
      FieldName = 'GARANTIA'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraOBS_COMPRA: TFIBStringField
      FieldName = 'OBS_COMPRA'
      Size = 100
      EmptyStrToNull = True
    end
    object CompraTIPO_ENTRADA: TFIBStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraCONFERENCIA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CONFERENCIA'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraID_NFE: TFIBStringField
      FieldName = 'ID_NFE'
      Size = 100
      EmptyStrToNull = True
    end
    object CompraCIF_FOB: TFIBStringField
      DisplayLabel = 'Tipo de Frete CIF/FOB'
      FieldName = 'CIF_FOB'
      Required = True
      Size = 1
      EmptyStrToNull = True
    end
    object CompraALIQ_IPI_FRETE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQ_IPI_FRETE'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraVALOR_IPI_FRETE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_IPI_FRETE'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object CompraSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 4
      EmptyStrToNull = True
    end
    object CompraBASE_PIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_PIS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object CompraBASE_COFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_COFINS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object CompraVALOR_PIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_PIS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object CompraVALOR_COFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_COFINS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object CompraZERAR_BASE_SPED: TFIBStringField
      FieldName = 'ZERAR_BASE_SPED'
      Size = 1
      EmptyStrToNull = True
    end
    object CompraVALOR_PRODUTO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_PRODUTO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object CompraVALOR_NOTA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_NOTA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
  end
  object Nota: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE NOTA_FISCAL'
      'SET '
      '    COD_REP = :COD_REP,'
      '    COD_PRAZO = :COD_PRAZO,'
      '    COD_TIPO_MOV = :COD_TIPO_MOV,'
      '    CFOP = :CFOP,'
      '    COD_TRANSP = :COD_TRANSP,'
      '    NOME_COMPRADOR = :NOME_COMPRADOR,'
      '    NUMERO_PEDIDO = :NUMERO_PEDIDO,'
      '    CANCELADO = :CANCELADO,'
      '    COD_MOTIVO_CANCELAMENTO = :COD_MOTIVO_CANCELAMENTO,'
      '    COMISSAO = :COMISSAO,'
      '    USUARIO_CANCELADO = :USUARIO_CANCELADO,'
      '    DATA_PEDIDO = :DATA_PEDIDO,'
      '    DATA_CANCELAMENTO = :DATA_CANCELAMENTO,'
      '    BASE_ICMS = :BASE_ICMS,'
      '    BASE_ISSQN = :BASE_ISSQN,'
      '    BASE_ICMS_SUBST = :BASE_ICMS_SUBST,'
      '    TOTAL_ICMS = :TOTAL_ICMS,'
      '    TOTAL_ISSQN = :TOTAL_ISSQN,'
      '    TOTAL_IVA = :TOTAL_IVA,'
      '    TOTAL_IPI = :TOTAL_IPI,'
      '    VALOR_ICMS_SUBST = :VALOR_ICMS_SUBST,'
      '    VALOR_FRETE = :VALOR_FRETE,'
      '    VALOR_SEGURO = :VALOR_SEGURO,'
      '    VALOR_DESP_ACESSORIOS = :VALOR_DESP_ACESSORIOS,'
      '    VALOR_DESCONTO = :VALOR_DESCONTO,'
      '    PERC_DESCONTO = :PERC_DESCONTO,'
      '    TOTAL = :TOTAL,'
      '    SUB_TOTAL = :SUB_TOTAL,'
      '    CIF_FOB = :CIF_FOB,'
      '    OBS_CANCELAMENTO = :OBS_CANCELAMENTO,'
      '    ENTRADA_SAIDA = :ENTRADA_SAIDA,'
      '    OBS_NF = :OBS_NF,'
      '    OBS_MEMO = :OBS_MEMO,'
      '    PLACA = :PLACA,'
      '    MARCA_MODELO = :MARCA_MODELO,'
      '    N_CARRO = :N_CARRO,'
      '    FROTA = :FROTA,'
      '    KM = :KM,'
      '    VALOR_DESCONTO_SERVICO = :VALOR_DESCONTO_SERVICO,'
      '    TOTAL_SERVICO = :TOTAL_SERVICO,'
      '    DEV_NOTA_FISCAL = :DEV_NOTA_FISCAL,'
      '    DEV_SERIE = :DEV_SERIE,'
      '    DEV_MODELO = :DEV_MODELO,'
      '    DEV_DATA_EMISSAO = :DEV_DATA_EMISSAO,'
      '    DEV_DATA_ENTRADA = :DEV_DATA_ENTRADA,'
      '    DEV_NOTA_TROCA = :DEV_NOTA_TROCA,'
      '    DATA_SAIDA = :DATA_SAIDA,'
      '    FATURADO = :FATURADO,'
      '    ECF = :ECF,'
      '    N_DUPLICATA = :N_DUPLICATA,'
      '    CAIXA = :CAIXA,'
      '    CUPOM = :CUPOM,'
      '    PESO_LIQUIDO = :PESO_LIQUIDO,'
      '    PESO_BRUTO = :PESO_BRUTO,'
      '    QTDE_ITENS = :QTDE_ITENS,'
      '    USUARIO_NOTA = :USUARIO_NOTA,'
      '    FATURA_TRANSFERENCIA = :FATURA_TRANSFERENCIA,'
      '    VOLUME = :VOLUME,'
      '    ID_NFE = :ID_NFE,'
      '    NFE = :NFE,'
      '    OBS_NF_MEMO = :OBS_NF_MEMO,'
      '    ESPECIE = :ESPECIE,'
      '    COD_REP_EXTERNO = :COD_REP_EXTERNO,'
      '    TRANSFERENCIA_CONFIRMADA = :TRANSFERENCIA_CONFIRMADA,'
      '    COD_PORTADOR = :COD_PORTADOR,'
      '    NUMERO_DI    = :NUMERO_DI,'
      '    DATA_DI      = :DATA_DI,'
      '    LOCAL_DESEMBARGO =:LOCAL_DESEMBARGO,'
      '    UF_DESEMBARGO   =:UF_DESEMBARGO,'
      '    CODIGO_EXPORTADOR =:CODIGO_EXPORTADOR,'
      '    DATA_DESEMBARGO =:DATA_DESEMBARGO,'
      '    ZERAR_BASE_SPED = :ZERAR_BASE_SPED,'
      '   vICMSUFDest = :vICMSUFDest,'
      '   vICMSUFRemet = :vICMSUFRemet'
      ''
      'WHERE'
      '    COD_LOJA = :OLD_COD_LOJA'
      '    and NUMERO_NF = :OLD_NUMERO_NF'
      '    and TIPO_DOC = :OLD_TIPO_DOC'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and DATA_FATURAMENTO = :OLD_DATA_FATURAMENTO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NOTA_FISCAL'
      'WHERE'
      '        COD_LOJA = :OLD_COD_LOJA'
      '    and NUMERO_NF = :OLD_NUMERO_NF'
      '    and TIPO_DOC = :OLD_TIPO_DOC'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and DATA_FATURAMENTO = :OLD_DATA_FATURAMENTO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO NOTA_FISCAL('
      '    COD_LOJA,'
      '    NUMERO_NF,'
      '    TIPO_DOC,'
      '    COD_FORNECEDOR,'
      '    COD_CLIENTE,'
      '    COD_REP,'
      '    COD_PRAZO,'
      '    COD_TIPO_MOV,'
      '    CFOP,'
      '    COD_TRANSP,'
      '    NOME_COMPRADOR,'
      '    NUMERO_PEDIDO,'
      '    CANCELADO,'
      '    COD_MOTIVO_CANCELAMENTO,'
      '    COMISSAO,'
      '    USUARIO_CANCELADO,'
      '    DATA_FATURAMENTO,'
      '    DATA_PEDIDO,'
      '    DATA_CANCELAMENTO,'
      '    BASE_ICMS,'
      '    BASE_ISSQN,'
      '    BASE_ICMS_SUBST,'
      '    TOTAL_ICMS,'
      '    TOTAL_ISSQN,'
      '    TOTAL_IVA,'
      '    TOTAL_IPI,'
      '    VALOR_ICMS_SUBST,'
      '    VALOR_FRETE,'
      '    VALOR_SEGURO,'
      '    VALOR_DESP_ACESSORIOS,'
      '    VALOR_DESCONTO,'
      '    PERC_DESCONTO,'
      '    TOTAL,'
      '    SUB_TOTAL,'
      '    CIF_FOB,'
      '    OBS_CANCELAMENTO,'
      '    ENTRADA_SAIDA,'
      '    OBS_NF,'
      '    OBS_MEMO,'
      '    PLACA,'
      '    MARCA_MODELO,'
      '    N_CARRO,'
      '    FROTA,'
      '    KM,'
      '    VALOR_DESCONTO_SERVICO,'
      '    TOTAL_SERVICO,'
      '    DEV_NOTA_FISCAL,'
      '    DEV_SERIE,'
      '    DEV_MODELO,'
      '    DEV_DATA_EMISSAO,'
      '    DEV_DATA_ENTRADA,'
      '    DEV_NOTA_TROCA,'
      '    DATA_SAIDA,'
      '    FATURADO,'
      '    ECF,'
      '    N_DUPLICATA,'
      '    CAIXA,'
      '    CUPOM,'
      '    PESO_LIQUIDO,'
      '    PESO_BRUTO,'
      '    QTDE_ITENS,'
      '    USUARIO_NOTA,'
      '    FATURA_TRANSFERENCIA,'
      '    VOLUME,'
      '    ID_NFE,'
      '    NFE,'
      '    OBS_NF_MEMO,'
      '    ESPECIE,'
      '    COD_REP_EXTERNO,'
      '    TRANSFERENCIA_CONFIRMADA,'
      '    COD_PORTADOR,'
      '    NUMERO_DI,'
      '    DATA_DI,'
      '    LOCAL_DESEMBARGO,'
      '    UF_DESEMBARGO,'
      '    CODIGO_EXPORTADOR,'
      '    DATA_DESEMBARGO,'
      '    ZERAR_BASE_SPED,'
      '    vICMSUFDest,'
      '    vICMSUFRemet'
      ')'
      'VALUES('
      '    :COD_LOJA,'
      '    :NUMERO_NF,'
      '    :TIPO_DOC,'
      '    :COD_FORNECEDOR,'
      '    :COD_CLIENTE,'
      '    :COD_REP,'
      '    :COD_PRAZO,'
      '    :COD_TIPO_MOV,'
      '    :CFOP,'
      '    :COD_TRANSP,'
      '    :NOME_COMPRADOR,'
      '    :NUMERO_PEDIDO,'
      '    :CANCELADO,'
      '    :COD_MOTIVO_CANCELAMENTO,'
      '    :COMISSAO,'
      '    :USUARIO_CANCELADO,'
      '    :DATA_FATURAMENTO,'
      '    :DATA_PEDIDO,'
      '    :DATA_CANCELAMENTO,'
      '    :BASE_ICMS,'
      '    :BASE_ISSQN,'
      '    :BASE_ICMS_SUBST,'
      '    :TOTAL_ICMS,'
      '    :TOTAL_ISSQN,'
      '    :TOTAL_IVA,'
      '    :TOTAL_IPI,'
      '    :VALOR_ICMS_SUBST,'
      '    :VALOR_FRETE,'
      '    :VALOR_SEGURO,'
      '    :VALOR_DESP_ACESSORIOS,'
      '    :VALOR_DESCONTO,'
      '    :PERC_DESCONTO,'
      '    :TOTAL,'
      '    :SUB_TOTAL,'
      '    :CIF_FOB,'
      '    :OBS_CANCELAMENTO,'
      '    :ENTRADA_SAIDA,'
      '    :OBS_NF,'
      '    :OBS_MEMO,'
      '    :PLACA,'
      '    :MARCA_MODELO,'
      '    :N_CARRO,'
      '    :FROTA,'
      '    :KM,'
      '    :VALOR_DESCONTO_SERVICO,'
      '    :TOTAL_SERVICO,'
      '    :DEV_NOTA_FISCAL,'
      '    :DEV_SERIE,'
      '    :DEV_MODELO,'
      '    :DEV_DATA_EMISSAO,'
      '    :DEV_DATA_ENTRADA,'
      '    :DEV_NOTA_TROCA,'
      '    :DATA_SAIDA,'
      '    :FATURADO,'
      '    :ECF,'
      '    :N_DUPLICATA,'
      '    :CAIXA,'
      '    :CUPOM,'
      '    :PESO_LIQUIDO,'
      '    :PESO_BRUTO,'
      '    :QTDE_ITENS,'
      '    :USUARIO_NOTA,'
      '    :FATURA_TRANSFERENCIA,'
      '    :VOLUME,'
      '    :ID_NFE,'
      '    :NFE,'
      '    :OBS_NF_MEMO,'
      '    :ESPECIE,'
      '    :COD_REP_EXTERNO,'
      '    :TRANSFERENCIA_CONFIRMADA,'
      '    :COD_PORTADOR,'
      '    :NUMERO_DI,'
      '    :DATA_DI,'
      '    :LOCAL_DESEMBARGO,'
      '    :UF_DESEMBARGO,'
      '    :CODIGO_EXPORTADOR,'
      '    :DATA_DESEMBARGO,'
      '    :ZERAR_BASE_SPED,'
      '    :vICMSUFDest,'
      '    :vICMSUFRemet'
      ')')
    RefreshSQL.Strings = (
      'select Nota_Fiscal.*,'
      'Cliente.Razao_Social as Nome_Cliente,'
      'Prazo.Descricao as Nome_Prazo,'
      'Rep.Nome as Nome_Rep,'
      'Tipo_Mov.Descricao as Nome_Movimento,'
      'Transportadora.Razao_Social as Nome_Transportadora,'
      'Fornecedor.Razao_Social as Nome_Fornecedor,'
      'Loja.Razao_Social as Nome_Loja'
      ' from NOTA_FISCAL'
      
        '   LEFT OUTER JOIN Cliente  ON  (NOTA_FISCAL.Cod_Cliente = Clien' +
        'te.Codigo)  '
      
        '   LEFT OUTER JOIN Loja   ON  (NOTA_FISCAL.Cod_Loja = Loja.Codig' +
        'o)  '
      
        '   LEFT OUTER JOIN Prazo    ON  (NOTA_FISCAL.Cod_Prazo = Prazo.C' +
        'odigo)  '
      '   LEFT OUTER JOIN Rep    ON  (NOTA_FISCAL.Cod_Rep= Rep.Codigo)'
      
        '   LEFT OUTER JOIN Tipo_Mov    ON  (NOTA_FISCAL.Cod_Tipo_Mov = T' +
        'ipo_Mov.Codigo)  '
      
        '   LEFT OUTER JOIN Transportadora    ON  (NOTA_FISCAL.Cod_Transp' +
        ' = Transportadora.Codigo)  '
      
        '   LEFT OUTER JOIN Fornecedor    ON  (NOTA_FISCAL.Cod_FORNECEDOR' +
        ' = FORNECEDOR.CODIGO)'
      'where(  NOTA_FISCAL.NUMERO_NF = :NUMERO_AUX AND'
      '          NOTA_FISCAL.TIPO_DOC = :TIPO_DOC_AUX AND'
      '         NOTA_FISCAL.COD_LOJA = :LOJA'
      '     ) and (     NOTA_FISCAL.COD_LOJA = :OLD_COD_LOJA'
      '    and NOTA_FISCAL.NUMERO_NF = :OLD_NUMERO_NF'
      '    and NOTA_FISCAL.TIPO_DOC = :OLD_TIPO_DOC'
      '    and NOTA_FISCAL.COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and NOTA_FISCAL.COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and NOTA_FISCAL.DATA_FATURAMENTO = :OLD_DATA_FATURAMENTO'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select Nota_Fiscal.*,'
      'Cliente.Razao_Social as Nome_Cliente,'
      'Prazo.Descricao as Nome_Prazo,'
      'Rep.Nome as Nome_Rep,'
      'Tipo_Mov.Descricao as Nome_Movimento,'
      'Transportadora.Razao_Social as Nome_Transportadora,'
      'Fornecedor.Razao_Social as Nome_Fornecedor,'
      'Loja.Razao_Social as Nome_Loja'
      ' from NOTA_FISCAL'
      
        '   LEFT OUTER JOIN Cliente  ON  (NOTA_FISCAL.Cod_Cliente = Clien' +
        'te.Codigo)  '
      
        '   LEFT OUTER JOIN Loja   ON  (NOTA_FISCAL.Cod_Loja = Loja.Codig' +
        'o)  '
      
        '   LEFT OUTER JOIN Prazo    ON  (NOTA_FISCAL.Cod_Prazo = Prazo.C' +
        'odigo)  '
      '   LEFT OUTER JOIN Rep    ON  (NOTA_FISCAL.Cod_Rep= Rep.Codigo)'
      
        '   LEFT OUTER JOIN Tipo_Mov    ON  (NOTA_FISCAL.Cod_Tipo_Mov = T' +
        'ipo_Mov.Codigo)  '
      
        '   LEFT OUTER JOIN Transportadora    ON  (NOTA_FISCAL.Cod_Transp' +
        ' = Transportadora.Codigo)  '
      
        '   LEFT OUTER JOIN Fornecedor    ON  (NOTA_FISCAL.Cod_FORNECEDOR' +
        ' = FORNECEDOR.CODIGO)'
      'where NOTA_FISCAL.NUMERO_NF = :NUMERO_AUX AND'
      '      NOTA_FISCAL.TIPO_DOC = :TIPO_DOC_AUX AND'
      '      NOTA_FISCAL.COD_LOJA = :LOJA AND'
      '      NOTA_FISCAL.DATA_FATURAMENTO = :DATA')
    Transaction = TR
    Database = DB
    Left = 312
    Top = 191
    object NotaCOD_LOJA: TFIBIntegerField
      FieldName = 'COD_LOJA'
    end
    object NotaNUMERO_NF: TFIBIntegerField
      FieldName = 'NUMERO_NF'
    end
    object NotaTIPO_DOC: TFIBStringField
      FieldName = 'TIPO_DOC'
      Size = 3
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCOD_FORNECEDOR: TFIBIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object NotaCOD_CLIENTE: TFIBIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object NotaCOD_REP: TFIBIntegerField
      FieldName = 'COD_REP'
    end
    object NotaCOD_PRAZO: TFIBIntegerField
      FieldName = 'COD_PRAZO'
    end
    object NotaCOD_TIPO_MOV: TFIBIntegerField
      FieldName = 'COD_TIPO_MOV'
    end
    object NotaENTRADA_SAIDA: TFIBStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCFOP: TFIBStringField
      FieldName = 'CFOP'
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCOD_TRANSP: TFIBIntegerField
      FieldName = 'COD_TRANSP'
    end
    object NotaNOME_COMPRADOR: TFIBStringField
      FieldName = 'NOME_COMPRADOR'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNUMERO_PEDIDO: TFIBIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object NotaCANCELADO: TFIBStringField
      FieldName = 'CANCELADO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCOD_MOTIVO_CANCELAMENTO: TFIBIntegerField
      FieldName = 'COD_MOTIVO_CANCELAMENTO'
    end
    object NotaCOMISSAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'COMISSAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaUSUARIO_CANCELADO: TFIBStringField
      FieldName = 'USUARIO_CANCELADO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDATA_FATURAMENTO: TFIBDateTimeField
      FieldName = 'DATA_FATURAMENTO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaDATA_PEDIDO: TFIBDateTimeField
      FieldName = 'DATA_PEDIDO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaDATA_CANCELAMENTO: TFIBDateTimeField
      FieldName = 'DATA_CANCELAMENTO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaBASE_ICMS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaBASE_ISSQN: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'BASE_ISSQN'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaBASE_ICMS_SUBST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS_SUBST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL_ICMS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL_ISSQN: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL_ISSQN'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL_IVA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL_IVA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL_IPI: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVALOR_ICMS_SUBST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS_SUBST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVALOR_FRETE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVALOR_SEGURO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVALOR_DESP_ACESSORIOS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_DESP_ACESSORIOS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVALOR_DESCONTO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaSUB_TOTAL: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaCIF_FOB: TFIBStringField
      FieldName = 'CIF_FOB'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaOBS_CANCELAMENTO: TFIBBlobField
      FieldName = 'OBS_CANCELAMENTO'
      Size = 8
    end
    object NotaOBS_NF: TFIBStringField
      FieldName = 'OBS_NF'
      Size = 300
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaOBS_MEMO: TFIBBlobField
      FieldName = 'OBS_MEMO'
      Size = 8
    end
    object NotaPLACA: TFIBStringField
      FieldName = 'PLACA'
      Size = 7
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaMARCA_MODELO: TFIBStringField
      FieldName = 'MARCA_MODELO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaN_CARRO: TFIBStringField
      FieldName = 'N_CARRO'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaFROTA: TFIBStringField
      FieldName = 'FROTA'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaKM: TFIBIntegerField
      FieldName = 'KM'
    end
    object NotaVALOR_DESCONTO_SERVICO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_DESCONTO_SERVICO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaTOTAL_SERVICO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TOTAL_SERVICO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaDEV_NOTA_FISCAL: TFIBIntegerField
      FieldName = 'DEV_NOTA_FISCAL'
    end
    object NotaDEV_SERIE: TFIBStringField
      FieldName = 'DEV_SERIE'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDEV_MODELO: TFIBStringField
      FieldName = 'DEV_MODELO'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDEV_DATA_EMISSAO: TFIBDateTimeField
      FieldName = 'DEV_DATA_EMISSAO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaDEV_DATA_ENTRADA: TFIBDateTimeField
      FieldName = 'DEV_DATA_ENTRADA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaDEV_NOTA_TROCA: TFIBStringField
      FieldName = 'DEV_NOTA_TROCA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDATA_SAIDA: TFIBDateTimeField
      FieldName = 'DATA_SAIDA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaFATURADO: TFIBStringField
      FieldName = 'FATURADO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaECF: TFIBStringField
      FieldName = 'ECF'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaN_DUPLICATA: TFIBStringField
      FieldName = 'N_DUPLICATA'
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCAIXA: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'CAIXA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCUPOM: TFIBStringField
      FieldName = 'CUPOM'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaPESO_LIQUIDO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object NotaPESO_BRUTO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object NotaQTDE_ITENS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'QTDE_ITENS'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object NotaUSUARIO_NOTA: TFIBStringField
      FieldName = 'USUARIO_NOTA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_CLIENTE: TFIBStringField
      FieldName = 'NOME_CLIENTE'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_PRAZO: TFIBStringField
      FieldName = 'NOME_PRAZO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_REP: TFIBStringField
      FieldName = 'NOME_REP'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_MOVIMENTO: TFIBStringField
      FieldName = 'NOME_MOVIMENTO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_TRANSPORTADORA: TFIBStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_FORNECEDOR: TFIBStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNOME_LOJA: TFIBStringField
      FieldName = 'NOME_LOJA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaFATURA_TRANSFERENCIA: TFIBStringField
      FieldName = 'FATURA_TRANSFERENCIA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaVOLUME: TFIBIntegerField
      FieldName = 'VOLUME'
    end
    object NotaID_NFE: TFIBStringField
      FieldName = 'ID_NFE'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNFE: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'NFE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaOBS_NF_MEMO: TFIBBlobField
      FieldName = 'OBS_NF_MEMO'
      Size = 8
    end
    object NotaTRANSFERENCIA_CONFIRMADA: TFIBStringField
      FieldName = 'TRANSFERENCIA_CONFIRMADA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaNUMERO_DI: TFIBStringField
      FieldName = 'NUMERO_DI'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDATA_DI: TFIBDateTimeField
      FieldName = 'DATA_DI'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaLOCAL_DESEMBARGO: TFIBStringField
      FieldName = 'LOCAL_DESEMBARGO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaUF_DESEMBARGO: TFIBStringField
      FieldName = 'UF_DESEMBARGO'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaCODIGO_EXPORTADOR: TFIBStringField
      FieldName = 'CODIGO_EXPORTADOR'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaDATA_DESEMBARGO: TFIBDateTimeField
      FieldName = 'DATA_DESEMBARGO'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object NotaDATA_CONFERENCIA: TFIBDateTimeField
      FieldName = 'DATA_CONFERENCIA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object NotaUSUARIO_CONFERENTE: TFIBIntegerField
      FieldName = 'USUARIO_CONFERENTE'
    end
    object NotaZERAR_BASE_SPED: TFIBStringField
      FieldName = 'ZERAR_BASE_SPED'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaESPECIE: TFIBStringField
      FieldName = 'ESPECIE'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object NotaHORA_NOTA: TFIBTimeField
      FieldName = 'HORA_NOTA'
      DisplayFormat = 'hh:mm AMPM'
    end
    object NotaCOD_REP_EXTERNO: TFIBIntegerField
      FieldName = 'COD_REP_EXTERNO'
    end
    object NotaCOD_PORTADOR: TFIBIntegerField
      DefaultExpression = '19'
      FieldName = 'COD_PORTADOR'
    end
    object NotaPERC_DESCONTO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'PERC_DESCONTO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
    end
    object NotaVICMSDESON: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSDESON'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVFCPUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VFCPUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVICMSUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object NotaVICMSUFREMET: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSUFREMET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
  end
  object Itens_Nota: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE ITENS_NOTA'
      'SET'
      '    NUMERO_NF = :NUMERO_NF,'
      '    TIPO_DOC = :TIPO_DOC,'
      '    DATA = :DATA,'
      '    VALOR_ICMS = :VALOR_ICMS,'
      '    VALOR_IPI = :VALOR_IPI,'
      '    QTDE_PEDIDO = :QTDE_PEDIDO,'
      '    QTDE_ATENDIDA = :QTDE_ATENDIDA,'
      '    VALOR_VENDA = :VALOR_VENDA,'
      '    VALOR_OPERACIONAL = :VALOR_OPERACIONAL,'
      '    VALOR_LIQUIDO = :VALOR_LIQUIDO,'
      '    VALOR_DESCONTO = :VALOR_DESCONTO,'
      '    PERC_DESCONTO = :PERC_DESCONTO,'
      '    PESO_BRUTO = :PESO_BRUTO,'
      '    PESO_LIQUIDO = :PESO_LIQUIDO,'
      '    COD_CATALAGO = :COD_CATALAGO,'
      '    VALOR_ISS = :VALOR_ISS,'
      '    VALOR_ISENTA = :VALOR_ISENTA,'
      '    BASE_ICMS = :BASE_ICMS,'
      '    BASE_ICMS_SUBST = :BASE_ICMS_SUBST,'
      '    CFOP = :CFOP,'
      '    VALOR_COMPRA = :VALOR_COMPRA,'
      '    COD_TIPO_MOV = :COD_TIPO_MOV,'
      '    QTDE_GARANTIA = :QTDE_GARANTIA,'
      '    NUMERO_GARANTIA = :NUMERO_GARANTIA,'
      '    TIPO_DOC_GARANTIA = :TIPO_DOC_GARANTIA,'
      '    SITUACAO_TRIBUTARIA = :SITUACAO_TRIBUTARIA,'
      '    BASE_ICMS_SUBSTITUICAO = :BASE_ICMS_SUBSTITUICAO,'
      '    VALOR_ICMS_SUBSTITUICAO = :VALOR_ICMS_SUBSTITUICAO,'
      '    ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '    ALIQUOTA_IPI = :ALIQUOTA_IPI,'
      '    VALOR_OUTRAS = :VALOR_OUTRAS,'
      '    DESCONTO_EXTRA = :DESCONTO_EXTRA,'
      '    ALIQUOTA_IVA = :ALIQUOTA_IVA,'
      '    ALIQUOTA_ICMS_IVA = :ALIQUOTA_ICMS_IVA,'
      '    NUMERO_NOTA_DEVOLUCAO = :NUMERO_NOTA_DEVOLUCAO,'
      '    TIPO_DOC_NOTA_DEVOLUCAO = :TIPO_DOC_NOTA_DEVOLUCAO,'
      '    DATA_NOTA_DEVOLUCAO = :DATA_NOTA_DEVOLUCAO,'
      '    QTDE_DEVOLVIDA = :QTDE_DEVOLVIDA,'
      '    NUMERO_NOTA_ORIGEM = :NUMERO_NOTA_ORIGEM,'
      '    TIPO_DOC_NOTA_ORIGEM = :TIPO_DOC_NOTA_ORIGEM,'
      '    DATA_NOTA_ORIGEM = :DATA_NOTA_ORIGEM,'
      '    PCREDSN_N29 = :PCREDSN_N29,'
      '    VCREDICMSSN_N30 = :VCREDICMSSN_N30,'
      '    PICMSST_N22 = :PICMSST_N22,'
      '    PREDBCST_N2 = :PREDBCST_N2,'
      '    NUMERO_ADICAO = :NUMERO_ADICAO,'
      '    COD_FABRICANTE = :COD_FABRICANTE,'
      '    VALOR_FRETE = :VALOR_FRETE,'
      '    VALOR_SEGURO = :VALOR_SEGURO,'
      '    VALOR_OUTRAS_DESPESAS = :VALOR_OUTRAS_DESPESAS,'
      '    COEFICIENTE_REDUCAO = :COEFICIENTE_REDUCAO,'
      '    COEFICIENTE_REDUCAO_IVA = :COEFICIENTE_REDUCAO_IVA,'
      '    ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '    ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '    CST_PIS_COFINS = :CST_PIS_COFINS,'
      '    BASE_IPI = :BASE_IPI,'
      '    OBS_ITEM_VENDIDO = :OBS_ITEM_VENDIDO,'
      '    N_PEDIDO_COMPRA = :N_PEDIDO_COMPRA,'
      '    N_ITEM_COMPRA = :N_ITEM_COMPRA,'
      '    TPVIATRANSP = :TPVIATRANSP,'
      '    TPINTERMEDIO = :TPINTERMEDIO,'
      '    VBCUFDEST = :VBCUFDEST,'
      '    PFCPUFDEST = :PFCPUFDEST,'
      '    PICMSUFDEST = :PICMSUFDEST,'
      '    PICMSINTER = :PICMSINTER,'
      '    PICMSINTERPART = :PICMSINTERPART,'
      '    VFCPUFDEST = :VFCPUFDEST,'
      '    VICMSUFDEST = :VICMSUFDEST,'
      '    VICMSUFREMET = :VICMSUFREMET,'
      '    VICMSDESON = :VICMSDESON,'
      '    PROMOCAO = :PROMOCAO,'
      '    TIPO_DEVOLUCAO = :TIPO_DEVOLUCAO'
      'WHERE'
      '    COD_LOJA = :OLD_COD_LOJA'
      '    and NUMERO_NF = :OLD_NUMERO_NF'
      '    and TIPO_DOC = :OLD_TIPO_DOC'
      '    and COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and DESCRICAO_PRODUTO = :OLD_DESCRICAO_PRODUTO'
      '    and SEQUENCIA = :OLD_SEQUENCIA'
      '    and COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and DATA = :OLD_DATA'
      '')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ITENS_NOTA'
      'WHERE'
      '        COD_LOJA = :OLD_COD_LOJA'
      '    and NUMERO_NF = :OLD_NUMERO_NF'
      '    and TIPO_DOC = :OLD_TIPO_DOC'
      '    and COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and DESCRICAO_PRODUTO = :OLD_DESCRICAO_PRODUTO'
      '    and SEQUENCIA = :OLD_SEQUENCIA'
      '    and COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and DATA = :OLD_DATA'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ITENS_NOTA('
      '    COD_LOJA,'
      '    NUMERO_NF,'
      '    TIPO_DOC,'
      '    COD_PRODUTO,'
      '    DESCRICAO_PRODUTO,'
      '    SEQUENCIA,'
      '    VALOR_ICMS,'
      '    VALOR_IPI,'
      '    QTDE_PEDIDO,'
      '    QTDE_ATENDIDA,'
      '    VALOR_VENDA,'
      '    VALOR_OPERACIONAL,'
      '    VALOR_LIQUIDO,'
      '    VALOR_DESCONTO,'
      '    PERC_DESCONTO,'
      '    PESO_BRUTO,'
      '    PESO_LIQUIDO,'
      '    COD_CATALAGO,'
      '    VALOR_ISS,'
      '    VALOR_ISENTA,'
      '    BASE_ICMS,'
      '    BASE_ICMS_SUBST,'
      '    CFOP,'
      '    VALOR_COMPRA,'
      '    COD_CLIENTE,'
      '    COD_FORNECEDOR,'
      '    COD_TIPO_MOV,'
      '    QTDE_GARANTIA,'
      '    NUMERO_GARANTIA,'
      '    TIPO_DOC_GARANTIA,'
      '    DATA,'
      '    SITUACAO_TRIBUTARIA,'
      '    BASE_ICMS_SUBSTITUICAO,'
      '    VALOR_ICMS_SUBSTITUICAO,'
      '    ALIQUOTA_ICMS,'
      '    ALIQUOTA_IPI,'
      '    VALOR_OUTRAS,'
      '    DESCONTO_EXTRA,'
      '    ALIQUOTA_IVA,'
      '    ALIQUOTA_ICMS_IVA,'
      '    NUMERO_NOTA_DEVOLUCAO,'
      '    TIPO_DOC_NOTA_DEVOLUCAO,'
      '    DATA_NOTA_DEVOLUCAO,'
      '    QTDE_DEVOLVIDA,'
      '    NUMERO_NOTA_ORIGEM,'
      '    TIPO_DOC_NOTA_ORIGEM,'
      '    DATA_NOTA_ORIGEM,'
      '    PCREDSN_N29,'
      '    VCREDICMSSN_N30,'
      '    PICMSST_N22,'
      '    PREDBCST_N2,'
      '    NUMERO_ADICAO,'
      '    COD_FABRICANTE,'
      '    VALOR_FRETE,'
      '    VALOR_SEGURO,'
      '    VALOR_OUTRAS_DESPESAS,'
      '    COEFICIENTE_REDUCAO,'
      '    COEFICIENTE_REDUCAO_IVA,'
      '    ALIQUOTA_PIS,'
      '    ALIQUOTA_COFINS,'
      '    CST_PIS_COFINS,'
      '    BASE_IPI,'
      '    OBS_ITEM_VENDIDO,'
      '    N_PEDIDO_COMPRA,'
      '    N_ITEM_COMPRA,'
      '    TPVIATRANSP,'
      '    TPINTERMEDIO,'
      '    VBCUFDEST,'
      '    PFCPUFDEST,'
      '    PICMSUFDEST,'
      '    PICMSINTER,'
      '    PICMSINTERPART,'
      '    VFCPUFDEST,'
      '    VICMSUFDEST,'
      '    VICMSUFREMET,'
      '    VICMSDESON,'
      '    PROMOCAO,'
      '    TIPO_DEVOLUCAO'
      ')'
      'VALUES('
      '    :COD_LOJA,'
      '    :NUMERO_NF,'
      '    :TIPO_DOC,'
      '    :COD_PRODUTO,'
      '    :DESCRICAO_PRODUTO,'
      '    :SEQUENCIA,'
      '    :VALOR_ICMS,'
      '    :VALOR_IPI,'
      '    :QTDE_PEDIDO,'
      '    :QTDE_ATENDIDA,'
      '    :VALOR_VENDA,'
      '    :VALOR_OPERACIONAL,'
      '    :VALOR_LIQUIDO,'
      '    :VALOR_DESCONTO,'
      '    :PERC_DESCONTO,'
      '    :PESO_BRUTO,'
      '    :PESO_LIQUIDO,'
      '    :COD_CATALAGO,'
      '    :VALOR_ISS,'
      '    :VALOR_ISENTA,'
      '    :BASE_ICMS,'
      '    :BASE_ICMS_SUBST,'
      '    :CFOP,'
      '    :VALOR_COMPRA,'
      '    :COD_CLIENTE,'
      '    :COD_FORNECEDOR,'
      '    :COD_TIPO_MOV,'
      '    :QTDE_GARANTIA,'
      '    :NUMERO_GARANTIA,'
      '    :TIPO_DOC_GARANTIA,'
      '    :DATA,'
      '    :SITUACAO_TRIBUTARIA,'
      '    :BASE_ICMS_SUBSTITUICAO,'
      '    :VALOR_ICMS_SUBSTITUICAO,'
      '    :ALIQUOTA_ICMS,'
      '    :ALIQUOTA_IPI,'
      '    :VALOR_OUTRAS,'
      '    :DESCONTO_EXTRA,'
      '    :ALIQUOTA_IVA,'
      '    :ALIQUOTA_ICMS_IVA,'
      '    :NUMERO_NOTA_DEVOLUCAO,'
      '    :TIPO_DOC_NOTA_DEVOLUCAO,'
      '    :DATA_NOTA_DEVOLUCAO,'
      '    :QTDE_DEVOLVIDA,'
      '    :NUMERO_NOTA_ORIGEM,'
      '    :TIPO_DOC_NOTA_ORIGEM,'
      '    :DATA_NOTA_ORIGEM,'
      '    :PCREDSN_N29,'
      '    :VCREDICMSSN_N30,'
      '    :PICMSST_N22,'
      '    :PREDBCST_N2,'
      '    :NUMERO_ADICAO,'
      '    :COD_FABRICANTE,'
      '    :VALOR_FRETE,'
      '    :VALOR_SEGURO,'
      '    :VALOR_OUTRAS_DESPESAS,'
      '    :COEFICIENTE_REDUCAO,'
      '    :COEFICIENTE_REDUCAO_IVA,'
      '    :ALIQUOTA_PIS,'
      '    :ALIQUOTA_COFINS,'
      '    :CST_PIS_COFINS,'
      '    :BASE_IPI,'
      '    :OBS_ITEM_VENDIDO,'
      '    :N_PEDIDO_COMPRA,'
      '    :N_ITEM_COMPRA,'
      '    :TPVIATRANSP,'
      '    :TPINTERMEDIO,'
      '    :VBCUFDEST,'
      '    :PFCPUFDEST,'
      '    :PICMSUFDEST,'
      '    :PICMSINTER,'
      '    :PICMSINTERPART,'
      '    :VFCPUFDEST,'
      '    :VICMSUFDEST,'
      '    :VICMSUFREMET,'
      '    :VICMSDESON,'
      '    :PROMOCAO,'
      '    :TIPO_DEVOLUCAO'
      ')')
    RefreshSQL.Strings = (
      'select ITENS_NOTA.*,'
      'Produto.Aplicacao as Nome_Aplicacao'
      ' from ITENS_NOTA'
      
        '   INNER JOIN Produto ON  (Produto.Codigo = ITENS_NOTA.Cod_Produ' +
        'to)'
      'where(  ITENS_NOTA.NUMERO_NF = :NUMERO_AUX AND'
      '          ITENS_NOTA.TIPO_DOC = :TIPO_DOC_AUX AND'
      '          ITENS_NOTA.COD_LOJA = :LOJA AND'
      '          ITENS_NOTA.DATA = :DATA'
      '     ) and (     ITENS_NOTA.COD_LOJA = :OLD_COD_LOJA'
      '    and ITENS_NOTA.NUMERO_NF = :OLD_NUMERO_NF'
      '    and ITENS_NOTA.TIPO_DOC = :OLD_TIPO_DOC'
      '    and ITENS_NOTA.COD_PRODUTO = :OLD_COD_PRODUTO'
      '    and ITENS_NOTA.DESCRICAO_PRODUTO = :OLD_DESCRICAO_PRODUTO'
      '    and ITENS_NOTA.SEQUENCIA = :OLD_SEQUENCIA'
      '    and ITENS_NOTA.COD_CLIENTE = :OLD_COD_CLIENTE'
      '    and ITENS_NOTA.COD_FORNECEDOR = :OLD_COD_FORNECEDOR'
      '    and ITENS_NOTA.DATA = :OLD_DATA'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select ITENS_NOTA.*,'
      'Produto.Aplicacao as Nome_Aplicacao'
      ' from ITENS_NOTA'
      
        '   INNER JOIN Produto ON  (Produto.Codigo = ITENS_NOTA.Cod_Produ' +
        'to)'
      'where ITENS_NOTA.NUMERO_NF = :NUMERO_AUX AND'
      '          ITENS_NOTA.TIPO_DOC = :TIPO_DOC_AUX AND'
      '          ITENS_NOTA.COD_LOJA = :LOJA AND'
      '          ITENS_NOTA.DATA = :DATA')
    Transaction = TR
    Database = DB
    Left = 312
    Top = 248
    object Itens_NotaSaldo: TCurrencyField
      DisplayLabel = 'SALDO'
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      currency = False
      Calculated = True
    end
    object Itens_NotaSALDO_GARANTIA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_GARANTIA'
      currency = False
      Calculated = True
    end
    object Itens_NotaSALDO_TRANSPORTE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_TRANSPORTE'
      currency = False
      Calculated = True
    end
    object Itens_NotaCOD_LOJA: TFIBIntegerField
      FieldName = 'COD_LOJA'
    end
    object Itens_NotaNUMERO_NF: TFIBIntegerField
      FieldName = 'NUMERO_NF'
    end
    object Itens_NotaTIPO_DOC: TFIBStringField
      FieldName = 'TIPO_DOC'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_NotaCOD_PRODUTO: TFIBIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object Itens_NotaDESCRICAO_PRODUTO: TFIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 80
      EmptyStrToNull = True
    end
    object Itens_NotaSEQUENCIA: TFIBIntegerField
      FieldName = 'SEQUENCIA'
    end
    object Itens_NotaVALOR_ICMS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_IPI: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaQTDE_PEDIDO: TFIBFloatField
      FieldName = 'QTDE_PEDIDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_NotaQTDE_ATENDIDA: TFIBFloatField
      FieldName = 'QTDE_ATENDIDA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object Itens_NotaVALOR_VENDA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_OPERACIONAL: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_OPERACIONAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_LIQUIDO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_DESCONTO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaPERC_DESCONTO: TFIBFloatField
      FieldName = 'PERC_DESCONTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPESO_BRUTO: TFIBFloatField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPESO_LIQUIDO: TFIBFloatField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaCOD_CATALAGO: TFIBStringField
      FieldName = 'COD_CATALAGO'
      Size = 30
      EmptyStrToNull = True
    end
    object Itens_NotaVALOR_TOTAL: TFIBBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_ISS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ISS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_ISENTA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ISENTA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaBASE_ICMS: TFIBFloatField
      FieldName = 'BASE_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaBASE_ICMS_SUBST: TFIBFloatField
      FieldName = 'BASE_ICMS_SUBST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaCFOP: TFIBStringField
      FieldName = 'CFOP'
      Size = 5
      EmptyStrToNull = True
    end
    object Itens_NotaVALOR_COMPRA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_COMPRA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaCOD_CLIENTE: TFIBIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object Itens_NotaCOD_FORNECEDOR: TFIBIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object Itens_NotaCOD_TIPO_MOV: TFIBIntegerField
      FieldName = 'COD_TIPO_MOV'
    end
    object Itens_NotaQTDE_GARANTIA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'QTDE_GARANTIA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
    end
    object Itens_NotaNUMERO_GARANTIA: TFIBIntegerField
      FieldName = 'NUMERO_GARANTIA'
    end
    object Itens_NotaTIPO_DOC_GARANTIA: TFIBStringField
      FieldName = 'TIPO_DOC_GARANTIA'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_NotaDATA: TFIBDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object Itens_NotaSITUACAO_TRIBUTARIA: TFIBStringField
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_NotaBASE_ICMS_SUBSTITUICAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVALOR_ICMS_SUBSTITUICAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaALIQUOTA_ICMS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_ICMS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaALIQUOTA_IPI: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVALOR_OUTRAS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_OUTRAS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaDESCONTO_EXTRA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'DESCONTO_EXTRA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_TOTAL_BRUTO: TFIBFloatField
      FieldName = 'VALOR_TOTAL_BRUTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000000'
    end
    object Itens_NotaALIQUOTA_IVA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_IVA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
    end
    object Itens_NotaALIQUOTA_ICMS_IVA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_ICMS_IVA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
    end
    object Itens_NotaNUMERO_NOTA_DEVOLUCAO: TFIBIntegerField
      FieldName = 'NUMERO_NOTA_DEVOLUCAO'
    end
    object Itens_NotaTIPO_DOC_NOTA_DEVOLUCAO: TFIBStringField
      FieldName = 'TIPO_DOC_NOTA_DEVOLUCAO'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_NotaDATA_NOTA_DEVOLUCAO: TFIBDateTimeField
      FieldName = 'DATA_NOTA_DEVOLUCAO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object Itens_NotaQTDE_DEVOLVIDA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'QTDE_DEVOLVIDA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
    end
    object Itens_NotaNUMERO_NOTA_ORIGEM: TFIBIntegerField
      FieldName = 'NUMERO_NOTA_ORIGEM'
    end
    object Itens_NotaTIPO_DOC_NOTA_ORIGEM: TFIBStringField
      FieldName = 'TIPO_DOC_NOTA_ORIGEM'
      Size = 3
      EmptyStrToNull = True
    end
    object Itens_NotaDATA_NOTA_ORIGEM: TFIBDateTimeField
      FieldName = 'DATA_NOTA_ORIGEM'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object Itens_NotaPCREDSN_N29: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'PCREDSN_N29'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
    end
    object Itens_NotaVCREDICMSSN_N30: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VCREDICMSSN_N30'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
    end
    object Itens_NotaPICMSST_N22: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'PICMSST_N22'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
    end
    object Itens_NotaPREDBCST_N2: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'PREDBCST_N2'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
    end
    object Itens_NotaNUMERO_ADICAO: TFIBIntegerField
      FieldName = 'NUMERO_ADICAO'
    end
    object Itens_NotaVALOR_FRETE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_SEGURO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaVALOR_OUTRAS_DESPESAS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_OUTRAS_DESPESAS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaCOEFICIENTE_REDUCAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'COEFICIENTE_REDUCAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
    end
    object Itens_NotaCOEFICIENTE_REDUCAO_IVA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'COEFICIENTE_REDUCAO_IVA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaALIQUOTA_PIS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_PIS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaALIQUOTA_COFINS: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_COFINS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaCST_PIS_COFINS: TFIBStringField
      FieldName = 'CST_PIS_COFINS'
      Size = 2
      EmptyStrToNull = True
    end
    object Itens_NotaBASE_IPI: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.0000'
      Size = 4
    end
    object Itens_NotaOBS_ITEM_VENDIDO: TFIBBlobField
      FieldName = 'OBS_ITEM_VENDIDO'
      Size = 8
    end
    object Itens_NotaN_PEDIDO_COMPRA: TFIBStringField
      FieldName = 'N_PEDIDO_COMPRA'
      Size = 50
      EmptyStrToNull = True
    end
    object Itens_NotaN_ITEM_COMPRA: TFIBStringField
      FieldName = 'N_ITEM_COMPRA'
      Size = 50
      EmptyStrToNull = True
    end
    object Itens_NotaTPVIATRANSP: TFIBIntegerField
      FieldName = 'TPVIATRANSP'
    end
    object Itens_NotaTPINTERMEDIO: TFIBIntegerField
      FieldName = 'TPINTERMEDIO'
    end
    object Itens_NotaVBCUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VBCUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPFCPUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PFCPUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPICMSUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PICMSUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPICMSINTER: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PICMSINTER'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaPICMSINTERPART: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PICMSINTERPART'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVFCPUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VFCPUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVICMSUFDEST: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSUFDEST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVICMSUFREMET: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSUFREMET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaVICMSDESON: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'VICMSDESON'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object Itens_NotaNOME_APLICACAO: TFIBStringField
      FieldName = 'NOME_APLICACAO'
      Size = 70
      EmptyStrToNull = True
    end
    object Itens_NotaCOD_FABRICANTE: TFIBStringField
      FieldName = 'COD_FABRICANTE'
      Size = 60
      EmptyStrToNull = True
    end
    object Itens_NotaPROMOCAO: TFIBStringField
      FieldName = 'PROMOCAO'
      Size = 1
      EmptyStrToNull = True
    end
    object Itens_NotaTIPO_DEVOLUCAO: TFIBStringField
      FieldName = 'TIPO_DEVOLUCAO'
      Size = 1
      EmptyStrToNull = True
    end
  end
end