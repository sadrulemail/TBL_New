<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleMap.aspx.cs" Inherits="GoogleMap"
    EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Google Maps - Trust Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
            width: 100%;
        }
        #dvMap
        {
            background-color: #fff;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            overflow: auto;
        }
        .info-title
        {
            font-weight: bold;
            font-size: 130%;
            color: Green;
            text-shadow: 1px 1px 1px rgba(179, 202, 124, 0.5);
        }
        .info-window
        {
            line-height:1.35;
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
    var markers = [
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>{"title":'<%# Eval("Name") %>',"lat":'<%# Eval("Latitude") %>',"lng":'<%# Eval("Longitude") %>',"description":'<div class="info-window"><div class="info-title"><%# Eval("Name").ToString().Replace("\n"," ") %></div><div><%# (Eval("Details")).ToString().Replace("\n","<br />") %></div></div>',"img":'<%# Eval("Image") %>'}</ItemTemplate>
    <SeparatorTemplate>,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 18,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                icon: markers[0].img
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title,
                    icon: data.img
                });
                (function (marker, data) {                    
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);         
                    });                                         
                })(marker, data);  
                if(i===0){
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);        
                }                         
            }
        }
    </script>
</head>
<body>
<form id="form1" runat="server">
    <div id="dvMap">
    </div>
</form>
</body>
</html>
