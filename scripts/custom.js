////koden utan random
// (function($){
// var apikey = '58a17dd754dd0186732642b9';
// $.ajax({
// async: true,
// url: 'https://mosa-0271.restdb.io/rest/contact',
// crossDomain: true,
// dataType: 'json',
// method: "GET",
// headers: {
// 'x-apikey': apikey,
// 'content-type': 'application/json'
// }
// })
// .done(successFunction)
// .fail(failFunction)
// function successFunction(data) {
//  console.log(data);
//      var item = [];
// $(data).each(function(){
// item.push('<ul id="' + 'listUL' + '">' +'<li id="' + 'listLI' + '">' + 
// getImage(this.picture)+
//  '</br>' +this.Name + '</br>'+
//  this.Description + '</li>' +'</ul>');});
// item.push("</div>");
// $("#name").html(item.join(''))
//   }
// function failFunction(request, textStatus, errorThrown) {
// console.log('not work..');
// }
// })(jQuery);
// //.........................
// function getImage(imgid)
// {
//   return "<img src='https://mosa-0271.restdb.io/media/" + imgid + "?key=22631469345172666884' />";
// }
//koden med random

(function ($) {
  var apikey = '58a17dd754dd0186732642b9';
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
      return "<img src='https://mosa-0271.restdb.io/media/" + imgid + "?key=22631469345172666884' />";
    }

    $(data).each(function () {
      console.log(this._id);
      item.push('<ul id="' + 'listUL' + '">' + '<li id="' + 'listLI' + '">' +
        getImage(this.picture) +
        '</br>' + this.Name + '</br>' +
        this.Description + '<button class="delbutton" contactid="' + this._id + '" id="' + 'delPic' + '">x</button>' + '</li>' + '</ul>');
    });
    item.push("</div>");
    item.reverse();
    items_random_order = shuffle(item);
    $("#name").html(items_random_order.join(''));

    deleting();
  }
  function failFunction(request, textStatus, errorThrown) {
    console.log('not work..');
  }


})(jQuery);

 function deleting() {
  
    $("button.delbutton").click(function () {
      console.log("clicked");
      var apikey = '58a17dd754dd0186732642b9';

      /*
        namedata = $("#addcontact-name").val();
        descdata = $("#addcontact-desc").val();
        */
      var userid = $(this).attr("contactid");
      console.log(userid);
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": "https://mosa-0271.restdb.io/rest/contact/" + userid,
        "method": "DELETE",
        "headers": {
          "content-type": "application/json",
          "x-apikey": apikey
        }
      }
      $.ajax(settings).done(function (response) {
        console.log(response);
      });
      $.ajax(settings).fail(function (response) {
        console.log(response);
      });
    });
  }