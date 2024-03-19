unit U_Importa_Dados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet, DBClient, Grids,
  Wwdbigrd, Wwdbgrid, LbSpeedButton, StdCtrls, Buttons, ExtCtrls, Registry, Math,
  ComCtrls, ComObj, AdvProgressBar;

type
  TF_Importacao = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Dlg_xml: TOpenDialog;
    CDS_produto_ecom: TClientDataSet;
    CDS_produto_ecomcodigo_catalogo: TStringField;
    CDS_produto_ecomdescricao: TStringField;
    prod: TpFIBDataSet;
    prodCODIGO_PRODUTO: TFIBIntegerField;
    ds_produto_ecom: TDataSource;
    qry_insert_prod_ecommerce: TpFIBQuery;
    L_Caminho_Banco: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Label3: TLabel;
    SB_NotaFiscal: TSpeedButton;
    Label12: TLabel;
    edt_cam_xml_Nota_Itens: TEdit;
    E_RegNotaVenda: TEdit;
    Panel8: TPanel;
    LbSpeedButton1: TLbSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label4: TLabel;
    pb1: TAdvProgressBar;
    Importa: TEdit;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    SB_Itens_Nota: TSpeedButton;
    E_Itens_nota: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    AdvProgressBar1: TAdvProgressBar;
    Panel3: TPanel;
    Btn_Importa_Itens_nota: TLbSpeedButton;
    TabSheet6: TTabSheet;
    procedure SB_Itens_NotaClick(Sender: TObject);
    procedure Btn_Importa_Itens_notaClick(Sender: TObject);
    procedure SB_NotaFiscalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SB_Itens_CompraClick(Sender: TObject);
  private
    { Private declarations }

 // arredonda valor
    function Arredondar(Value: Extended; Decimals: Integer): Extended;
  public
    { Public declarations }
  end;

var
  F_Importacao: TF_Importacao;

implementation

uses ExcelXP, DM_Modulo;

{$R *.dfm}

