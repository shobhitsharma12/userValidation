import React from 'react'; // react import
// Middle component define
class Middle extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
// Middle component state varible declaration
      items:[],
      agents:[],
      monthBooking: [],
      pnrDetails: []
    };
  }
// loadAgentSalesData function with username varible
    loadAgentSalesData(username) {
      fetch('/napi/agentSales/'+username).then(function(response) {
         // Convert to JSON
       return response.json();
         //console.log(response.json());
     }).then(json =>this.setState({items: json}))
    }
// loadUserInfoData function with username varible
    loadUserInfoData(username) {
      fetch('/napi/userInfo/'+username).then(function(response) {
         // Convert to JSON
       return response.json();
         //console.log(response.json());
     }).then(json =>this.setState({agents: json}))
    }
// popupShow function which call by click on month
    popupShow(event) {
      var month =  event.target.dataset.m2 // declare month varible clicked on specific month
      this.loadmonthDetails(this.state.agents[0].username,month) // call loadmonthDetails function
      console.log("this is clicked: ",month)
      $('#mypopup').css('left',event.pageX);      // <<< use pageX and pageY
      $('#mypopup').css('top',event.pageY+18);
      $('#mypopup').css('display','inline');
      $("#mypopup").css("position", "absolute");
      $('#mypopup').show()
    }
// popupHide function for hiding monthBooking Details
    popupHide() {
      $('#mypopup').hide()
      $('#mypopup1').hide()
      console.log("mypopup is hide ")
    }
// loadmonthDetails function with username and month perameter
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
      }).then(function(response) {       // Convert to JSON
       return response.json();
     }).then(json =>this.setState({monthBooking: json}))
    }
// popupShow1 function to show specific PNR Details
    popupShow1(event) {
      var bookingId =  event.target.dataset.id2
      this.loadPnrDetails(bookingId) // loadPnrDetails function with bookingId varible perameter
      $('#mypopup1').css('left',event.pageX);      // <<< use pageX and pageY
      $('#mypopup1').css('top',event.pageY+18);
      $('#mypopup1').css('display','inline');
      $("#mypopup1").css("position", "absolute");
      $('#mypopup1').show()

    }
// popupHide1 function to hide pnr Details popup
    popupHide1() {
      $('#mypopup1').hide()
      console.log("mypopup is hide ")
    }
// loadPnrDetails function to show PNR Details with ID perameter
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
      }).then(function(response) {    // Convert to JSON
       return response.json();
     }).then(json =>this.setState({pnrDetails: json[0]}))
    }
// componentDidMount to load loadUserInfoData and loadAgentSalesData function
    componentDidMount() {
     var username = this.props.params.username
     this.loadAgentSalesData(username);
     this.loadUserInfoData(username);
    }
//Rendering list item in body
   render() {
     var middle = this;
     var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
     var monthDict = {January:1, February:2, March:3, April:4, May:5, June:6, July:7,August:8,September:9,October:10,November:11,December:12};
// declare listItems varible to show item state json value
     var listItems = this.state.items.map(function(item,id) {
            return(<tr key={id}>
                <td className="mypopupOpen" onClick={middle.popupShow.bind(middle)} data-m2={item.m} >{monthNames[item.m-1]}</td>
                <td>{item.y}</td>
                <td>{item.countt}</td>
                <td>{item.countt}</td>
                <td>{item.total}</td>
                <td>{item.commi}</td>
                <td>AI</td>
                <td></td>
                </tr>)
        });
// declare agentDetails varible to show agents state json value
     var agentDetails = this.state.agents.map(function(agent,id1) {
           return(<p key={id1}>Agent Name: {agent.fname} {agent.lname}<br /><br /> Tier: {agent.name}</p>)
     });
// declare monthBookingList varible to show monthBooking state json value
     var monthBookingList = this.state.monthBooking.map(function(mB,id2) {
            return(<tr key={id2}>
                <td className="mypopupOpen1" onClick={middle.popupShow1.bind(middle)} data-id2={mB.id} >{mB.id}</td>
                <td>{mB.pnr_creation_time}</td>
                <td>{mB.origin} - {mB.destination}</td>
                <td>{mB.total_fare}</td>
                <td>{mB.commi_amt}</td>
                </tr>)
        });
// declare PD varible to show pnrDetails state json value
    var pD = this.state.pnrDetails
    return (
      <div>
        <div className="container">
          <div className="review_tbl table-responsive">
             <div className="tbl_heading">
               <h3 id="agentName"><strong>{agentDetails}</strong></h3>
             </div>
               <table className="table .table-hover table table-bordered panel"  id="userSalesInfo">
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
                <tbody>{listItems}
                </tbody>
              </table>
          </div>
        </div>
        <div className="dialog" id="mypopup">
        <button id="mypopuphide" onClick={middle.popupHide} > Hide </button>
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
              <tr><td>Creation Time</td><td>{pD.pnr_creation_time}</td></tr>
              <tr><td>Booking ID</td><td>{pD.id}</td></tr>
              <tr><td>GDS</td><td>{pD.pnr_owner_pri}</td></tr>
              <tr><td>Carrier</td><td>{pD.pnr_owner_pri}</td></tr>
              <tr><td>Trip Type</td><td>tripType</td></tr>
              <tr><td>City Pair</td><td></td>{pD.origin}{pD.destination}</tr>
              <tr><td>Client Location</td><td>CL</td></tr>
              <tr><td>Base Fare</td><td>BF</td></tr>
              <tr><td>Taxes</td><td>TAXES</td></tr>
              <tr><td>Total Fare</td><td>{pD.total_fare}</td></tr>
              <tr><td>Commission</td><td>{pD.commi_amt}</td></tr>
              <tr><td>Additional Incentive</td><td>AI</td></tr>
              <tr><td>Total Earned</td><td>TE</td></tr>
            </table>
            </div>
          </div>
    </div>
      )
     }
  }
export {Middle}; // export agentDetails
