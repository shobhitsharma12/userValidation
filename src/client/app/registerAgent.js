import React from 'react';
class registerAgent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      fname: null,
      lname: null,
      email: null,
      role: null,
      tier: null,
      password: null,
      searchResult:[]
    };
    this.publish = this.publish.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }
  handleChange({ target }) {
    this.setState({
      [target.name]: target.value
    });
  }
  publish() {
      var sqlState=this.state;
      // fetch search result for admin and agent
        fetch('/admin/addAgent', {
          method: 'post',
          headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json'
           },
          body: JSON.stringify( {
            // passing value text field value in varible
                fname : sqlState.fname,
                lname : sqlState.lname,
                email : sqlState.email,
                role : sqlState.role,
                tier : sqlState.tier,
                password : sqlState.password
            } )
        }).then(function(response) {
           // Convert to JSON
         return response.json();
       }).then(json =>this.setState({searchResult: json}))
    }
   render() {
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
      <div className="mdl-grid">
        <div className="mdl-cell mdl-cell--4-col">
        </div>
        <div className="mdl-cell mdl-cell--4-col">
        <h4>Register Agent</h4>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" name="fname" value={ this.state.fname } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter First Name</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" name="lname" value={ this.state.lname } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter Last Name</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" name="email" value={ this.state.email } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter Email ID</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="password" id="sample3" name="password" value={ this.state.password } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter Password</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" name="role" value={ this.state.role } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter Role</label>
        </div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input className="mdl-textfield__input" type="text" id="sample3" name="tier" value={ this.state.tier } onChange={ this.handleChange } />
          <label className="mdl-textfield__label" >Enter Tier</label>
        </div>
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onClick={ this.publish }>
          submit
        </button>
        </div>
        <div className="mdl-cell mdl-cell--4-col">
        </div>
      </div>
      </div>
      )
     }
  }
export {registerAgent}; // export agentDetails
