<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNowMe._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var map;
        var markers = [];

        function initialize() {
            var mapOptions = {
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.TERRAIN
            };
            map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

            // This event listener will call addMarker() when the map is clicked.
            google.maps.event.addListener(map, 'click', function (event) {
                addMarker(event.latLng);
                document.getElementById("<%= longitude.ClientID %>").value = event.latLng.lat();
                document.getElementById("<%= latitude.ClientID %>").value = event.latLng.lng();
            });

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var pos = new google.maps.LatLng(position.coords.latitude,
                                                     position.coords.longitude);

                    var infowindow = new google.maps.InfoWindow({
                        map: map,
                        position: pos,
                        content: 'Vous etes ici.'
                    });

                    map.setCenter(pos);
                }, function () {
                    handleNoGeolocation(true);
                });
            } else {
                // Browser doesn't support Geolocation
                handleNoGeolocation(false);
            }
        }

        function handleNoGeolocation(errorFlag) {
            if (errorFlag) {
                var content = 'Error: The Geolocation service failed.';
            } else {
                var content = 'Error: Your browser doesn\'t support geolocation.';
            }

            var options = {
                map: map,
                position: new google.maps.LatLng(60, 105),
                content: content
            };

            var infowindow = new google.maps.InfoWindow(options);
            map.setCenter(options.position);
        }

        // Add a marker to the map and push to the array.
        function addMarker(location) {
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
            markers.push(marker);
        }

        // Sets the map on all markers in the array.
        function setAllMap(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers() {
            setAllMap(null);
        }

        // Shows any markers currently in the array.
        function showMarkers() {
            setAllMap(map);
        }

        // Deletes all markers in the array by removing references to them.
        function deleteMarkers() {
            clearMarkers();
            markers = [];
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <div id="panel">
        <input onclick="clearMarkers();" type=button value="Hide Markers">
        <input onclick="showMarkers();" type=button value="Show All Markers">
        <input onclick="deleteMarkers();" type=button value="Delete Markers">
    </div>
    
    <div id="map-canvas"></div>
    <div id="formFromPoint">
        <asp:Label runat="server" ID="DescriptionLabel" />
        <asp:TextBox runat="server" ID="DescriptionText" />
    </div>
    <asp:HiddenField runat="server" ID="longitude" />
    <asp:HiddenField runat="server" ID="latitude" />
</asp:Content>




