import React from 'react';
// Getting current date from JavaScript predefined function
var now = new Date();
var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);
var today = now.getFullYear() + "-" + (month) + "-" + (day);
// define adminSalesReport Component for admin Panel
class adminSalesReport extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
// declare state varible for adminSalesReport component
      items:[],
      agentDetails:[],
      userName:[],
      monthBooking: [],
      pnrDetails: [],
      selecteddate: today,
      fixDate: "",
      user: "",
      firstName: "",
      address: "",
      tier: "",
      salesCountMin: "",
      salesCountMax: "",
      filteredItems:[]
    };
// bind handleChange function when click on full day or today report
    this.handleChange = this.handleChange.bind(this);
  }
// userStateChange function for onChange username filter
  userStateChange({ target }) {
    this.setState({
      user: target.value
    },this.filteredResult);
  }
// firstNameStateChange function for onChange firstName filter
  firstNameStateChange({ target }) {
    this.setState({
      firstName: target.value
    },this.filteredResult);
  }
// addressStateChange function for onChange address filter
  addressStateChange({ target }) {
    this.setState({
      address: target.value
    },this.filteredResult);
  }
// tierStateChange function for onChange tiers filter
  tierStateChange({ target }) {
    this.setState({
      tier: target.value
    },this.filteredResult);
  }
