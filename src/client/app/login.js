import React from 'react';
class login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      emailID:null,
      password:null,
      loginResult:null,
      adminID:null,
      passwordAdmin:null,
      adminResult:null

    };
    this.publish = this.publish.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.publish1 = this.publish1.bind(this);
  }
  handleChange({ target }) {
    this.setState({
      [target.name]: target.value
    });
  }
    // publish function
    publish() {
      var sqlState=this.state;
      // fetch search result for admin and agent
        fetch('/agent/result', {
        	method: 'post',
          headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json'
           },
        	body: JSON.stringify( {
            // passing value text field value in varible
                emailID : sqlState.emailID,
                password : sqlState.password
            } )
        }).then(function(response) {
           // Convert to JSON
         return response.json();
       }).then(json =>this.setState({loginResult: json}))
    }
    // publish function
    publish1() {
      var sqlState=this.state;
      // fetch search result for admin and agent
        fetch('/admin/result', {
        	method: 'post',
          headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json'
           },
        	body: JSON.stringify( {
            // passing value text field value in varible
                adminID : sqlState.adminID,
                passwordAdmin : sqlState.passwordAdmin
            } )
        }).then(function(response) {
           // Convert to JSON
         return response.json();
       }).then(json =>this.setState({adminResult: json}))
    }
   render() {
    var middle = this;
    return (
      <div className="container">
      <div className="row">
        <div className="col-md-6">.
          <div className="form-signin">
            <h2 className="form-signin-heading">Agent login</h2>
            <input type="text" className="form-control" value={ this.state.emailID } onChange={ this.handleChange } name="emailID" placeholder="Email Address" required="" />
            <input type="password" className="form-control" value={ this.state.password } onChange={ this.handleChange } name="password" placeholder="Password" required=""/>
            <br /><input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe" /> <b>Remember me</b>
              <a href="#"> <b>Forgot Password?</b></a><br /><br />
            <input className="btn btn-lg btn-primary btn-block" type="submit" value="Login" onClick={ middle.publish } />
          </div>
        </div>
        <div className="col-md-6">.
          <div className="form-signin">
            <h2 className="form-signin-heading">Admin login</h2>
            <input type="text" className="form-control" value={ this.state.adminID } onChange={ this.handleChange } name="adminID" placeholder="Admin ID" required/>
            <input type="password" className="form-control" value={ this.state.passwordAdmin } onChange={ this.handleChange } name="passwordAdmin" placeholder="Password" required/>
            <br /><input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe" /><b> Remember me</b><br /><br />
            <input className="btn btn-lg btn-primary btn-block" type="submit" value="Login" onClick={ middle.publish1 } />
          </div>
        </div>
      </div>
      </div>
      )
     }
  }
export {login}; // export agentDetails
