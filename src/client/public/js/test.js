/** @jsx React.DOM */
var React = require('react');
var ReactDOM = require('react-dom');
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('root')
);
// console.log("done");
// var React = require('react');
// var ReactDOM = require('react-dom');
// import { Router, Route, Link, browserHistory, IndexRoute  } from 'react-router'
//
// class App extends React.Component {
//    render() {
//       return (
//          <div>
//          <Home />
//             <ul>
//                <li>Home</li>
//                <li>About</li>
//                <li>Contact</li>
//             </ul>
//
//            {this.props.children}
//          </div>
//       )
//    }
// }
//
// export default App;
//
// class Home extends React.Component {
//    render() {
//       return (
//          <div>
//             <h1>Home...</h1>
//          </div>
//       )
//    }
// }
//
// class About extends React.Component {
//    render() {
//       return (
//          <div>
//             <h1>About...</h1>
//          </div>
//       )
//    }
// }
//
//
// class Contact extends React.Component {
//    render() {
//       return (
//          <div>
//             <h1>Contact...</h1>
//          </div>
//       )
//    }
// }
//
// ReactDOM.render((
//    <Router history = {browserHistory}>
//       <Route path = "/" component = {App}>
//          <IndexRoute component = {Home} />
//          <Route path = "home" component = {Home} />
//          <Route path = "about" component = {About} />
//          <Route path = "contact" component = {Contact} />
//       </Route>
//    </Router>
//
// ), document.getElementById('root'))