// salesCountMinStateChange function for onChange username filter
  salesCountMinStateChange({ target }) {
    this.setState({
      salesCountMin: target.value
    },this.filteredResult);
  }
  salesCountMaxStateChange({ target }) {
    this.setState({
      salesCountMax: target.value
    },this.filteredResult);
  }
  handleChange({ target }) {
    this.setState({
      fixDate: target.value
    });
  }
  changedate(){
    var fixDate = this.state.fixDate
    console.log(fixDate);
    this.setState({selecteddate: fixDate},this.loadSalesDayReport)
    $('#mypopup').hide()
    $('#mypopup1').hide()
    $('#mypopup2').hide()
  }
  changeFull(){
    this.setState({selecteddate: ""},this.loadSalesDayReport)
    $('#value2121').addClass('active');
    $('#value1212').removeClass('active');
    $('#mypopup').hide()
    $('#mypopup1').hide()
    $('#mypopup2').hide()
  }
  changeDaily(){
    this.setState({selecteddate: today},this.loadSalesDayReport);
    $('#value1212').addClass('active');
    $('#value2121').removeClass('active');
    $('#mypopup').hide()
    $('#mypopup1').hide()
    $('#mypopup2').hide()
  }
  filteredResult(){
    var i
    var filteredItems = []
    var items = this.state.items
    var user = this.state.user
    var firstName = this.state.firstName
    var address = this.state.address
    var tier = this.state.tier
    var min = this.state.salesCountMin
    var max = this.state.salesCountMax
  //  console.log("user date change",items,items.length)
    for(i=0; i<items.length; i++){
      var curr = items[i]
    //  console.log("user date change")
      if (((user!="") && (curr.username.toLowerCase().search(user) == -1))
      ||((firstName!="") && (curr.fname.toLowerCase().search(firstName) == -1))
      ||((address!="") && (curr.address.toLowerCase().search(address) == -1))
      ||((tier!="") && (curr.name.toLowerCase().search(tier))== -1)
      ||((min!="") && (parseInt(min))>(parseInt(curr.value)))
      ||((max!="") && (parseInt(max))<(parseInt(curr.value)))){
        //console.log("no matching")
      }
      else{
        filteredItems.push(curr);
      }
    }
    this.setState({filteredItems: filteredItems});
  }
  popupShow(event) {
    var username =  event.target.dataset.un
    this.setState({userName: username})
    //console.log("this is clicked: ",this.state.agentDetails,event.target.dataset.un)
    this.loadAgentSalesData(username)
    //console.log("this is clicked: ",username)
    $('#mypopup').css('left',event.pageX);      // <<< use pageX and pageY
    $('#mypopup').css('top',event.pageY+18);
    $('#mypopup').css('display','inline');
    $("#mypopup").css("position", "absolute");
    $('#mypopup').show()
  }
  popupHide() {
    $('#mypopup').hide()
    $('#mypopup1').hide()
    $('#mypopup2').hide()
    //console.log("mypopup is hide ")
  }
  loadAgentSalesData(username) {
    fetch('/napi/agentSales/'+username).then(function(response) {
       // Convert to JSON
     return response.json();
       //console.log(response.json());
   }).then(json =>this.setState({agentDetails: json},this.popupHide1))
  }
  loadSalesDayReport() {
    fetch('/napi/admin/dayreport', {
      method: 'post',
      headers: {
         'Accept': 'application/json',
         'Content-Type': 'application/json'
       },
      body: JSON.stringify( {
        selecteddate: this.state.selecteddate,
      } )
    }).then(function(response) {
       // Convert to JSON
     return response.json();
       //console.log(response.json());
   }).then(json =>this.setState({items: json},this.filteredResult))
  }
  popupShow1(event) {
    var month =  event.target.dataset.m2
    //console.log("this is clicked: ",this.state.userName,event.target.dataset.m2)
    this.loadmonthDetails(this.state.userName,month)
    //console.log("this is clicked: ",month)
    $('#mypopup1').css('left',event.pageX);      // <<< use pageX and pageY
    $('#mypopup1').css('top',event.pageY+18);
    $('#mypopup1').css('display','inline');
    $("#mypopup1").css("position", "absolute");
    $('#mypopup1').show()
  }
  popupHide1() {
    $('#mypopup1').hide()
    $('#mypopup2').hide()
    //console.log("mypopup is hide ")
  }
  loadmonthDetails(u,m) {
    fetch('/napi/userPnr', {
      method: 'post',
      headers: {
         'Accept': 'application/json',
         'Content-Type': 'application/json'
       },
      body: JSON.stringify( {
        username: u,
        month: m
      } )
    }).then(function(response) {
       // Convert to JSON
     return response.json();
       //console.log(response.json());
   }).then(json =>this.setState({monthBooking: json},this.popupHide2))
  }
  popupShow2(event) {
    var bookingId =  event.target.dataset.id2
    //console.log("this is clicked: ",this.state.pnrDetails,event.target.dataset.id2)
    this.loadPnrDetails(bookingId)
    //console.log("this is clicked: ",bookingId)
    $('#mypopup2').css('left',event.pageX);      // <<< use pageX and pageY
    $('#mypopup2').css('top',event.pageY+18);
    $('#mypopup2').css('display','inline');
    $("#mypopup2").css("position", "absolute");
    $('#mypopup2').show()
  }
  popupHide2() {
    $('#mypopup2').hide()
    //console.log("mypopup is hide ")
  }
  loadPnrDetails(id) {
    fetch('/napi/userfullPnr', {
      method: 'post',
      headers: {
         'Accept': 'application/json',
         'Content-Type': 'application/json'
       },
      body: JSON.stringify( {
        bookingid: id,
      } )
    }).then(function(response) {
       // Convert to JSON
     return response.json();
       //console.log(response.json());
   }).then(json =>this.setState({pnrDetails: json[0]}))
  }
  componentDidMount() {
   this.loadSalesDayReport(selecteddate);
  }
   render() {
     var middle = this;
     var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
     var monthDict = {January:1, February:2, March:3, April:4, May:5, June:6, July:7,August:8,September:9,October:10,November:11,December:12};
     var listItems = this.state.filteredItems.map(function(item,id) {
      //  var m= {'month': item.m}
            return(<tr key={id}>
                <td className="mypopupOpen" onClick={middle.popupShow.bind(middle)} data-un={item.username} >{item.username}</td>
                <td>{item.fname}</td>
                <td>{item.address}</td>
                <td>{item.name}</td>
                <td>{item.value}</td>
                </tr>)
        });
      var i=Object.keys(this.state.filteredItems).length;
         console.log(i);
         if(i==0){
           $('#message').show()
         }
         else {
         $('#message').hide()
         }
      var userBookingDetails = this.state.agentDetails.map(function(mB,id2) {
             return(<tr key={id2}>
                 <td className="mypopupOpen1" onClick={middle.popupShow1.bind(middle)} data-m2={mB.m}>{monthNames[mB.m-1]}</td>
                 <td>{mB.y}</td>
                 <td>{mB.countt}</td>
                 <td>{mB.countt}</td>
                 <td>{mB.total}</td>
                 <td>{mB.commi}</td>
                 <td> AI </td>
                 <td> </td>
                 </tr>)
         });
       var monthBookingList = this.state.monthBooking.map(function(Bl,id2) {
              return(<tr key={id2}>
                  <td className="mypopupOpen2"  onClick={middle.popupShow2.bind(middle)} data-id2={Bl.id}>{Bl.id}</td>
                  <td>{Bl.cdate}</td>
                  <td>{Bl.origin} - {Bl.destination}</td>
                  <td>{Bl.total_fare}</td>
                  <td>{Bl.commi_amt}</td>
                  </tr>)
          });
       var pD = this.state.pnrDetails
      return (
        <div>
          <div className="main_nav clearfix">
            <div  className="container">
              <div className="site_nav navbar">
                <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#siteMenu" aria-expanded="false">
                <span className="sr-only">Toggle navigation</span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                </button>
                <div className="collapse navbar-collapse" id="siteMenu">
                  <ul className="nav navbar-nav">
                    <li id="value1212" className="active" onClick={middle.changeDaily.bind(middle)}><a>Daily Sales Report</a></li>
                    <li id="value2121" onClick={middle.changeFull.bind(middle)}><a>Full Sales Report</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div><br />
          <center>
            <input type='date' id='selecteddate' className="adminSalesReport1" value={ this.state.fixDate } onChange={ this.handleChange } />
            <input type="button" value="Go" id="goes"  onClick={middle.changedate.bind(middle)} />
            <input type="button" value="Reset" id="valuereset" />
          </center><br />
          <div className="container">
          <div className="col-sm-4">
            <table className="table">
              <tr className="danger">
                <td><h5>Filter By :</h5></td>
              </tr>
            </table>
            <table className="table">
            <tbody>
              <tr className="success">
                <td className="adminSalesReport5">Username: </td>
                <td><input type="text" id="myInput1" value={ this.state.user } onChange={ middle.userStateChange.bind(middle) } /></td>
              </tr>
              <tr className="info">
                <td>First Name:</td>
                <td><input type="text" id="myInput2" value={ this.state.firstName } onChange={ middle.firstNameStateChange.bind(middle) } /></td>
              </tr>
              <tr className="success">
                <td>Address :</td>
                <td><input type="text" id="myInput3" value={ this.state.address } onChange={ middle.addressStateChange.bind(middle) } /></td>
              </tr>
              <tr className="info">
                <td>Tier :</td>
                <td><input type="text" id="myInput4" value={ this.state.tier } onChange={ middle.tierStateChange.bind(middle) } /></td>
              </tr>
                 <tr className="success">
                   <td>Sales Count</td>
                   <td>
                     Min : <input type="text" id="myInput6" className="adminSalesReport4" value={ this.state.salesCountMin } onChange={ middle.salesCountMinStateChange.bind(middle) } />
                     Max : <input type="text" id="myInput5" className="adminSalesReport4" value={ this.state.salesCountMax } onChange={ middle.salesCountMaxStateChange.bind(middle) } />
                    </td>
                 </tr>
            </tbody>
          </table>
        </div>
        <div className="col-sm-8">
          <div className="review_tbl table-responsive">
            <div className="tbl_heading">
              <table className="table table-bordered panel" id="agentsInfo">
                <thead>
                  <tr>
                   <th>User Name</th>
                   <th>First Name</th>
                   <th>Address</th>
                   <th>Tier</th>
                   <th>SaleCount</th>
                  </tr>
                </thead>
              <tbody>{listItems}
              </tbody>
          </table>
          <h3 id="message">Sorry, No booking done today !</h3>
        </div>
      </div>
    </div>
    <div className="dialog" id="mypopup" className="adminSalesReport3">
      <button id="mypopuphide" onClick={middle.popupHide}> Hide </button>
      <div className="review_tbl table-responsive">
        <table className="table .table-hover table table-bordered panel" id="salesInfo">
          <thead>
            <tr>
              <th>Month</th>
              <th>Year</th>
              <th>Bookings</th>
              <th>Passengers</th>
              <th>Total Sales</th>
              <th>Total Commission</th>
              <th>Addl Incentive</th>
              <th>Details</th>
            </tr>
          </thead>
          <tbody>{userBookingDetails}
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <div className="dialog" id="mypopup1" className="adminSalesReport3">
    <button id="mypopuphide1" onClick={middle.popupHide1}> Hide </button>
    <div className="review_tbl table-responsive">
      <table className="table .table-hover table table-bordered panel" id="pnrInfo">
        <thead>
          <tr>
            <th>Booking ID</th>
            <th>Creation Time</th>
            <th>City Pair</th>
            <th>Total Fare</th>
            <th>Commission</th>
          </tr>
        </thead>
       <tbody>{monthBookingList}
       </tbody>
       </table>
      </div>
    </div>
    <div className="dialog adminSalesReport2" id="mypopup2">
      <button id="mypopuphide2" onClick={middle.popupHide2}> Hide </button>
        <div className="review_tbl table-responsive">
          <table className="table .table-hover table table-bordered panel" id="pnrInfo1">
            <tr><td className="adminSalesReport6">Creation Time</td><td className="adminSalesReport6">{pD.cdate}</td></tr>
            <tr><td className="adminSalesReport7">Booking ID</td><td className="adminSalesReport7">{pD.id}</td></tr>
            <tr><td className="adminSalesReport6">GDS</td><td className="adminSalesReport6">{pD.pnr_owner_pri}</td></tr>
            <tr><td className="adminSalesReport7">Carrier</td><td className="adminSalesReport7">{pD.pnr_owner_pri}</td></tr>
            <tr><td className="adminSalesReport6">Trip Type</td><td className="adminSalesReport6">tripType</td></tr>
            <tr><td className="adminSalesReport7">City Pair</td><td className="adminSalesReport7">{pD.origin} - {pD.destination}</td></tr>
            <tr><td className="adminSalesReport6">Client Location</td><td className="adminSalesReport6">CL</td></tr>
            <tr><td className="adminSalesReport7">Base Fare</td><td className="adminSalesReport7">BF</td></tr>
            <tr><td className="adminSalesReport6">Taxes</td><td className="adminSalesReport6">TAXES</td></tr>
            <tr><td className="adminSalesReport7">Total Fare</td><td className="adminSalesReport7">{pD.total_fare}</td></tr>
            <tr><td className="adminSalesReport6">Commission</td><td className="adminSalesReport6">{pD.commi_amt}</td></tr>
            <tr><td className="adminSalesReport7">Additional Incentive</td><td className="adminSalesReport7">AI</td></tr>
            <tr><td className="adminSalesReport6">Total Earned</td><td className="adminSalesReport6">TE</td></tr>
          </table>
          </div>
        </div>
    </div>
    )
   }
}
export {adminSalesReport};
