// adminFilter function which is called in admin.html
var adminFilter = function() {
  // Declare variables
  var input, filter, table, trs, tds, i;
  input = document.getElementById("myInput");
  filter = input.value.toLowerCase();
  var resFilter = {};
  filter.split('|').forEach(function(x){
      var arr = x.split('=');
      arr[1] && (resFilter[arr[0]] = arr[1]);
  });
  table = document.getElementById("agentsInfo");
  trs = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 1; i < trs.length; i++) {
    tds = trs[i].getElementsByTagName("td")
    if (
      (("username" in resFilter) && ($(tds[0]).text().toLowerCase().search(resFilter["username"]) == -1))
      ||(("firstname" in resFilter) && ($(tds[1]).text().toLowerCase().search(resFilter["firstname"]) == -1))
      ||(("address" in resFilter) && ($(tds[2]).text().toLowerCase().search(resFilter["address"]) == -1))
      ||(("tier" in resFilter) && ($(tds[3]).text().toLowerCase().search(resFilter["tier"]) == -1))
      ||(("salecount_lte" in resFilter) && (parseInt(resFilter["salecount_lte"]) < parseInt($(tds[4]).text()) ))
      ||(("salecount_gte" in resFilter) && (parseInt(resFilter["salecount_gte"]) > parseInt($(tds[4]).text()) )) ) {
      trs[i].style.display = "none";
    }
    else {
      trs[i].style.display = "";
    }
  }
}
// userFilter function which is called in user.html
var userFilter = function() {
  // Declare variables
  var input, filter, table, trs, tds, i;
  input = document.getElementById("myInput");
  filter = input.value.toLowerCase();
  var resFilter = {};
  filter.split('|').forEach(function(x){
      var arr = x.split('=');
      arr[1] && (resFilter[arr[0]] = arr[1]);
  });
  table = document.getElementById("userSalesInfo");
  trs = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 1; i < trs.length; i++) {
    tds = trs[i].getElementsByTagName("td")
    if (
      (("month_lte" in resFilter) && (parseInt(resFilter["month_lte"]) < parseInt($(tds[0]).text()) ))
      ||(("month_gte" in resFilter) && (parseInt(resFilter["month_gte"]) > parseInt($(tds[0]).text()) ))
      ||(("ca_lte" in resFilter) && (parseInt(resFilter["ca_lte"]) < parseInt($(tds[1]).text()) ))
      ||(("ca_gte" in resFilter) && (parseInt(resFilter["ca_gte"]) > parseInt($(tds[1]).text()) ))
      ||(("tf_lte" in resFilter) && (parseInt(resFilter["tf_lte"]) < parseInt($(tds[2]).text()) ))
      ||(("tf_gte" in resFilter) && (parseInt(resFilter["tf_gte"]) > parseInt($(tds[2]).text()) ))
      ||(("count_lte" in resFilter) && (parseInt(resFilter["count_lte"]) < parseInt($(tds[3]).text()) ))
      ||(("count_gte" in resFilter) && (parseInt(resFilter["count_gte"]) > parseInt($(tds[3]).text()) )) ) {
      trs[i].style.display = "none";
    }
    else {
      trs[i].style.display = "";
    }
  }
}

// adminFilter function1 which is called in admin.html
var adminFilter1 = function(filter1) {
  // Declare variables
  var filter, table, trs, tds, i;
  filter1 = document.getElementById("myInput1").value.toLowerCase();
  filter2 = document.getElementById("myInput2").value.toLowerCase();
  filter3 = document.getElementById("myInput3").value.toLowerCase();
  filter4 = document.getElementById("myInput4").value.toLowerCase();
  filter5 = document.getElementById("myInput5").value.toLowerCase();
  filter6 = document.getElementById("myInput6").value.toLowerCase();
  var resFilter1 = {},resFilter2 = {},resFilter3 = {},resFilter4 = {},resFilter5 = {},resFilter6 = {};
  resFilter1["username"]=filter1;
  resFilter2["firstname"]=filter2;
  resFilter3["address"]=filter3;
  resFilter4["tier"]=filter4;
  resFilter5["salecount_lte"]=filter5;
  resFilter6["salecount_gte"]=filter6;
  table = document.getElementById("agentsInfo");
  trs = table.getElementsByTagName("tr");
  // Loop through all table rows, and hide those who don't match the search query
  for (i = 1; i < trs.length; i++) {
    tds = trs[i].getElementsByTagName("td")
    if ((("username" in resFilter1) && ($(tds[0]).text().toLowerCase().search(resFilter1["username"]) == -1))
      ||(("firstname" in resFilter2) && ($(tds[1]).text().toLowerCase().search(resFilter2["firstname"]) == -1)) ||(("address" in resFilter3) && ($(tds[2]).text().toLowerCase().search(resFilter3["address"]) == -1))
      ||(("tier" in resFilter4) && ($(tds[3]).text().toLowerCase().search(resFilter4["tier"]) == -1))
      ||(("salecount_lte" in resFilter5) && (parseInt(resFilter5["salecount_lte"]) < parseInt($(tds[4]).text()) ))
      ||(("salecount_gte" in resFilter6) && (parseInt(resFilter6["salecount_gte"]) > parseInt($(tds[4]).text()) )) ) {
      trs[i].style.display = "none";
    }
    else {
      trs[i].style.display = "";
    }
  }
}
