<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="VerProductos.aspx.cs" Inherits="Trabajo.VerProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
    <h1 class="text-center">Catalogo con Bootstrap </h1>
                <hr>
        
                <div class="row">
                    
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                               <!-- Producto  -->
                    <div class="col-md-4 product-grid">
                               
                                                    
                         <div class="imagen">
                            <img class="img-responsive w-100" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagen")) %>">
                             
                             <h5 class="text-center"> <%# DataBinder.Eval(Container.DataItem,"titulo") %></h5>
                             <h5 class="text-center"> <%# DataBinder.Eval(Container.DataItem,"precio") %></h5>
                             
                             <a href="Detalles.aspx" target="_blank" class="btn buy">Ver Detalles</a>
                            
                         </div>
                        
                    </div>
                    <!-- ./Producto -->
                        </ItemTemplate>
                     

                    </asp:Repeater>
                  </div>
        
            </div>
            


</asp:Content>
