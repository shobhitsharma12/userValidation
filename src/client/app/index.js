import React from 'react'; // react import
import {render} from 'react-dom'; // react-dom import
import {login} from './login.js'; // agentReport component import
import {agentHome} from './agentHome.js'; // agentReport component import
import {adminHome} from './adminHome.js'; // agentReport component import
import {exitingAgent} from './exitingAgent.js'; // agentReport component import
import {registerAgent} from './registerAgent.js'; // agentReport component import
import {forgotPassword} from './forgotPassword.js'; // agentReport component import
import {setPassword} from './setPassword.js'; // agentReport component import
import { Router, Route, Link, browserHistory,hashHistory, IndexRoute  } from 'react-router'; // react-router import

// main App component declare with header and footer
class App extends React.Component {
  render () {
    return (
    <div>
        {this.props.children}
    </div>
    );
  }
}
export default App;

// routing of main page
render((
  <Router history={hashHistory}>
    <Route path="/" component={App} >
     <Route path="/login" component={login} />
     <Route path="/agentHome" component={agentHome} />
     <Route path="/adminHome" component={adminHome} />
     <Route path="/exitingAgent" component={exitingAgent} />
     <Route path="/registerAgent" component={registerAgent} />
     <Route path="/forgotPassword" component={forgotPassword} />
     <Route path="/setPassword" component={setPassword} />
    </Route>
  </Router>), document.getElementById('app'));
