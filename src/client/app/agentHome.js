import React from 'react';
class agentHome extends React.Component {
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
          <h3>Welcome, Rahul! </h3>
        </div>
        <div className="demo3">
         <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
           Change Password
         </button>
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
          Logout
        </button>
        </div>
      </div>
      )
     }
  }
export {agentHome}; // export agentDetails
