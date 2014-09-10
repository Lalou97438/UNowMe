<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNowMe._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #mapsFrame {
            width: 100%;
            height: 400px;
            padding: 40px;
        }
    </style>
    <iframe id="mapsFrame" src="maps.html"></iframe>
    <asp:HiddenField runat="server" ID="Longitude"/>
    <asp:HiddenField runat="server" ID="Latitude" />
</asp:Content>




