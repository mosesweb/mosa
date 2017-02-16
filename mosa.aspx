<%@ Page Language="C#" masterpagefile="~masterurl/custom.master" title="Untitled 1" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content id="Content2" runat="Server" contentplaceholderid="PlaceHolderAdditionalPageHead"></asp:Content>

<asp:Content id="Content1" runat="Server" contentplaceholderid="PlaceHolderMain">
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <style>
  .card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 20%;
    border-radius: 5px;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img.contactImg{
    border-radius: 5px 5px 0 0;
    width:100%;
    max-height:200px;
    min-height: 200px;
  
}

.container {
    padding: 2px 16px;
}
#listUL{
list-style-type: none;
 margin: 20px;
}
#delPic{

 border-radius: 0px 5px 0px 0px;
 opacity: 0.7;
}
   </style>
   
   <div id='name'></div>
<script type="text/javascript">
// (function ($) {
//     var apikey = '********************';
//     $.ajax({
//     async: true,
//     url: 'https://mosa-0271.restdb.io/rest/contact',
//     crossDomain: true,
//     dataType: 'json',
//     method: "GET",
//     headers: {
//       'x-apikey': apikey,
//       'content-type': 'application/json'
//              }
//          })

//     .done(successFunction)
//     .fail(failFunction)

//   function successFunction(data) {
//         var item = [];
//        // Randomize the array
//         function shuffle(array) {
//         var currentIndex = array.length, temporaryValue, randomIndex;
//         // While there remain elements to shuffle...
//         while (0 !== currentIndex) {
//         // Pick a remaining element...
//         randomIndex = Math.floor(Math.random() * currentIndex);
//         currentIndex -= 1;
//         // And swap it with the current element.
//         temporaryValue = array[currentIndex];
//         array[currentIndex] = array[randomIndex];
//         array[randomIndex] = temporaryValue;
//                                    }
//       return array;
//                                  }
//     function getImage(imgid) {
//       return "<img src='https://mosa-0271.restdb.io/media/" + imgid + "?key=22631469345172666884' />";
//                              }

//      $(data).each(function(){
//         console.log(this._id);
//         item.push('<ul class="' + 'card c4 col-lg-4' + '"  id="' + 'listUL' + '">' +'<li id="' + 'listLI' + '">' + 
//         getImage(this.picture)+
//         '</br>'+'<h4>' +this.Name +'</h4>'+ '</br>'+
//         '<p>'+this.Description +'</p>' +'<button class="delbutton" contactid="' + this._id + '" id="' + 'delPic' + '">x</button>' + '</li>' + '</ul>');
//                           });
//         item.push("</div>");
//         item.reverse();
//         items_random_order = shuffle(item);
//         $("#name").html(items_random_order.join(''));
//         deleting();
//       }
//  function failFunction(request, textStatus, errorThrown) {
//  console.log('not work..');
//   }})(jQuery);

//  function deleting() {
//     $("button.delbutton").click(function () {
//         var divbox = $(this).closest("#listUL").fadeOut();
//         var apikey = '****************';
//         var userid = $(this).attr("contactid");
//         var settings = {
//         "async": true,
//         "crossDomain": true,
//         "url": "https://mosa-0271.restdb.io/rest/contact/" + userid,
//         "method": "DELETE",
//         "headers": {
//         "content-type": "application/json",
//         "x-apikey": apikey
//         }
//       }
//       $.ajax(settings); 
//     });
//   }
(function ($) {
  var apikey = '';
  $.ajax({
    async: true,
    url: 'https://mosa-0271.restdb.io/rest/contact',
    crossDomain: true,
    dataType: 'json',
    method: "GET",
    headers: {
      'x-apikey': apikey,
      'content-type': 'application/json'
    }
  })
 
    .done(successFunction)
    .fail(failFunction)
  function successFunction(data) {
    console.log(data);
    var item = [];
 // Randomize the array
function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;
 // While there remain elements to shuffle...
  while (0 !== currentIndex) {
  // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;
 // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }
  return array;
}
    function getImage(imgid) {
      return "<img class='contactImg' src='https://mosa-0271.restdb.io/media/" + imgid + "?key=22631469345172666884' />";
    }
 
   $(data).each(function(){
item.push('<ul class="' + 'card c4 col-lg-4' + '"  id="' + 'listUL' + '">' +'<li id="' + 'listLI' + '">' + 
getImage(this.picture)+
 '</br>'+'<h4>' +this.Name +'</h4>'+ '</br>'+
 '<p>'+this.Description +'</p>' + '</li>' +'</ul>');});
item.push("</div>");
    item.reverse();
    items_random_order = shuffle(item);
    $("#name").html(items_random_order.join(''))
  }
  function failFunction(request, textStatus, errorThrown) {
    console.log('not work..');
  }
})(jQuery);
</script>
</asp:Content>


