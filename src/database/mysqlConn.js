var mysql = require("mysql");
// First you need to create a connection to the db
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1111",
  database: "testvalue"
});
con.connect(function(err){
  if(err){
    console.log('Error connecting to Db',err);
    return;
  }
  console.log('Connection established');
});
var userre = function(origin,destination,agent_name,startdate,enddate){
  var query = "select p.ORIGIN, p.DESTINATION, month(p.pnr_creation_time) as month, year(p.pnr_creation_time) as year, "
  query+="date(p.pnr_creation_time) as date,time(p.pnr_creation_time) as time, a.USERNAME from PNR_DETAILS as "
  query+="p INNER JOIN USERS as a ON p.USER_PNR_DTLS_ID=a.ID "
  //console.log("My Query = " + query);
var conditionalStmt = '';
  if(origin!=""){
    conditionalStmt += conditionalStmt == ''? "ORIGIN like \""+origin+"%\"" : " AND ORIGIN like \""+origin+"%\"";
  }
  if(destination!=""){
    conditionalStmt += conditionalStmt == ''? "DESTINATION like \""+destination+"%\"" : " AND DESTINATION like \""+destination+"%\"";
  }
  if(agent_name!=""){
    conditionalStmt += conditionalStmt == ''? "a.username like \""+agent_name+"%\"" : " AND a.username like \""+agent_name+"%\"";
  }
  if(startdate!=""){
    conditionalStmt += conditionalStmt == ''? "date(pnr_creation_time)>=\""+startdate+"\"" : " AND date(pnr_creation_time)>=\""+startdate+"\"";
  }
  if(enddate!=""){
    conditionalStmt += conditionalStmt == ''? "date(pnr_creation_time)<=\""+enddate+"\"" : " AND date(pnr_creation_time)<=\""+enddate+"\"";
  }
  if(conditionalStmt==''){
    query = query + ";";
  }
  else {
    query = query + ' where ' + conditionalStmt + ";";
  }
  //console.log("Final query : "+query);
  return query;
}

module.exports.userre= userre;
var userQuery = "select u.username,up.fname,a.address,t.name,count(p.origin) from USERS as u inner join AGENCY as a on u.agency_id=a.id "
userQuery+=" inner join USERPROFILE up on u.profile_id=up.id left join AGENCYTIER as t on t.id = u.agencytierid "
userQuery+="left join PNR_DETAILS as p on u.id=p.USER_PNR_DTLS_ID group by u.username"
// (select * from pnr_details where month(p.pnr_creation_time)=MONTH(CURDATE()) )
var userdayQuery = function(datevarible){
    //console.log(datevarible);
  var query = "select u.username,up.fname,a.address,t.name,count(p.origin) as value from USERS as u inner join AGENCY as a on u.agency_id=a.id "
  query+=" inner join USERPROFILE up on u.profile_id=up.id left join AGENCYTIER as t on t.id = u.agencytierid "
  query+="left join PNR_DETAILS as p on u.id=p.USER_PNR_DTLS_ID where date(p.pnr_creation_time) like \"%"+datevarible+"\" group by u.username"
  return query;
}
module.exports.userdayQuery = userdayQuery;

var agentSalesQuery = function(username){
  var query = "select month(p.pnr_creation_time) as m, year(p.pnr_creation_time) as y, sum(p.commi_amt) as commi,sum(p.total_fare) as total,count(p.origin) as countt"
  query += " from USERS as u inner join PNR_DETAILS as p on u.id=p.USER_PNR_DTLS_ID where u.username= \""+username+"\" group by m,y order by y DESC,m DESC limit 6"
  return query;
}

var agentCheck = function(emailID,password){
  var query = "select * from agent where EmailID=\""+emailID+"\" and password=\""+password+"\""
  console.log(query);
  return query;
}
module.exports.agentCheck = agentCheck;

var adminCheck = function(adminID,passwordAdmin){
  var query = "select * from admin where adminID=\""+adminID+"\" and password=\""+passwordAdmin+"\""
  console.log(query);
  return query;
}
module.exports.adminCheck = adminCheck;

var agentlist = "select * from agent"
module.exports.agentlist = agentlist;

var addAgent = function(fname,lname,email,role,tier,password){
  var query = "INSERT INTO agent (FirstName, LastName, EmailId, Role, Tier, Activness, password) VALUES (\""+fname+"\", \""+lname+"\", \""+email+"\", \""+role+"\", \""+tier+"\", 'Active', \""+password+"\")"
  console.log(query);
  return query;
}
module.exports.addAgent = addAgent;

var editAgent = function(agentID){
  var query = "select * from agent where ID=\""+agentID+"\""
  console.log(query);
  return query;
}
module.exports.editAgent = editAgent;

var updateAgentData = function(fname,lname,email,activness,role,tier,password,agentID){
  var query = "UPDATE agent SET FirstName = \""+fname+"\", LastName = \""+lname+"\", EmailId = \""+email+"\", Activness = \""+activness+"\", Role = \""+role+"\", Tier = \""+tier+"\", password = \""+password+"\"  WHERE ID = \""+agentID+"\""
  console.log(query);
  return query;
}
module.exports.updateAgentData = updateAgentData;

var userInfo = function(username){
  var query = "select u.username, up.fname, up.lname, t.name from USERS as u inner join USERPROFILE as up on u.profile_id=up.id left join "
  query += " AGENCYTIER as t on t.id = u.agencytierid where u.username = \""+username+"\""
  return query;
}
var pnrQuery = function(username, monthh){
  var query = "select p.id,p.pnr_creation_time as cdate,p.pnr,p.pnr_owner_pri,p.origin,p.destination,p.total_fare,p.commi_amt"
  query += " from USERS as u inner join PNR_DETAILS as p on u.id=p.USER_PNR_DTLS_ID where u.username= \""+username+"\" and "
  query += "month(p.pnr_creation_time)=\""+monthh+"\""
  return query;
}
var pnrfullQuery = function(bookingid){
  var query = "select p.id,p.pnr_creation_time as cdate,p.pnr,p.pnr_owner_pri,p.origin,p.destination,p.total_fare,p.commi_amt"
  query += " from USERS as u inner join PNR_DETAILS as p on u.id=p.USER_PNR_DTLS_ID where p.id= \""+bookingid+"\""
  return query;
}
var AIInfoQuery = "select carrier,incentive_pct,incentive_dlrs,agt_share_pct from AI"
var AIUpdateQuery= function(val0,val1,val2,val3){
  query = "INSERT INTO AI (carrier,incentive_pct,incentive_dlrs,agt_share_pct) VALUES ('"
  query += val0+"'," +val1+","+ val2+","+val3+") ON DUPLICATE KEY UPDATE "
  query += "incentive_pct="+val1+",incentive_dlrs="+val2+",agt_share_pct="+val3
  return query;
}
var getAIVal = function(carrier){
    return "select incentive_pct,incentive_dlrs,agt_share_pct from AI where carrier='"+carrier+"'"
}
var deleteAIVal = function(carrier){
    return "delete from AI where carrier='"+carrier+"'"
}
module.exports.getAIVal = getAIVal;
module.exports.deleteAIVal = deleteAIVal;
module.exports.AIInfoQuery = AIInfoQuery
module.exports.AIUpdateQuery = AIUpdateQuery
module.exports.userInfo = userInfo;
module.exports.pnrQuery = pnrQuery;
module.exports.pnrfullQuery = pnrfullQuery;
module.exports.agentSalesQuery = agentSalesQuery;
module.exports.userQuery = userQuery;
module.exports.con = con;
