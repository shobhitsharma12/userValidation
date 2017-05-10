import React from 'react';
class exitingAgent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items:[],
      details:[],
      fname: null,
      lname: null,
      email: null,
      role: null,
      tier: null,
      Status: null,
      password: null,
      searchResult:[],
      agentID: null
    };
    this.updateData = this.updateData.bind(this);
    this.publish3 = this.publish3.bind(this);
  }
    publish2() {
        fetch('/admin/agentlist', {
          method: 'post',
          headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json'
           },
          body: JSON.stringify( {
            } )
        }).then(function(response) {
           // Convert to JSON
         return response.json();
       }).then(json =>this.setState({items: json}))
    }
    popupShow2(event) {
      var agentID =  event.target.dataset.id2
      this.setState({agentID: agentID})
      this.loadEditAgentDetails(agentID)
      $('#mypopup2').css('left',event.pageX-200);
      $('#mypopup2').css('top',event.pageY+20);
      $('#mypopup2').css('display','inline');
      $("#mypopup2").css("position", "absolute");
      $('#mypopup2').show()
    }
    popupHide2() {
      $('#mypopup2').hide()
      //console.log("mypopup is hide ")
    }
    componentDidMount() {
     this.publish2();
    }
    loadEditAgentDetails(agentID) {
      fetch('/admin/editAgentDetail', {
        method: 'post',
        headers: {
           'Accept': 'application/json',
           'Content-Type': 'application/json'
         },
        body: JSON.stringify( {
          agentID: agentID,
        } )
      }).then(function(response) {
         // Convert to JSON
       return response.json();
         //console.log(response.json());
     }).then(json =>this.setState({details: json[0]}))
    }
    updateData(e) {
      if (e.target.className == "fname") {
            this.state.details.FirstName = e.target.fname;
            this.forceUpdate();
        }
      else if (e.target.className == "lname") {
            this.state.details.LastName = e.target.value;
            this.forceUpdate();
        }
      else if (e.target.className == "email") {
            this.state.details.EmailId = e.target.value;
            this.forceUpdate();
        }
      else if (e.target.className == "status") {
            this.state.details.Activness = e.target.value;
            this.forceUpdate();
        }
      else if (e.target.className == "role") {
            this.state.details.Role = e.target.value;
            this.forceUpdate();
        }
      else if (e.target.className == "tier") {
            this.state.details.Tier = e.target.value;
            this.forceUpdate();
        }
      else if (e.target.className == "password") {
            this.state.details.password = e.target.value;
            this.forceUpdate();
        }
    }
    publish3() {
        var sqlState=this.state.details;
        // fetch search result for admin and agent
          fetch('/admin/updateData', {
            method: 'post',
            headers: {
               'Accept': 'application/json',
               'Content-Type': 'application/json'
             },
            body: JSON.stringify( {
              // passing value text field value in varible
                  fname : sqlState.FirstName,
                  lname : sqlState.LastName,
                  email : sqlState.EmailId,
                  activness : sqlState.Activness,
                  role : sqlState.Role,
                  tier : sqlState.Tier,
                  password : sqlState.password,
                  agentID : this.state.agentID
              } )
          }).then(function(response) {
             // Convert to JSON
           return response.json();
         }).then(json =>this.publish2())
         $('#mypopup2').hide()
      }
   render() {
     var middle = this;
     var listItems = this.state.items.map(function(item,id) {
            return(<tr key={id}>
                <td>{item.ID}</td>
                <td>{item.FirstName}</td>
                <td>{item.LastName}</td>
                <td>{item.EmailId}</td>
                <td>{item.Activness}</td>
                <td>{item.Role}</td>
                <td>{item.Tier}</td>
                <td className="mypopupOpen2" onClick={middle.popupShow2.bind(middle)} data-id2={item.ID}>Edit</td>
                </tr>)
        });
        var pD = this.state.details;
    return (
      <div>
      <div className="demo1">
        <div className="demo2">
          <h3>Welcome, Admin! </h3>
        </div>
        <div className="demo3">
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
          Logout
        </button>
        </div>
      </div>
      <center><h4>Registered Agents</h4>
      <table className="mdl-data-table mdl-js-data-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email ID</th>
            <th>Status</th>
            <th>Role</th>
            <th>Tier</th>
            <th>Edit</th>
          </tr>
        </thead>
        <tbody>
          {listItems}
        </tbody>
      </table>
    </center>
    <div className="dialog adminSalesReport2" id="mypopup2">
      <button id="mypopuphide2" onClick={middle.popupHide2}> Hide </button>
        <div className="review_tbl table-responsive">
          <table className="table .table-hover table table-bordered panel" id="pnrInfo1">
            <tr><td className="adminSalesReport6">First Name</td><td className="adminSalesReport6">
            <input type="text" value={pD.FirstName} onChange={middle.updateData} className="fname"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Last Name</td><td className="adminSalesReport6">
            <input type="text" value={pD.LastName} onChange={middle.updateData} className="lname"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Email</td><td className="adminSalesReport6">
            <input type="text" value={pD.EmailId} onChange={middle.updateData} className="email"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Status</td><td className="adminSalesReport6">
            <input type="text" value={pD.Activness} onChange={middle.updateData} className="status"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Role</td><td className="adminSalesReport6">
            <input type="text" value={pD.Role} onChange={middle.updateData} className="role"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Tier</td><td className="adminSalesReport6">
            <input type="text" value={pD.Tier} onChange={middle.updateData} className="tier"/>
            </td></tr>
            <tr><td className="adminSalesReport6">Password</td><td className="adminSalesReport6">
            <input type="text" value={pD.password} onChange={middle.updateData} className="password"/>
            </td></tr>
            <tr><td className="adminSalesReport6"></td><td className="adminSalesReport6">
            <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"  onClick={ this.publish3 }>
              submit
            </button>
            </td></tr>
          </table>
          </div>
        </div>
      </div>
      )
     }
  }
export {exitingAgent}; // export agentDetails
