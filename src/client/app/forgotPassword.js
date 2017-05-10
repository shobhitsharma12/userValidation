import React from 'react';
class forgotPassword extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items:[]
    };
  }
   render() {
    return (
      <div>
      <center>
      <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <input className="mdl-textfield__input" type="text" id="sample3" />
        <label className="mdl-textfield__label" >Enter Email ID</label>
      </div><br />
      <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
        submit
      </button>
      </center>
      </div>
      )
     }
  }
export {forgotPassword}; // export agentDetails