function TF_Importacao.Arredondar(Value: Extended; Decimals: Integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  { A convers�o para string e depois para float evita
    erros de arredondamentos indesej�veis. }
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

procedure TF_Importacao.Btn_Importa_Itens_notaClick(Sender: TObject);
var
  indice_produto : integer;
  catalogo_aux :string;
  codigo_produto_aux :string;
begin

  if CDS_produto_ecom.RecordCount > 0 then
     begin


       CDS_produto_ecom.First;
       While not CDS_produto_ecom.Eof do
          Begin
           

            if  catalogo_aux = CDS_produto_ecomcodigo_catalogo.Value then
                begin
                 inc(indice_produto);
                 catalogo_aux := CDS_produto_ecomcodigo_catalogo.Value + '.' +  inttostr(indice_produto);
                end
            else
                begin
                 indice_produto := 0;
                 catalogo_aux := CDS_produto_ecomcodigo_catalogo.Value + '.' +  inttostr(indice_produto);
                end;

                        {
               with DM_estoque.descricao_ecommerce do
                           begin
                             Close;
                             ParamByName('codigo_produto').AsString := '0';
                             Open;
                           end;

                          if not (DM_estoque.descricao_ecommerce.state in [dsEdit]) then
                            DM_estoque.descricao_ecommerce.edit;

                          DM_estoque.descricao_ecommerceCODIGO_PRODUTO.Value := produtoCODIGO_PRODUTO.value;
                          DM_estoque.descricao_ecommerceDESCRICAO.Value :=  CDS_produto_ecomdescricao.Value;
                          DM_estoque.descricao_ecommerceCODIGO_CATALAGO.Value :=  catalogo_aux;
                          DM_estoque.descricao_ecommerce.Insert;
            }

            catalogo_aux :=  CDS_produto_ecomcodigo_catalogo.Value;
            CDS_produto_ecom.Next;
          End;
        Data_Modulo.TR.CommitRetaining;
        ShowMessage('Importa��o Realizada com sucesso!');
        CDS_produto_ecom.close;
        CDS_produto_ecom.CreateDataSet;
     end
  else
    ShowMessage('N�o Existem Dados para serem importados.');



end;

procedure TF_Importacao.SB_Itens_CompraClick(Sender: TObject);
var
  Excel : Variant;
  Linha,coluna: Integer;
  fim_linha,fim_coluna: string;
  var_Teste :String;
  numero_nota : Integer;
  var_cod_cliente : String;
  var_CIF_FOB : String;
  var_cod_representante : integer;
  var_ID_NFE : String;
  var_CFOP_ITENS : String;
  var_vlr_sub_total : Currency;
begin
   { Dlg_xml.Execute();
    E_Itens_Compra.Text := Dlg_xml.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;
                     }
    {Excel.Workbooks.Add;}
   { Excel.WorkBooks.Open(E_Itens_Compra.Text);
    Linha:=2;
    coluna:=1;     }
{--------- Variaveis ----------------}
  {  numero_nota := 0;
    var_cod_cliente := '';
    var_CIF_FOB     := '';
    var_cod_representante := 0;
    var_ID_NFE := '';
    var_CFOP_ITENS := '';
    var_vlr_sub_total := 0;
                               }
{ ----------------------------------------------}
 {
    With AdvProgressBar4 do
      begin
          Application.ProcessMessages;

          Max        := StrToInt(E_QtdRegItensCompra.Text);
          Position   := 0;
      end;
    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin         }
{--------------------------------------------- Insere Notas Fiscais -----------------------------------------------------------------------}
   {     AdvProgressBar4.Position   := AdvProgressBar4.Position + 1;
        Application.ProcessMessages;

        numero_nota := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
       // ShowMessage(IntToStr(numero_nota));
        if numero_nota > 0 then
           begin
            try
               // processo de entrada da nf-e
              With Data_Modulo.Itens_Compra do
                 begin
                    If Not Active then
                        Open
                    else
                        begin
                          Close;
                          Open;
                        end;

                // insere dados do xml na tabela de itens_compra
                     Insert;
                     Data_Modulo.Itens_CompraCOD_LOJA.AsInteger              := Excel.WorkBooks[1].Sheets[1].Cells[linha,6];
                     Data_Modulo.Itens_CompraDATA_NOTA.AsDateTime            := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];

                     if Length(Excel.WorkBooks[1].Sheets[1].Cells[linha,2]) = 6 then
                        Data_Modulo.Itens_CompraCOD_FORNECEDOR.AsInteger        := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,2],2,5))
                     else
                        Data_Modulo.Itens_CompraCOD_FORNECEDOR.AsInteger        := Excel.WorkBooks[1].Sheets[1].Cells[linha,2];

                     Data_Modulo.Itens_CompraNUM_NOTA.AsInteger              := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
                     Data_Modulo.Itens_CompraCOD_PRODUTO.AsInteger           := Excel.WorkBooks[1].Sheets[1].Cells[linha,7];
                     Data_Modulo.Itens_CompraVALOR_UNIT.AsFloat              := Excel.WorkBooks[1].Sheets[1].Cells[linha,15];
                     Data_Modulo.Itens_CompraDESCONTO.AsFloat                := Excel.WorkBooks[1].Sheets[1].Cells[linha,22];
                     Data_Modulo.Itens_CompraDESCONTO_EXTRA.AsFloat          := Excel.WorkBooks[1].Sheets[1].Cells[linha,22];
                     Data_Modulo.Itens_CompraNUMERO_GARANTIA.AsInteger       := 0;


                     Data_Modulo.Itens_CompraVALOR_OUTRAS_DESPESAS.AsFloat   := 0;

                     Data_Modulo.Itens_CompraICMS.AsFloat                    := Excel.WorkBooks[1].Sheets[1].Cells[linha,25];

                     Data_Modulo.Itens_CompraIPI.AsFloat                     := Excel.WorkBooks[1].Sheets[1].Cells[linha,26];
                     Data_Modulo.Itens_CompraVALOR_IPI.AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,19];

                     Data_Modulo.Itens_CompraQTDE.AsFloat                    := Excel.WorkBooks[1].Sheets[1].Cells[linha,12];
                     Data_Modulo.Itens_CompraSEQUENCIA.AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,5];

                     var_CFOP_ITENS                                          := Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,11],0,1);
                     Data_Modulo.Itens_CompraCFOP.AsString                   := var_CFOP_ITENS + '.' + Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,11],2,3); // CFOP;
                     Data_Modulo.Itens_CompraVALOR_LIQUIDO.AsFloat           := Excel.WorkBooks[1].Sheets[1].Cells[linha,15];
                     Data_Modulo.Itens_CompraBASE_ICMS.AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,20];
                     Data_Modulo.Itens_CompraVALOR_ICMS.AsFloat              := Excel.WorkBooks[1].Sheets[1].Cells[linha,21];
                     Data_Modulo.Itens_CompraBASE_ICMS_SUBSTITUICAO.AsFloat  := Excel.WorkBooks[1].Sheets[1].Cells[linha,23];

                     Data_Modulo.Itens_CompraVALOR_ICMS_SUBSTITUICAO.AsFloat := Excel.WorkBooks[1].Sheets[1].Cells[linha,23];

                     Data_Modulo.Itens_CompraSITUACAO_TRIBUTARIA.AsString    := Excel.WorkBooks[1].Sheets[1].Cells[linha,29];
                     Data_Modulo.Itens_CompraVALOR_FRETE.AsFloat             := 0;
                     Data_Modulo.Itens_CompraVALOR_SEGURO.AsFloat            := 0;
                     Data_Modulo.Itens_CompraCST_PIS_COFINS.AsString         := '';

                     Data_Modulo.Itens_CompraPIS.AsFloat                     := 0;
                     Data_Modulo.Itens_CompraVALOR_PIS.AsFloat               := 0;


                    Data_Modulo.Itens_CompraBASE_PIS.AsFloat                 := 0;
                    Data_Modulo.Itens_CompraBASE_COFINS.AsFloat              := 0;

                     Data_Modulo.Itens_CompraCOFINS.AsFloat                  := 0;
                     Data_Modulo.Itens_CompraVALOR_COFINS.AsFloat            := 0;

                     Data_Modulo.Itens_CompraVALOR_OUTRAS.AsFloat            := 0;
                     Data_Modulo.Itens_CompraIVA_SUBSTITUICAO.AsFloat        := 0;
                     Data_Modulo.Itens_CompraALIQUOTA_SUBSTITUICAO.AsFloat   := 0;

                     Post;

                    Data_Modulo.Db.ApplyUpdates([Data_Modulo.Itens_Compra]);
                    Data_Modulo.Tr.CommitRetaining;
                 end;{Pssa mensagem ser� passada para a nossa procedure }
       {     except
              on E: Exception do
               begin
                  raise Exception.Create('Erro encontrado ao Grava Itens da Nota de Compra. Erro: ' + #10#13 + E.Message);
                  Excel.Application.quit;
               end;
            end;
           end;
         Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      end; // Fim While Linha

      Data_Modulo.Db.ApplyUpdates([Data_Modulo.Itens_Compra]);
      Data_Modulo.Tr.CommitRetaining;
      ShowMessage('Importa��o dos itens de compra Realizado com sucesso!');

    Excel.Application.quit;    }
end;

procedure TF_Importacao.SB_Itens_NotaClick(Sender: TObject);
var
  Excel : Variant;
  Linha,coluna: Integer;
  fim_linha,fim_coluna: string;
  var_Teste :String;
  numero_nota : Integer;
  var_cod_cliente : String;
  var_CIF_FOB : String;
  var_cod_representante : integer;
  var_ID_NFE : String;
  var_CFOP_ITENS : String;
  var_vlr_sub_total : Currency;
  teste: Integer;
  Var_QtdRegItensVenda : Integer;
begin
    Dlg_xml.Execute();
    edt_cam_xml_Nota_Itens.Text := Dlg_xml.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;

    {Excel.Workbooks.Add;}
    Excel.WorkBooks.Open(edt_cam_xml_Nota_Itens.Text);
    Linha:=2;  // Votlar para Linha 2
    coluna:=1;
{--------- Variaveis ----------------}
    numero_nota := 0;
    var_cod_cliente := '';
    var_CIF_FOB     := '';
    var_cod_representante := 0;
    var_ID_NFE := '';
    var_CFOP_ITENS := '';
    var_vlr_sub_total := 0;
    Var_QtdRegItensVenda := 0;

{ ----------------------------------------------}

    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin
        Var_QtdRegItensVenda := Var_QtdRegItensVenda + 1;
        Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      End;

      Excel.Application.quit;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;

    {Excel.Workbooks.Add;}
    Excel.WorkBooks.Open(edt_cam_xml_Nota_Itens.Text);
    Linha:=2;   // Votlar para Linha 2
    coluna:=1;

    With AdvProgressBar1 do
      begin
          Application.ProcessMessages;

          Max        := Var_QtdRegItensVenda;
          Position   := 0;
      end;

    with Data_Modulo.Itens_Nota do
      begin
        Close;
        Open;
      end;

    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin
{--------------------------------------------- Insere Notas Fiscais -----------------------------------------------------------------------}
        AdvProgressBar1.Position   := AdvProgressBar1.Position + 1;
        Application.ProcessMessages;

        numero_nota := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
       // ShowMessage(IntToStr(numero_nota));
        if numero_nota > 0 then
           begin
            try
            // Atribui Valores para os Itens da Nota
              With Data_Modulo.Itens_Nota do
                begin
                  Data_Modulo.Itens_Nota.Insert;
                  Data_Modulo.Itens_NotaNUMERO_NF.AsInteger     := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
                  Data_Modulo.Itens_NotaCOD_LOJA.AsInteger      := Excel.WorkBooks[1].Sheets[1].Cells[linha,2];
                  Data_Modulo.Itens_NotaTIPO_DOC.AsString       := 'NFE';
                  Data_Modulo.Itens_NotaDATA.AsDateTime         := Excel.WorkBooks[1].Sheets[1].Cells[linha,19];
                  Data_Modulo.Itens_NotaCOD_PRODUTO.Value       := Excel.WorkBooks[1].Sheets[1].Cells[linha,6];  // cod__produto
                  Data_Modulo.Itens_NotaDESCRICAO_PRODUTO.Value := Excel.WorkBooks[1].Sheets[1].Cells[linha,7];
                  Data_Modulo.Itens_NotaSEQUENCIA.Value         := Excel.WorkBooks[1].Sheets[1].Cells[linha,8];
                  Data_Modulo.Itens_NotaCOD_CLIENTE.AsInteger   := Excel.WorkBooks[1].Sheets[1].Cells[linha,17];; // N�o vem o codigo do Cliente no Excel
                  Data_Modulo.Itens_NotaCOD_FORNECEDOR.Value    := 0;
                  Data_Modulo.Itens_NotaVALOR_ICMS.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,9];
                  Data_Modulo.Itens_NotaVALOR_IPI.AsFloat       := Excel.WorkBooks[1].Sheets[1].Cells[linha,10];
                  Data_Modulo.Itens_NotaQTDE_PEDIDO.AsInteger   := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,11]);
                  Data_Modulo.Itens_NotaQTDE_ATENDIDA.AsInteger := Data_Modulo.Itens_NotaQTDE_PEDIDO.AsInteger;
                  Data_Modulo.Itens_NotaVALOR_VENDA.AsFloat       := Excel.WorkBooks[1].Sheets[1].Cells[linha,12];
                  Data_Modulo.Itens_NotaVALOR_OPERACIONAL.AsFloat := Data_Modulo.Itens_NotaVALOR_VENDA.Value;
                  Data_Modulo.Itens_NotaVALOR_LIQUIDO.AsFloat     := Excel.WorkBooks[1].Sheets[1].Cells[linha,13];
                  Data_Modulo.Itens_NotaVALOR_DESCONTO.AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,39];
                  Data_Modulo.Itens_NotaPERC_DESCONTO.AsFloat     := Excel.WorkBooks[1].Sheets[1].Cells[linha,41];
                  Data_Modulo.Itens_NotaPESO_BRUTO.AsFloat        := 0;
                  Data_Modulo.Itens_NotaPESO_LIQUIDO.AsFloat      := 0;
                  Data_Modulo.Itens_NotaCOD_CATALAGO.Value        := '';   // N�o tem no sistema neom
                  Data_Modulo.Itens_NotaVALOR_ISS.AsFloat         := 0.00;
                  Data_Modulo.Itens_NotaVALOR_ISENTA.AsFloat      := 0.00;
                  Data_Modulo.Itens_NotaBASE_ICMS.AsFloat         := Excel.WorkBooks[1].Sheets[1].Cells[linha,36];
                  Data_Modulo.Itens_NotaBASE_ICMS_SUBST.AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,37];
                  Data_Modulo.Itens_NotaCFOP.AsString             := Excel.WorkBooks[1].Sheets[1].Cells[linha,16];
                  Data_Modulo.Itens_NotaCOD_TIPO_MOV.Value        := Excel.WorkBooks[1].Sheets[1].Cells[linha,18];
                  Data_Modulo.Itens_NotaSITUACAO_TRIBUTARIA.Value         := Excel.WorkBooks[1].Sheets[1].Cells[linha,20];
                  Data_Modulo.Itens_NotaBASE_ICMS_SUBSTITUICAO.AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,21];
                  Data_Modulo.Itens_NotaVALOR_ICMS_SUBSTITUICAO.AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,22];
                  Data_Modulo.Itens_NotaALIQUOTA_ICMS.AsFloat     := Excel.WorkBooks[1].Sheets[1].Cells[linha,23];
                  Data_Modulo.Itens_NotaALIQUOTA_IPI.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,24];
                  Data_Modulo.Itens_NotaVALOR_OUTRAS.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,30];
                  Data_Modulo.Itens_NotaDESCONTO_EXTRA.AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,39];
                  Data_Modulo.Itens_NotaALIQUOTA_IVA.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,26];
                  Data_Modulo.Itens_NotaALIQUOTA_ICMS_IVA.AsFloat := Excel.WorkBooks[1].Sheets[1].Cells[linha,27];
                  Data_Modulo.Itens_NotaVALOR_FRETE.AsFloat       := Excel.WorkBooks[1].Sheets[1].Cells[linha,28];
                  Data_Modulo.Itens_NotaVALOR_SEGURO.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,29];
                  Data_Modulo.Itens_NotaVALOR_OUTRAS_DESPESAS.AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,30];
                  Data_Modulo.Itens_NotaCOEFICIENTE_REDUCAO.AsFloat        := Excel.WorkBooks[1].Sheets[1].Cells[linha,31];
                  Data_Modulo.Itens_NotaCOEFICIENTE_REDUCAO_IVA.AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,32];
                  Data_Modulo.Itens_NotaALIQUOTA_PIS.AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,33];
                  Data_Modulo.Itens_NotaALIQUOTA_COFINS.AsFloat            := Excel.WorkBooks[1].Sheets[1].Cells[linha,34];
                  Data_Modulo.Itens_NotaCST_PIS_COFINS.Value               := Excel.WorkBooks[1].Sheets[1].Cells[linha,35];
                  Data_Modulo.Itens_NotaBASE_IPI.AsFloat                   := 0.00;
                  Data_Modulo.Itens_Nota.Post;
                end;
            except
               ShowMessage('ERRO');
            end;
           end;
         Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      end; // Fim While Linha

      Data_Modulo.DB.ApplyUpdates([Data_Modulo.Itens_Nota]);
      Data_Modulo.Tr.CommitRetaining;
      ShowMessage('Importa��o Realizada com sucesso!');

    Excel.Application.quit;
