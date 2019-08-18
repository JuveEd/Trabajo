<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AgregarP.aspx.cs" Inherits="Trabajo.AgregarP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 
        <div class="container ">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    Producto agregado:
                    <br />
                    <asp:Image ID="imgPreview" Width="300px" ImageUrl="https://baseljs.github.io/dist/img/bootstrap.fw.png" runat="server"/>
                    <br />
                    
                    Archivo:
                    <asp:FileUpload ID="fuploadimagen" accept=".jpg" runat="server"  CssClass="form-control"/>
                    <br />
                    <br />
                    Titulo:
                    <asp:TextBox ID="txttitulo" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    Precio:
                    <asp:TextBox ID="txtprecio"  runat="server" CssClass="form-control"></asp:TextBox>
                    Detalles:
                    <asp:TextBox ID="txtdescripcion" runat="server" Height="106px" TextMode="MultiLine" Width="655px" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnSubir" runat="server" Text="Agregar Producto"  CssClass="btn btn-outline-success" OnClick="btnSubir_Click"/>
                    <br />
                </div>
            </div>
        
        </div>

    


    
    
</asp:Content>
