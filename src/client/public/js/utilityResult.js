// search_result function which is called in userDetails.html
var search_result = function() {
  // Declare variables
  var agent_name, source, destination, startdate, enddate ;
  //get value from id of input
  agent_name = document.getElementById("agent_name").value;
  source = document.getElementById("source").value;
  destination = document.getElementById("destination").value;
  startdate = document.getElementById("startdate").value;
  enddate = document.getElementById("enddate").value;
  // display content for search result
  document.getElementById("v1").innerHTML = "Agent Name is : ";
  document.getElementById("s1").innerHTML = agent_name;
  document.getElementById("v2").innerHTML = "From : ";
  document.getElementById("s2").innerHTML = source;
  document.getElementById("v3").innerHTML = "To : ";
  document.getElementById("s3").innerHTML = destination;
  document.getElementById("v4").innerHTML = "Start Date : ";
  document.getElementById("s4").innerHTML = startdate;
  document.getElementById("v5").innerHTML = "End Date : ";
  document.getElementById("s5").innerHTML = enddate;
// pass the value in query
    $.post('/napi/admin/result',{'origin':source,'destination':destination,'agent_name':agent_name,'startdate':startdate,'enddate':enddate},function(data){
      var trHTML = '';
      $.each(data, function (i, item) {
        trHTML += '<tr><td class="mypopupOpen">' + item.USERNAME + '</td><td>' + item.ORIGIN + '</td><td>' + item.DESTINATION
        trHTML +=  '</td><td>' + item.date.split("T")[0] + '</td><td>' + item.time + '</td></tr>';
      });
      //$('#agentsInfo tbody').prepend(trHTML);
      $('#agentsInfo tbody').empty().append(trHTML);
      });
     }
