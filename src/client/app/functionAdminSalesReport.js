import React from 'react';

filteredResult(){
  var i
  var filteredItems = []
  var items = this.state.items
  var user = this.state.user
  var firstName = this.state.firstName
  var address = this.state.address
  var tier = this.state.tier
  var min = this.state.salesCountMin
  var max = this.state.salesCountMax
  for(i=0; i<items.length; i++){
    var curr = items[i]
    if (((user!="") && (curr.username.toLowerCase().search(user) == -1))
    ||((firstName!="") && (curr.fname.toLowerCase().search(firstName) == -1))
    ||((address!="") && (curr.address.toLowerCase().search(address) == -1))
    ||((tier!="") && (curr.name.toLowerCase().search(tier) == -1))
    ||((min!="") && (parseInt(min))>(parseInt(curr.value)))
    ||((max!="") && (parseInt(max))<(parseInt(curr.value)))){
      //console.log("no matching")
    }
    else{
      filteredItems.push(curr);
    }
  this.setState({filteredItems: filteredItems});
  }
}

export {filteredResult};