end;

procedure TF_Importacao.SB_NotaFiscalClick(Sender: TObject);
var
  Excel : Variant;
  Linha,coluna: Integer;
  fim_linha,fim_coluna: string;
  var_Teste :String;
  numero_nota : Integer;
  var_cod_cliente : String;
  var_CIF_FOB : String;
  var_cod_representante : integer;
  var_ID_NFE : String;
  var_CFOP_NOTA : String;
  var_vlr_sub_total : Currency;
  var_numero_nfe: String;
begin
    Dlg_xml.Execute();
    edt_cam_xml_Nota_Itens.Text := Dlg_xml.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;

    {Excel.Workbooks.Add;}
    Excel.WorkBooks.Open(edt_cam_xml_Nota_Itens.Text);
    Linha:=2;
    coluna:=1;
{--------- Variaveis ----------------}
    numero_nota := 0;
    var_cod_cliente := '';
    var_CIF_FOB     := '';
    var_cod_representante := 0;
    var_ID_NFE := '';
    var_CFOP_NOTA := '';
    var_vlr_sub_total := 0;
    var_numero_nfe := '';

{ ----------------------------------------------}

    With pb1 do
      begin
          Application.ProcessMessages;

          Max        := StrToInt(E_RegNotaVenda.Text); // Quantidade de Registros
          Position   := 0;
      end;
    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin
{--------------------------------------------- Insere Notas Fiscais -----------------------------------------------------------------------}
        pb1.Position   := pb1.Position + 1;
        Application.ProcessMessages;

        numero_nota := Excel.WorkBooks[1].Sheets[1].Cells[linha,3];
       // ShowMessage(IntToStr(numero_nota));
        if numero_nota > 0 then
           begin
            try
            // Atribui Valores para os Itens da Nota
              With Data_Modulo.GRAVA_NOTA do
                begin
                   var_numero_nfe      := Excel.WorkBooks[1].Sheets[1].Cells[linha,3];
                   var_numero_nfe      := var_numero_nfe;//Copy(var_numero_nfe,28,7);

                   Params[0].AsInteger := StrToInt(var_numero_nfe);//Excel.WorkBooks[1].Sheets[1].Cells[linha,3];//Numero_Nf; // Posi��o do numero da nota Fiscal
                   Params[1].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,23]; //FATURACOD_REP.value;
                                               // Codigo do Cliente
                   var_cod_cliente     := Excel.WorkBooks[1].Sheets[1].Cells[linha,13];

                   if Length(Excel.WorkBooks[1].Sheets[1].Cells[linha,13]) = 7 then
                     Params[2].AsInteger := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,13],2,6)) // cod cliente
                   else
                     Params[2].AsInteger    := Excel.WorkBooks[1].Sheets[1].Cells[linha,13];

                   Params[3].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,20]; //FATURACOD_PRAZO.value; // Codigo do Prazo  // CodTipoVenda
                   Params[4].AsInteger := 0;//FATURACOD_TIPO_MOV.value;// Numero do Titulo do Banco

                   With Data_Modulo.Tipo_Mov do
                    begin
                      Close;
                      ParamByName('Codigo_Aux').AsInteger := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,20],2,4));
                      Open;
                    end;

                   Params[5].AsString  := '';//Data_Modulo.Tipo_MovCFOP.Value; //FATURACFOP.value;  // CFOP
                   Params[6].AsInteger := 0; //FATURACOD_TRANSP.value; // Venda

                   with Data_Modulo.Cliente do
                    begin
                      Close;
                      ParamByName('Codigo_Aux').AsInteger := StrToInt(var_cod_cliente);
                      Open;
                    end;

                   Params[7].AsString   := Data_Modulo.ClienteRAZAO_SOCIAL.Value; //+ ' / ' + Data_Modulo.ClienteCOMPRADOR.Value; //FATURANOME_COMPRADOR.value; // Venda
                   Params[8].AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,55]; //Base_ICMS; // Base
                   Params[9].AsFloat    := 0; // base issqn
                   Params[10].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,72]; //base_icms_substituicao;  // base icms substitui��o
                   Params[11].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,56]; //Valor_ICMS;  // ICMS
                   Params[12].AsFloat   := 0;                       // Total de issqn
                   Params[13].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,71]; //valor_icms_substituicao; // Total de IVA
                   Params[14].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,58]; //var_total_ipi;           // Total de ipi
                   Params[15].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,71]; //valor_icms_substituicao; // Valor icms substitui��o

                   Params[16].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,41]; //FATURAVALOR_FRETE.value; // Valor do Frete
                   Params[17].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,28]; //FATURAVALOR_SEGURO.value; // Valor do Seguro
                   Params[18].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,33]; //FATURAVALOR_DESP_ACESSORIOS.value + varTaxa_Cobranca;// Despesas e Acessorios
                   Params[19].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,40]; //FATURAVALOR_DESCONTO.value;// Valor de Desconto
                   Params[20].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,39]; //FATURAPERC_DESCONTO.value; // Percentual de desconto

                   var_vlr_sub_total    := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];

                   Params[21].AsFloat   := var_vlr_sub_total  +
                                           Params[14].AsFloat +
                                           Params[17].AsFloat + // seguro
                                           Params[18].AsFloat; // outras despeas
                                           //Params[16].AsFloat + // frete
                                             // valor de substitui��o

                  // Params[21].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,48]; // Total Nota;
                   Params[22].AsFloat   := var_vlr_sub_total - Params[15].AsFloat;//Excel.WorkBooks[1].Sheets[1].Cells[linha,48]; //FATURASUB_TOTAL.value;
                   Params[23].AsString  := Excel.WorkBooks[1].Sheets[1].Cells[linha,27]; //FATURAOBS_NF.value; // Obs. na Nota

                   var_CIF_FOB := Excel.WorkBooks[1].Sheets[1].Cells[linha,44];
                   if var_CIF_FOB = 'S' then
                     Params[24].AsString  := '0' //FATURACIF_FOB.value; // Cif ou Fob
                   else
                     if var_CIF_FOB = 'F' then
                       Params[24].AsString  := '1' //FATURACIF_FOB.value; // Cif ou Fob
                     else
                       if var_CIF_FOB = 'C' then
                         Params[24].AsString  := '2'; //FATURACIF_FOB.value; // Cif ou Fob

                   Params[25].AsInteger := 0; //FATURANUMERO.value; // Numero do Pedido

                   Params[26].AsString  := 'N'; // Cancelado S/N

                   Params[27].AsFloat   := 0; //FATURACOMISSAO.value; // Comissao do Vendedor
                   Params[28].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,5]; //FATURADATA_PEDIDO.value; // Data do Pedido
                   Params[29].AsString  := 'DEV'; //FATURATIPO_DOC.value; // Tipo de Documento
                   Params[30].AsString  := 'S';
                   Params[31].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,2];  //FATURACOD_LOJA.value;     // Codigo da Loja
                   Params[32].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,5]; //FATURADATA_SAIDA.Value;  // Data da Saida
                   Params[33].AsString  := 'S';              // Nota Fiscal gerou fatura S/N
                   Params[34].AsString  := var_numero_nfe;//Excel.WorkBooks[1].Sheets[1].Cells[linha,3];//IntToStr(Numero_Nf) // NUMERO DA DUPLICATA
                   Params[35].AsString  := ''; //FATURANUMERO.AsString;
                   Params[36].AsString  := ''; // Numero de Cupom
                   Params[37].AsFloat   := 0;//Peso_Liquido; // Peso liquido
                   Params[38].AsFloat   := 0;//Peso_Bruto; // peso bruto
                   Params[39].AsFloat   := 0;//Qtde_Total; // qtde itens
                   Params[40].AsString  := ''; // placa
                   Params[41].AsString  := ''; // Modelo
                   Params[42].AsString  := ''; // Numero do carro
                   Params[43].AsString  := ''; // Frota
                   Params[44].AsInteger := 0; // kilometro
                   Params[45].AsFloat   := 0; // desconto no servi�o
                   Params[46].AsFloat   := 0; // total no servi�o

                                    {
                     with Data_Modulo.PESQUISA_USUARIO do
                                        begin
                                          Close;
                                          ParamByName('COD_USUARIO_AUX').AsInteger := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,64]);
                                          open;
                                        end;
                  }

                   Params[47].AsString  := 'IMPORTACAO';//Data_Modulo.PESQUISA_USUARIONOME.AsString; // Nome do Usuario que Fez a nota Fiscal
                   Params[48].AsString  := 'N';
                   Params[49].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,69]; //FATURAVOLUME.value;
                   Params[50].AsString  := ''; // Observa��o MEMO
                   Params[51].AsString  := ''; //FATURAESPECIE.value; //
                   Params[52].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,23]; //dm_Geral.ClienteVENDEDOR_EXT.value;
                   Params[53].AsString  := Excel.WorkBooks[1].Sheets[1].Cells[linha,111]; //Chave da Nota Fiscal ID_NFE
                   Params[54].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,5]; //Data Faturamento da Nota Fiscal
                   ExecProc;

                   Data_Modulo.Tr.CommitRetaining;

                end;  {Pssa mensagem ser� passada para a nossa procedure }
            except
            
            end;
           end;
         Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      end; // Fim While Linha

      Data_Modulo.Tr.CommitRetaining;
      ShowMessage('Importa��o de Notas Fiscais Realizada com sucesso!');

    Excel.Application.quit;
