<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Trabajo.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
            <div class="container">
            <!-- Producto  -->
            <h2 class="h1-responsive font-weight-bold text-center my-5"><%# DataBinder.Eval(Container.DataItem,"titulo") %></h2>
              
            <p class="lead grey-text text-center w-responsive mx-auto mb-5"><%# DataBinder.Eval(Container.DataItem,"detalles") %></p>

            <div class="text-center">
                <img class="img-fluid" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagen")) %>" alt="Responsive image" > 
            </div>
            
           </div>
            <!-- ./Producto -->
        </ItemTemplate>


    </asp:Repeater>

</asp:Content>
