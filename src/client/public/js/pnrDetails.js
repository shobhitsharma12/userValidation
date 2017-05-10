// to populate popup
$(document).on("click",".mypopupOpen", function (event) {
    var month = monthDict[$(this).text()];
    $.post('/napi/userPnr',{'username':username,'month':month},function(data){
      var trHTML = '';
      $.each(data, function (i, item) {
        trHTML += '<tr><td class="mypopupOpen2"><a bookingid="'+item.id+'">' + item.id + '</a></td><td>'+item.pnr_creation_time+'</td><td>'+item.origin+"-"+item.destination
        trHTML +=  '</td><td>' + item.total_fare + '</td><td>'+item.commi_amt
        trHTML +=  '</td></tr>';
      });
      $('#pnrInfo tbody').empty().append(trHTML);
      $('#mypopup').css('left',event.pageX);      // <<< use pageX and pageY
      $('#mypopup').css('top',event.pageY+18);
      $('#mypopup').css('display','inline');
      $("#mypopup").css("position", "absolute");
      $('#mypopup').show();
      var elmnt = document.getElementById("mypopuphide").scrollIntoView();
    })
  });
  $(document).on("click","#mypopuphide", function (event) {
    $('#mypopup').hide();
    $('#mypopup2').hide();
  });