end;

procedure TF_Importacao.SpeedButton1Click(Sender: TObject);
var
  Excel : Variant;
  Linha,coluna: Integer;
  fim_linha,fim_coluna: string;
  var_Teste :String;
  numero_nota : Integer;
  var_cod_cliente : String;
  var_CIF_FOB : String;
  var_cod_representante : integer;
  var_ID_NFE : String;
  var_CFOP_NOTA : String;
  var_vlr_sub_total : Currency;
begin
    Dlg_xml.Execute();
    edt_cam_xml_Nota_Itens.Text := Dlg_xml.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;

    {Excel.Workbooks.Add;}
    Excel.WorkBooks.Open(edt_cam_xml_Nota_Itens.Text);
    Linha:=2;
    coluna:=1;
{--------- Variaveis ----------------}
    numero_nota := 0;
    var_cod_cliente := '';
    var_CIF_FOB     := '';
    var_cod_representante := 0;
    var_ID_NFE := '';
    var_CFOP_NOTA := '';
    var_vlr_sub_total := 0;

{ ----------------------------------------------}

    With pb1 do
      begin
          Application.ProcessMessages;

          Max        := 8400; // Quantidade de Registros
          Position   := 0;
      end;
    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin
{--------------------------------------------- Insere Notas Fiscais -----------------------------------------------------------------------}
        pb1.Position   := pb1.Position + 1;
        Application.ProcessMessages;

        numero_nota := Excel.WorkBooks[1].Sheets[1].Cells[linha,4];
       // ShowMessage(IntToStr(numero_nota));
        if numero_nota > 0 then
           begin
            try
            // Atribui Valores para os Itens da Nota
              With Data_Modulo.GRAVA_NOTA do
                begin
                   Params[0].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,4];//Numero_Nf; // Posi��o do numero da nota Fiscal
                   Params[1].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,24]; //FATURACOD_REP.value;
                                               // Codigo do Cliente
                                               var_cod_cliente := Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,14],2,10);;
                   Params[2].AsInteger := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,14],2,10)); //FATURACOD_CLIENTE.value;
                   Params[3].AsInteger := 0; //FATURACOD_PRAZO.value; // Codigo do Prazo
                   Params[4].AsInteger := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,21],2,4));//FATURACOD_TIPO_MOV.value;// Numero do Titulo do Banco

                   With Data_Modulo.Tipo_Mov do
                    begin
                      Close;
                      ParamByName('Codigo_Aux').AsInteger := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,21],2,4));
                      Open;
                    end;

                   Params[5].AsString  := Data_Modulo.Tipo_MovCFOP.Value; //FATURACFOP.value;  // CFOP
                   Params[6].AsInteger := 0; //FATURACOD_TRANSP.value; // Venda

                   with Data_Modulo.Cliente do
                    begin
                      Close;
                      ParamByName('Codigo_Aux').AsInteger := StrToInt(var_cod_cliente);
                      Open;
                    end;

                   Params[7].AsString   := Data_Modulo.ClienteRAZAO_SOCIAL.Value; //+ ' / ' + Data_Modulo.ClienteCOMPRADOR.Value; //FATURANOME_COMPRADOR.value; // Venda
                   Params[8].AsFloat    := Excel.WorkBooks[1].Sheets[1].Cells[linha,56]; //Base_ICMS; // Base
                   Params[9].AsFloat    := 0; // base issqn
                   Params[10].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,73]; //base_icms_substituicao;  // base icms substitui��o
                   Params[11].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,57]; //Valor_ICMS;  // ICMS
                   Params[12].AsFloat   := 0;                       // Total de issqn
                   Params[13].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,72]; //valor_icms_substituicao; // Total de IVA
                   Params[14].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,59]; //var_total_ipi;           // Total de ipi
                   Params[15].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,72]; //valor_icms_substituicao; // Valor icms substitui��o

                   Params[16].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,42]; //FATURAVALOR_FRETE.value; // Valor do Frete
                   Params[17].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,29]; //FATURAVALOR_SEGURO.value; // Valor do Seguro
                   Params[18].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,34]; //FATURAVALOR_DESP_ACESSORIOS.value + varTaxa_Cobranca;// Despesas e Acessorios
                   Params[19].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,41]; //FATURAVALOR_DESCONTO.value;// Valor de Desconto
                   Params[20].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,40]; //FATURAPERC_DESCONTO.value; // Percentual de desconto

                   var_vlr_sub_total    := Excel.WorkBooks[1].Sheets[1].Cells[linha,48];

                   Params[21].AsFloat   := var_vlr_sub_total  +
                                           Params[14].AsFloat +
                                           Params[16].AsFloat + // frete
                                           Params[17].AsFloat + // seguro
                                           Params[18].AsFloat + // outras despeas
                                           Params[15].AsFloat;  // valor de substitui��o

                  // Params[21].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,48]; // Total Nota;
                   Params[22].AsFloat   := Excel.WorkBooks[1].Sheets[1].Cells[linha,48]; //FATURASUB_TOTAL.value;
                   Params[23].AsString  := Excel.WorkBooks[1].Sheets[1].Cells[linha,28]; //FATURAOBS_NF.value; // Obs. na Nota

                   var_CIF_FOB := Excel.WorkBooks[1].Sheets[1].Cells[linha,46];
                   if var_CIF_FOB = 'S' then
                     Params[24].AsString  := '0' //FATURACIF_FOB.value; // Cif ou Fob
                   else
                     if var_CIF_FOB = 'F' then
                       Params[24].AsString  := '1' //FATURACIF_FOB.value; // Cif ou Fob
                     else
                       if var_CIF_FOB = 'C' then
                         Params[24].AsString  := '2'; //FATURACIF_FOB.value; // Cif ou Fob

                   Params[25].AsInteger := 0; //FATURANUMERO.value; // Numero do Pedido

                   Params[26].AsString  := 'N'; // Cancelado S/N

                   Params[27].AsFloat   := 0; //FATURACOMISSAO.value; // Comissao do Vendedor
                   Params[28].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,7]; //FATURADATA_PEDIDO.value; // Data do Pedido
                   Params[29].AsString  := 'NFE'; //FATURATIPO_DOC.value; // Tipo de Documento
                   Params[30].AsString  := 'S';
                   Params[31].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,2];  //FATURACOD_LOJA.value;     // Codigo da Loja
                   Params[32].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,8]; //FATURADATA_SAIDA.Value;  // Data da Saida
                   Params[33].AsString  := 'S';              // Nota Fiscal gerou fatura S/N
                   Params[34].AsString  := Excel.WorkBooks[1].Sheets[1].Cells[linha,4];//IntToStr(Numero_Nf) // NUMERO DA DUPLICATA
                   Params[35].AsString  := ''; //FATURANUMERO.AsString;
                   Params[36].AsString  := ''; // Numero de Cupom
                   Params[37].AsFloat   := 0;//Peso_Liquido; // Peso liquido
                   Params[38].AsFloat   := 0;//Peso_Bruto; // peso bruto
                   Params[39].AsFloat   := 0;//Qtde_Total; // qtde itens
                   Params[40].AsString  := ''; // placa
                   Params[41].AsString  := ''; // Modelo
                   Params[42].AsString  := ''; // Numero do carro
                   Params[43].AsString  := ''; // Frota
                   Params[44].AsInteger := 0; // kilometro
                   Params[45].AsFloat   := 0; // desconto no servi�o
                   Params[46].AsFloat   := 0; // total no servi�o

                   with Data_Modulo.PESQUISA_USUARIO do
                    begin
                      Close;
                      ParamByName('COD_USUARIO_AUX').AsInteger := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,65]);
                      open;
                    end;

                   Params[47].AsString  := Data_Modulo.PESQUISA_USUARIONOME.AsString; // Nome do Usuario que Fez a nota Fiscal
                   Params[48].AsString  := 'N';
                   Params[49].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,70]; //FATURAVOLUME.value;
                   Params[50].AsString  := ''; // Observa��o MEMO
                   Params[51].AsString  := ''; //FATURAESPECIE.value; //
                   Params[52].AsInteger := Excel.WorkBooks[1].Sheets[1].Cells[linha,24]; //dm_Geral.ClienteVENDEDOR_EXT.value;
                   Params[53].AsString  := Excel.WorkBooks[1].Sheets[1].Cells[linha,120]; //Chave da Nota Fiscal ID_NFE
                   Params[54].AsDate    := Excel.WorkBooks[1].Sheets[1].Cells[linha,7]; //Data Faturamento da Nota Fiscal
                   ExecProc;

                   Data_Modulo.Tr.CommitRetaining;

                end;  {Pssa mensagem ser� passada para a nossa procedure }
            except
              on E: Exception do
               begin
                  raise Exception.Create('Erro encontrado ao Grava Nota. Erro: ' + #10#13 + E.Message);
                  Excel.Application.quit;
               end;
            end;
           end;
         Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      end; // Fim While Linha

      Data_Modulo.Tr.CommitRetaining;
      ShowMessage('Importa��o de Notas Fiscais Realizada com sucesso!');

    Excel.Application.quit;
end;

procedure TF_Importacao.SpeedButton2Click(Sender: TObject);
var
  Excel : Variant;
  Linha,coluna: Integer;
  fim_linha,fim_coluna: string;
  var_Teste :String;
  numero_nota : Integer;
  var_cod_cliente : String;
  var_CIF_FOB : String;
  var_cod_representante : integer;
  var_ID_NFE : String;
  var_CFOP_NOTA : String;
  var_vlr_sub_total : Currency;
  base_pis,base_cofins : Double;

begin
   { Dlg_xml.Execute();
    Ed_Compra.Text := Dlg_xml.FileName;

    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := false;
    Excel.Visible       := false;

    {Excel.Workbooks.Add;}
   { Excel.WorkBooks.Open(Ed_Compra.Text);
    Linha:=2;
    coluna:=1;
{--------- Variaveis ----------------}
   { numero_nota := 0;
    var_cod_cliente := '';
    var_CIF_FOB     := '';
    var_cod_representante := 0;
    var_ID_NFE := '';
    var_CFOP_NOTA := '';
    var_vlr_sub_total := 0;

{ ----------------------------------------------}

  {  With AdvProgressBar3 do
      begin
          Application.ProcessMessages;

          Max        := StrToInt(Ed_QtdRegCompra.Text); // Quantidade de Registros
          Position   := 0;
      end;
    fim_linha   := Excel.WorkBooks[1].Sheets[1].Cells[2,1];
    While fim_linha <> '' do
      Begin
{--------------------------------------------- Insere Notas Fiscais -----------------------------------------------------------------------}
     {   AdvProgressBar3.Position   := AdvProgressBar3.Position + 1;
        Application.ProcessMessages;

        numero_nota := Excel.WorkBooks[1].Sheets[1].Cells[linha,3];
       // ShowMessage(IntToStr(numero_nota));
        if numero_nota > 0 then
           begin
            try
                 // processo de entrada da nf-e
              With Data_Modulo.compra do
                 begin
                    If Not Active then
                        Open
                    else
                        begin
                          Close;
                          Open;
                        end;

                    Insert;
                    FieldByName('COD_LOJA').AsInteger             := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,2]);
                    FieldByName('DATA_NOTA').AsDateTime           := Excel.WorkBooks[1].Sheets[1].Cells[linha,6];
                    FieldByName('NUM_NOTA').AsInteger             := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,3]);

                    if Length(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,13],2,10)) = 6 then
                      FieldByName('COD_FORNECEDOR').AsInteger     := StrToInt(Copy(Excel.WorkBooks[1].Sheets[1].Cells[linha,13],2,5))
                    else
                      FieldByName('COD_FORNECEDOR').AsInteger     := Excel.WorkBooks[1].Sheets[1].Cells[linha,13];

                    FieldByName('ESPECIE').AsString               := '01';
                    FieldByName('SERIE').AsString                 := Excel.WorkBooks[1].Sheets[1].Cells[linha,4];

                    FieldByName('TIP_MOV').AsInteger              := StrToInt(Excel.WorkBooks[1].Sheets[1].Cells[linha,20]);
                    FieldByName('COND_PAGTO').AsInteger           := 0;
                    FieldByName('BANCO').AsInteger                := 0;
                    FieldByName('VALOR_NOTA').AsFloat             := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];
                    FieldByName('VALOR_PRODUTO').AsFloat          := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];
                    FieldByName('BASE_CALCULO_ICMS').AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,55];
                    FieldByName('BASE_CALCULO_ICMS').AsFloat      := Excel.WorkBooks[1].Sheets[1].Cells[linha,55];
                    FieldByName('BASE_CALCULO_ICMS_SUB').AsFloat  := Excel.WorkBooks[1].Sheets[1].Cells[linha,72];
                    FieldByName('VALOR_ICMS').AsFloat             := Excel.WorkBooks[1].Sheets[1].Cells[linha,56];
                    FieldByName('VALOR_ICMS_SUB').AsFloat         := Excel.WorkBooks[1].Sheets[1].Cells[linha,71];
                    FieldByName('VALOR_FRETE').AsFloat            := Excel.WorkBooks[1].Sheets[1].Cells[linha,41];
                    FieldByName('VALOR_SEGURO').AsFloat           := Excel.WorkBooks[1].Sheets[1].Cells[linha,28];
                    FieldByName('OUTRAS_DESPESAS').AsFloat        := Excel.WorkBooks[1].Sheets[1].Cells[linha,33];
                    FieldByName('VALOR_IPI').AsFloat              := Excel.WorkBooks[1].Sheets[1].Cells[linha,58];
                    FieldByName('TIP_DOC').AsString               := 'NFE';
                    FieldByName('DTA_ENTRADA').AsDateTime         := Excel.WorkBooks[1].Sheets[1].Cells[linha,7];
                    FieldByName('DESCONTO').AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,39];
                    FieldByName('ID_NFE').AsString                := Excel.WorkBooks[1].Sheets[1].Cells[linha,111];

                    var_CIF_FOB := Excel.WorkBooks[1].Sheets[1].Cells[linha,44];
                   if var_CIF_FOB = 'S' then
                      FieldByName('CIF_FOB').AsString  := '0'
                   else
                     if var_CIF_FOB = 'F' then
                        FieldByName('CIF_FOB').AsString  := '1'
                     else
                       if var_CIF_FOB = 'C' then
                          FieldByName('CIF_FOB').AsString  := '2'
                       else
                         if var_CIF_FOB = '' then
                            FieldByName('CIF_FOB').AsString  := '1'
                         else
                            if ((var_CIF_FOB <> 'S') or (var_CIF_FOB <> 'F') or (var_CIF_FOB <> 'C')) then
                              FieldByName('CIF_FOB').AsString  := '5';

                    FieldByName('ZERAR_BASE_SPED').AsString       := 'N';

                    FieldByName('USU_ENTRADA').AsString           := 'IMPORTACAO'; // Nome do Usuario
                    FieldByName('CONFERENCIA').AsString           := 'N';
                    FieldByName('CFOP').AsString                  := '2.102';

                    FieldByName('VALOR_PIS').AsFloat              := Excel.WorkBooks[1].Sheets[1].Cells[linha,128];
                    FieldByName('VALOR_COFINS').AsFloat           := Excel.WorkBooks[1].Sheets[1].Cells[linha,132];
                    FieldByName('BASE_PIS').AsFloat               := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];
                    FieldByName('BASE_COFINS').AsFloat            := Excel.WorkBooks[1].Sheets[1].Cells[linha,47];

                    Post;

                    Data_Modulo.Db.ApplyUpdates([Data_Modulo.compra]);
                    Data_Modulo.Tr.CommitRetaining;
                 end;

                  {Pssa mensagem ser� passada para a nossa procedure }
         {   except
              on E: Exception do
               begin
                  raise Exception.Create('Erro encontrado ao Grava Nota. Erro: ' + #10#13 + E.Message);
                  Excel.Application.quit;
               end;
            end;
           end;
         Inc(LInha);
        coluna:=2;
        fim_linha := Excel.WorkBooks[1].Sheets[1].Cells[linha,1];
      end; // Fim While Linha

      Data_Modulo.Db.ApplyUpdates([Data_Modulo.compra]);
      Data_Modulo.Tr.CommitRetaining;
      ShowMessage('Importa��o de Notas Fiscais De Compra Realizada com sucesso!');

    Excel.Application.quit;   }
end;

end.
