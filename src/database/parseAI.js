console.log("result created");
var fs = require('fs');
var parse = require('csv-parse');
var db = require('./mysqlConn')

// var csvData=[];
// create dictionary from csv file so that carrier data is accessible
//carrier as the key
var aiDict ={}
var lineNo = 0
var headers = []
var query;
fs.createReadStream(__dirname +'/onvigo_addl_incentive_table.csv')
    .pipe(parse({delimiter: ','}))
    .on('data', function(csvrow) {
      if(lineNo==0){ headers = csvrow ;}
      else {
        query = "INSERT INTO AI (carrier,incentive_pct,incentive_dlrs,agt_share_pct) VALUES ('"
        query += csvrow[0]+"'," +csvrow[1]+","+ csvrow[2]+","+csvrow[3]+")"
        console.log("query",query);
        db.con.query(query,function(err,rows){
          console.log("res",err,rows);
        })
        // CREATE TABLE AI (carrier VARCHAR(2), incentive_pct int(2),incentive_dlrs int(2),agt_share_pct int(2));

        var aiItem = {}
        for (var i=1;i<csvrow.length;i++){
          aiItem[headers[i]]=csvrow[i]
        }
        aiDict[csvrow[0]]=aiItem
      }
      lineNo += 1;
      // console.log(aiDict);
    })
    .on('end',function() {
      //do something wiht csvData
      console.log(aiDict);
    });
