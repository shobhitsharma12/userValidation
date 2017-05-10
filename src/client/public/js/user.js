export function fetchUser(username) {
	var username = "i.ravipanwar@gmail.com";
	fetch('/napi/userInfo/'+username).then(function(response) {
		// Convert to JSON
	return response.json();
	  //console.log(response.json());
	})
}

//when user.html page load this page call automativally
// $(document).ready(function(){
//   var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
//   var monthDict = {January:1, February:2, March:3, April:4, May:5, June:6, July:7,August:8,September:9,October:10,November:11,December:12};
//   var username = window.location.href.split("/").splice(-1,1);
//   $.post('/napi/userInfo',{'username':username},function(data){
//     var agentName = "Agent Name: " + data[0].fname + data[0].lname
//     var tierName = "Tier Name: " + data[0].name
//     $("#agentName").html(agentName);
//     $("#tierName").html(tierName);
//   })
//
// $.get('/napi/agentSales/'+username,function(data){
//     var trHTML = '';
//     $.each(data, function (i, item) {
//       trHTML += '<tr><td class="mypopupOpen"><a>'+monthNames[item.m-1]+'</a></td><td>' + item.y + '</td><td>' + item.countt + '</td><td>' + item.countt
//       trHTML += '</td><td>' + item.total + '</td><td>' + item.commi
//       trHTML +=  '</td><td>' + "AI" + '</td><td></td></tr>';
//       });
//      $('#userSalesInfo tbody').append(trHTML);
//     })
//
// // to populate popup
// $(document).on("click",".mypopupOpen", function (event) {
//     var month = monthDict[$(this).text()];
//     $.post('/napi/userPnr',{'username':username,'month':month},function(data){
//       var trHTML = '';
//       $.each(data, function (i, item) {
//         trHTML += '<tr><td class="mypopupOpen2"><a bookingid="'+item.id+'">' + item.id + '</a></td><td>'+item.pnr_creation_time+'</td><td>'+item.origin+"-"+item.destination
//         trHTML +=  '</td><td>' + item.total_fare + '</td><td>'+item.commi_amt
//         trHTML +=  '</td></tr>';
//       });
//       $('#pnrInfo tbody').empty().append(trHTML);
//       $('#mypopup').css('left',event.pageX);      // <<< use pageX and pageY
//       $('#mypopup').css('top',event.pageY+18);
//       $('#mypopup').css('display','inline');
//       $("#mypopup").css("position", "absolute");
//       $('#mypopup').show();
//       var elmnt = document.getElementById("mypopuphide").scrollIntoView();
//     })
//   });
//   $(document).on("click","#mypopuphide", function (event) {
//     $('#mypopup').hide();
//     $('#mypopup2').hide();
//   });
//
// $(document).on("click",".mypopupOpen2", function (event) {
//     var bookingid = $(this).find('a').attr("bookingid"); // bookingid
//     $.post('/napi/userfullPnr',{'bookingid':bookingid},function(data){
//       var trHTML = '';
//       $.each(data, function (i, item) {
//         trHTML += '<tr><td>Creation Time</td><td>'+item.pnr_creation_time+'</td></tr><tr><td>Booking ID</td><td>' + item.id + '</td></tr><tr><td>GDS</td><td>' + item.pnr_owner_pri
//         trHTML +=  '</td></tr><tr><td>Carrier</td><td>' + item.pnr_owner_pri + '</td></tr><tr><td>Trip Type</td><td>'+"tripType"+'</td></tr><tr><td>City Pair</td><td>'+item.origin+"-"+item.destination
//         trHTML +=  '</td></tr><tr><td>Client Location</td><td>' + "CL" + '</td></tr><tr><td>Base Fare</td><td>'+"BF"+'</td></tr><tr><td>Taxes</td><td>'+"TAXES"
//         trHTML +=  '</td></tr><tr><td>Total Fare</td><td>' + item.total_fare + '</td></tr><tr><td>Commission</td><td>'+item.commi_amt
//         trHTML +=  '</td></tr><tr><td>Additional Incentive</td><td>' + "AI" + '</td></tr><tr><td>Total Earned</td><td>'+ "TE" +'</td></tr>';
//       });
//       $('#pnrInfo1 tbody').empty().append(trHTML);
//       $('#mypopup2').css('left',event.pageX);      // <<< use pageX and pageY
//       $('#mypopup2').css('top',event.pageY+18);
//       $('#mypopup2').css('display','inline');
//       $("#mypopup2").css("position", "absolute");
//       $('#mypopup2').show();
//       var elmnt = document.getElementById("mypopuphide2").scrollIntoView();
//     })
//   });
//     $(document).on("click","#mypopuphide2", function (event) {
//     $('#mypopup2').hide();
//     });
// });
