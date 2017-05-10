var express = require('express');
var app = express();
var cors = require('cors')
var path = require('path');
var bodyParser = require('body-parser');
var db = require('./src/database/mysqlConn') //connecting to database file
var session = require('express-session');

app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
app.use('/napi',express.static(process.cwd() + '/src/client/public'));

//connecting to index.html file
app.get('/napi', function(req, res) {
    res.sendFile(path.join(__dirname + '/src/client/index.html'));
});

// function for getting agentSales details
app.get('/napi/agentSales/:username', function(req, res) {
  //sql query agentSalesQuery calling with username perameter
  db.con.query(db.agentSalesQuery(req.params.username),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

// function for getting  user user details by month
app.get('/napi/userInfo/:username', function(req, res) {
  //sql query agentSalesQuery calling with username perameter
  db.con.query(db.userInfo(req.params.username),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

// function for getting user PNR Details
app.post('/napi/userPnr', function(req, res) {
  var username = req.body.username;
  var month = req.body.month;
  //sql query pnrQuery calling with username and month perameter
  db.con.query(db.pnrQuery(username,month),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

// function for getting user fixed PNR Full details
app.post('/napi/userfullPnr', function(req, res) {
  var bookingid = req.body.bookingid;
  //sql query pnrfullQuery calling with bookingid perameter
  db.con.query(db.pnrfullQuery(bookingid),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

//function for admin result
app.post('/napi/admin/result', function(req, res) {
  //values from admin.js
  var agent_name = req.body.agent_name;
  var origin = req.body.source;
  var destination = req.body.destination;
  var startdate = req.body.startdate;
  var enddate = req.body.enddate;
//sql query userre calling with agent_name, origin, destination, startdate, enddate
  db.con.query(db.userre(origin,destination,agent_name,startdate,enddate),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

//function for admin result
app.post('/agent/result', function(req, res) {
  //values from admin.js
  var emailID = req.body.emailID;
  var password = req.body.password;
//sql query userre calling with agent_name, origin, destination, startdate, enddate
  db.con.query(db.agentCheck(emailID,password),function(err,rows){
    if(err) throw err;
    res.json(rows);
    var agentID = rows.length;
    if(agentID=="")
    {console.log("User Not Present")}
    else{
      console.log("Thanks login");
    }
  });
});

//function for admin result
app.post('/admin/result', function(req, res) {
  //values from admin.js
  var adminID = req.body.adminID;
  var passwordAdmin = req.body.passwordAdmin;
  db.con.query(db.adminCheck(adminID,passwordAdmin),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

//function for admin result
app.post('/admin/addAgent', function(req, res) {
  //values from admin.js
  var fname = req.body.fname;
  var lname = req.body.lname;
  var email = req.body.email;
  var role = req.body.role;
  var tier = req.body.tier;
  var password = req.body.password;
//sql query userre calling with agent_name, origin, destination, startdate, enddate
  db.con.query(db.addAgent(fname,lname,email,role,tier,password),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

app.post('/admin/editAgentDetail', function(req, res) {
  var agentID = req.body.agentID;
  db.con.query(db.editAgent(agentID),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

app.post('/admin/updateData', function(req, res) {
  var fname = req.body.fname;
  var lname = req.body.lname;
  var email = req.body.email;
  var role = req.body.role;
  var tier = req.body.tier;
  var activness = req.body.activness;
  var password = req.body.password;
  var agentID = req.body.agentID;
  db.con.query(db.updateAgentData(fname,lname,email,activness,role,tier,password,agentID),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});


//function for admin result
app.post('/admin/agentlist', function(req, res) {
  db.con.query(db.agentlist,function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
});

// function for getting day report of user booking
app.post('/napi/admin/dayreport',function(req,res){
  var datevarible = req.body.selecteddate;
  //sql query userQuery calling with varibles
  console.log(datevarible);
  db.con.query(db.userdayQuery(datevarible),function(err,rows){
    if(err) throw err;
    res.json(rows);
  });
})

//console output when server.js file runs
app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
     });
console.log("magic happens at 9080");
app.listen(9080);
