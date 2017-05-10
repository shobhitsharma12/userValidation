import React from 'react';
class setPassword extends React.Component {
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
      <div className="mdl-grid">
        <div className="mdl-cell mdl-cell--4-col">
        </div>
        <div className="mdl-cell mdl-cell--4-col">
        <h4>Set Password</h4>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" />
          <label className="mdl-textfield__label" >Enter Current Password</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" />
          <label className="mdl-textfield__label" >Enter New Password</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" />
          <label className="mdl-textfield__label" >Enter New Password</label>
        </div><br /><br />
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
          submit
        </button>
        </div>
        <div className="mdl-cell mdl-cell--4-col">
        </div>
      </div>
      </center>
      </div>
      )
     }
  }
export {setPassword}; // export agentDetails
