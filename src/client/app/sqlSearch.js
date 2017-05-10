import React from 'react'; // react import
// sqlSearch component define
class sqlSearch extends React.Component {
  constructor() {
    super();
    this.state = {
      // state varible declaration for sqlSearch component
      agent_name: null,
      source: null,
      destination: null,
      startdate: null,
      enddate: null,
      searchResult: []
    };
    // bind publish and handleChange function
    this.publish = this.publish.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }
  // handleChange function define to setState
  handleChange({ target }) {
  this.setState({
    [target.name]: target.value
  });
}
  // publish function
  publish() {
    var sqlState=this.state;
    // fetch search result for admin and agent
      fetch('/napi/admin/result', {
      	method: 'post',
        headers: {
           'Accept': 'application/json',
           'Content-Type': 'application/json'
         },
      	body: JSON.stringify( {
          // passing value text field value in varible
              agent_name : sqlState.agent_name,
              source : sqlState.source,
              destination : sqlState.destination,
              startdate : sqlState.startdate,
              enddate : sqlState.enddate
          } )
      }).then(function(response) {
         // Convert to JSON
       return response.json();
     }).then(json =>this.setState({searchResult: json}))
  }
   render() {
     // declare listItems vrible and passing searchResult JSON value
     var listItems = this.state.searchResult.map(function(item,id) {
            return(<tr key={id}>
                <td>{item.USERNAME}</td>
                <td>{item.ORIGIN}</td>
                <td>{item.DESTINATION}</td>
                <td>{item.month} - {item.year}</td>
                <td>{item.time}</td>
                </tr>)
        });
      return (
  <div>
   <div className="booking_review_wrp clearfix">
    <div className="container">
        <div className="row">
          <div className="col-sm-2">
            <div className="field_wrp">
              <div className="form-group">
                <label className="control-label">Agent Name</label>
                <input type="text" className="form-control" name="agent_name" value={ this.state.agent_name } onChange={ this.handleChange }/>
              </div>
            </div>
            <dl>
              <dt>Agent Name</dt>
              <dd>- i.ravipanwar@gmail.com</dd>
              <dd>- vishalmahajan.mca@gmail.com</dd>
            </dl>
          </div>
          <div className="col-sm-2">
           <div className="field_wrp">
             <div className="form-group">
               <label className="control-label">Origin</label>
               <input type="text" className="form-control" name="source" value={ this.state.source } onChange={ this.handleChange } />
             </div>
           </div>
           <dl>
           <dt>Origin</dt>
           <dd>- YUL</dd>
           <dd>- Y</dd>
         </dl>
         </div>
         <div className="col-sm-2">
           <div className="field_wrp">
             <div className="form-group">
               <label className="control-label">Destination</label>
               <input type="text" className="form-control" name="destination" value={ this.state.destination } onChange={ this.handleChange } />
             </div>
           </div>
           <dl>
           <dt>Destination</dt>
           <dd>- YYZ</dd>
           <dd>- Y</dd>
         </dl>
         </div>
         <div className="col-sm-2">
           <div className="form-group">
             <label className="control-label">Starting Date</label>
             <input type="date" name="startdate" value={ this.state.startdate } onChange={ this.handleChange } />
           </div>
           <dl>
           <dt>Starting Date</dt>
           <dd>- 02-04-2011</dd>
           <dd>- 02-04-2011</dd>
         </dl>
         </div>
         <div className="col-sm-2">
           <div className="form-group">
             <label className="control-label">Ending Date</label>
             <input type="date" name="enddate" value={ this.state.enddate } onChange={ this.handleChange } />
           </div>
           <dl>
           <dt>Ending Date</dt>
           <dd>- 21-03-2017</dd>
           <dd>- 21-03-2017</dd>
         </dl>
         </div>
         <div className="col-sm-2">
           <center><br />
             <div className="form-group">
               <button value="Send" className="btn btn-primary" onClick={ this.publish }>Search</button>
             </div>
           </center>
         </div>
       </div>
     </div>
    </div>
    <div className="sqlSeachBox1" id="resultbar"> Searching for :
      <b>
       <span id="v1" className="sqlSeachBox2"></span>
       <span id="s1"></span>
       <span id="v2" className="sqlSeachBox2"></span>
       <span id="s2"></span>
       <span id="v3" className="sqlSeachBox2"></span>
       <span id="s3"></span>
       <span id="v4" className="sqlSeachBox2"></span>
       <span id="s4"></span>
       <span id="v5" className="sqlSeachBox2"></span>
       <span id="s5"></span>
      </b>
    </div><br />
    <div className="container">
     <div className="col-sm-12">
       <div className="review_tbl table-responsive">
         <div className="tbl_heading">
          <table className="table table-bordered panel" id="agentsInfo">
           <thead>
             <tr>
               <th>Agent Name</th>
               <th>Source</th>
               <th>Destination</th>
               <th>Booking Date</th>
               <th>Booking Time</th>
             </tr>
           </thead>
           <tbody>{listItems}
           </tbody>
          </table>
        </div>
       </div>
     </div>
    </div>
  </div>
             )
   }
}

export {sqlSearch}; // eport sqlSearch Component in index.js file
