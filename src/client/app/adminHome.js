import React from 'react';
class adminHome extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items:[]
    };
  }
   render() {
    return (
      <div className="demo1">
        <div className="demo2">
          <h3>Welcome, Admin! </h3>
        </div>
        <div className="demo3">
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
          Logout
        </button>
        </div>
        <h6><a href="http://localhost:9080/napi/#/registerAgent">Registered Agents</a></h6>
        <h6><a href="http://localhost:9080/napi/#/exitingAgent">Existing Agents</a></h6>
      </div>
      )
     }
  }
export {adminHome}; // export agentDetails
