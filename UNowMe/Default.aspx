<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNowMe._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function setText(val, e) {
            document.getElementById(e).value = val;
        }

        function insertText(val, e) {
            document.getElementById(e).value += val;
        }

        var nav = null;

        function requestPosition() {
            if (nav == null) {
                nav = window.navigator;
            }
            if (nav != null) {
                var geoloc = nav.geolocation;
                if (geoloc != null) {
                    geoloc.getCurrentPosition(successCallback);
                }
                else {
                    alert("geolocation not supported");
                }
            }
            else {
                alert("Navigator not found");
            }
        }



        function successCallback(position) {
            setText(position.coords.latitude, "latitude");
            setText(position.coords.longitude, "longitude");
        }



</script>

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
    <div>
        <label for="latitude">Latitude: </label><input id="latitude" /> <br />
        <label for="longitude">Longitude: </label><input id="longitude" /> <br />
        <input type="button" onclick="requestPosition()" value="Get Latitude and Longitude"  /> 
    </div>

</asp:Content>

    

