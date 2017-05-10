//when admin.html page load this page call automativally
$(document).ready(function(){
  var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
  var selecteddate = document.getElementById("selecteddate").value;//get value from id of input
  var now = new Date();
  var day = ("0" + now.getDate()).slice(-2);
  var month = ("0" + (now.getMonth() + 1)).slice(-2);
  var selecteddate = now.getFullYear() + "-" + (month) + "-" + (day);
    document.getElementById("selecteddate").value=selecteddate;
          $.post('/napi/admin/dayreport',{'selecteddate':selecteddate},function(data){
            var trHTML = '';
            $.each(data, function (i, item) {
              trHTML += '<tr><td class="mypopupOpen"><a username="'+item.username+'" month="'+item.month+'">' + item.username + '</a></td><td>' + item.fname + '</td><td>' + item.address
              trHTML +=  '</td><td>' + item.name + '</td><td>' + item['count(p.origin)'] + '</td></tr>';
            });
            $('#agentsInfo tbody').empty().append(trHTML);
          })
// this function show current day sales report
 $(document).on("click","#value1212", function () {
    $('#selecteddate').show();
    $('#value1212').addClass('active');
    $('#value2121').removeClass('active');
    $('#mypopup').hide();
    $('#mypopup1').hide();
    $('#mypopup2').hide();
    $('#message').show();
    $('#goes').show();
    $('#valuereset').show();
    var selecteddate = document.getElementById("selecteddate").value;//get value from id of input
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    selecteddate = today;
    document.getElementById("selecteddate").value=selecteddate;
          $.post('/napi/admin/dayreport',{'selecteddate':selecteddate},function(data){
            var trHTML = '';
            $.each(data, function (i, item) {
              trHTML += '<tr><td class="mypopupOpen"><a username="'+item.username+'" month="'+item.month+'">' + item.username + '</a></td><td>' + item.fname + '</td><td>' + item.address
              trHTML +=  '</td><td>' + item.name + '</td><td>' + item['count(p.origin)'] + '</td></tr>';
            });

          $('#agentsInfo tbody').empty().append(trHTML);
        })
      })

// this function show current day sales report
 $(document).on("click","#valuereset", function () {
    $('#selecteddate').show();
    $('#value1212').addClass('active');
    $('#value2121').removeClass('active');
    $('#mypopup').hide();
    $('#mypopup1').hide();
    $('#mypopup2').hide();
    $('#message').show();
    $('#goes').show();
    $('#valuereset').show();
    var selecteddate = document.getElementById("selecteddate").value;//get value from id of input
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear() + "-" + (month) + "-" + (day);
      selecteddate = today;
      document.getElementById("selecteddate").value=selecteddate;
            $.post('/napi/admin/dayreport',{'selecteddate':selecteddate},function(data){
              var trHTML = '';
              $.each(data, function (i, item) {
                trHTML += '<tr><td class="mypopupOpen"><a username="'+item.username+'" month="'+item.month+'">' + item.username + '</a></td><td>' + item.fname + '</td><td>' + item.address
                trHTML +=  '</td><td>' + item.name + '</td><td>' + item['count(p.origin)'] + '</td></tr>';
              });
              $('#agentsInfo tbody').empty().append(trHTML);
            })
          })

// this function show current day sales report
 $(document).on("click","#goes", function () {
    $('#selecteddate').show();
    $('#value1212').addClass('active');
    $('#value2121').removeClass('active');
    $('#mypopup').hide();
    $('#mypopup1').hide();
    $('#mypopup2').hide();
    $('#message').show();
    $('#goes').show();
    $('#valuereset').show();
    var selecteddate = document.getElementById("selecteddate").value;//get value from id of input
    if(selecteddate==''){
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear() + "-" + (month) + "-" + (day);
      selecteddate = today;
      document.getElementById("selecteddate").value=selecteddate;
    }
    else {
        selecteddate = document.getElementById("selecteddate").value;
    }
            $.post('/napi/admin/dayreport',{'selecteddate':selecteddate},function(data){
              var trHTML = '';
              $.each(data, function (i, item) {
                trHTML += '<tr><td class="mypopupOpen"><a username="'+item.username+'" month="'+item.month+'">' + item.username + '</a></td><td>' + item.fname + '</td><td>' + item.address
                trHTML +=  '</td><td>' + item.name + '</td><td>' + item['count(p.origin)'] + '</td></tr>';
              });
              if(trHTML == ''){
                $('#message').show();
              }
              else {
                $('#message').hide();
              }
              $('#agentsInfo tbody').empty().append(trHTML);
            })
          })

//this fuction all day sales report
 $(document).on("click","#value2121", function () {
    $('#selecteddate').hide();
    $('#value2121').addClass('active');
    $('#value1212').removeClass('active');
    $('#mypopup').hide();
    $('#mypopup1').hide();
    $('#mypopup2').hide();
    $('#message').hide();
    $('#goes').hide();
    $('#valuereset').hide();
    $.get('/napi/admin/user',function(data){
      var trHTML = '';
      $.each(data, function (i, item) {
        trHTML += '<tr><td class="mypopupOpen"><a username="'+item.username+'">' + item.username + '</a></td><td>' + item.fname + '</td><td>' + item.address
        trHTML +=  '</td><td>' + item.name + '</td><td>' + item['count(p.origin)'] + '</td></tr>';
      });
      $('#agentsInfo tbody').empty().append(trHTML);
    })
  })

// to popup show booking details by month and year wise
 $(document).on("click",".mypopupOpen", function (event) {
    $('#mypopup1').hide();
    $('#mypopup2').hide();
    var popupUsername = $(this).find('a').attr("username"); // username
    $.get('/napi/agentSales/'+popupUsername,function(data){
      var trHTML = '';
      $.each(data, function (i, item) {
        //table of popup
        trHTML += '<tr><td class="mypopupOpen1"><a month="'+item.m+'" username="'+popupUsername+'">'+monthNames[item.m-1]+'</a></td><td>' + item.y + '</td><td>' + item.countt + '</td><td>' + item.countt
        trHTML += '</td><td>' + item.total + '</td><td>' + item.commi
        trHTML +=  '</td><td>' + "AI" + '</td><td></td></tr>';
      });
      $('#salesInfo tbody').empty().append(trHTML);
      $('#mypopup').css('left',event.pageX);      // < use pageX and pageY
      $('#mypopup').css('top',event.pageY+18);
      $('#mypopup').css('display','inline');      //display data inline
      $("#mypopup").css("position", "absolute");
      $('#mypopup').show();
      var elmnt = document.getElementById("mypopuphide").scrollIntoView();
    })
  });
// close all open popup
    $(document).on("click","#mypopuphide", function (event) {
      $('#mypopup').hide();
      $('#mypopup1').hide();
      $('#mypopup2').hide();
    });

// to populate popup for details of total ticket booking
  $(document).on("click",".mypopupOpen1", function (event) {
    var month = $(this).find('a').attr("month"); // username
    var username = $(this).find('a').attr("username"); // username
      $.post('/napi/userPnr',{'username':username,'month':month},function(data){
      var trHTML = '';
      $.each(data, function (i, item) {
        trHTML += '<tr><td class="mypopupOpen2"><a bookingid="'+item.id+'">' + item.id + '</a></td><td>'+item.pnr_creation_time+'</td><td>'+item.origin+"-"+item.destination
        trHTML +=  '</td><td>' + item.total_fare + '</td><td>'+item.commi_amt
        trHTML +=  '</td></tr>';
      });
      $('#pnrInfo tbody').empty().append(trHTML);
      $('#mypopup1').css('left',event.pageX);      // <<< use pageX and pageY
      $('#mypopup1').css('top',event.pageY+18);
      $('#mypopup1').css('display','inline');
      $("#mypopup1").css("position", "absolute");
      $('#mypopup1').show();
      var elmnt = document.getElementById("mypopuphide1").scrollIntoView();
    })
  });
//close 2 popup
    $(document).on("click","#mypopuphide1", function (event) {
      $('#mypopup1').hide();
      $('#mypopup2').hide();
    });

// to populate popup for details of total ticket booking
  $(document).on("click",".mypopupOpen2", function (event) {
    var bookingid = $(this).find('a').attr("bookingid"); // bookingid
      $.post('/napi/userfullPnr',{'bookingid':bookingid},function(data){
        var trHTML = '';
        $.each(data, function (i, item) {
          trHTML += '<tr><td>Creation Time</td><td>'+item.pnr_creation_time+'</td></tr><tr><td>Booking ID</td><td>' + item.id + '</td></tr><tr><td>GDS</td><td>' + item.pnr_owner_pri
          trHTML +=  '</td></tr><tr><td>Carrier</td><td>' + item.pnr_owner_pri + '</td></tr><tr><td>Trip Type</td><td>'+"tripType"+'</td></tr><tr><td>City Pair</td><td>'+item.origin+"-"+item.destination
          trHTML +=  '</td></tr><tr><td>Client Location</td><td>' + "CL" + '</td></tr><tr><td>Base Fare</td><td>'+"BF"+'</td></tr><tr><td>Taxes</td><td>'+"TAXES"
          trHTML +=  '</td></tr><tr><td>Total Fare</td><td>' + item.total_fare + '</td></tr><tr><td>Commission</td><td>'+item.commi_amt
          trHTML +=  '</td></tr><tr><td>Additional Incentive</td><td>' + "AI" + '</td></tr><tr><td>Total Earned</td><td>'+ "TE" +'</td></tr>';
        });
        $('#pnrInfo1 tbody').empty().append(trHTML);
        $('#mypopup2').css('left',event.pageX);      // <<< use pageX and pageY
        $('#mypopup2').css('top',event.pageY+18);
        $('#mypopup2').css('display','inline');
        $("#mypopup2").css("position", "absolute");
        $('#mypopup2').show();
        var elmnt = document.getElementById("mypopuphide2").scrollIntoView();
      })
    });
    $(document).on("click","#mypopuphide2", function (event) {
          $('#mypopup2').hide();
    });
  });
