var async = require('asyncawait/async');
var await = require('asyncawait/await');
var webdriverio = require('webdriverio');

var options = {
    desiredCapabilities: {
        browserName: 'chrome',
        logLevel: 'verbose'
    }
};
env: {
        browser: true
      }

function preProcessForm(){
  document.getElementsByName("seg0_date")[0].removeAttribute('readonly')
  document.getElementsByName("seg1_date")[0].removeAttribute('readonly')
}

function hideCalendar(){
  document.getElementById("ui-datepicker-div").style.display = 'none'
}

function getLowestFare(flightName){
	try {
		console.log("Calculating lowest fare.....");
  		var flights = document.querySelectorAll("#fares-search-package-list .inner-package-list ul")[0];
  		var flightDivs = document.querySelectorAll("#fares-search-package-list .inner-package-list ul")[0].childNodes
  		flightDivs = Array.prototype.slice.call(flightDivs, 0).filter((a)=> (a.nodeName=="LI"))
  		// var flightNameList = flightDivs.map((flightDiv)=>flightDiv.textContent.trim().replace(/\s+/g, ' '))
  		//console.log("Finding flight...");
  		var foundFlights = flightDivs.filter((flightDiv) => {
    	var flightString = flightDiv.textContent.trim().replace(/\s+/g, ' ');
    	return flightString.indexOf(flightName) >= 0
  		})
  		if (foundFlights.length){
    		var foundFare = foundFlights[0].querySelectorAll('.flight-price-number')[0].textContent.trim().replace(/\s+/g, ' ') + ""
    		console.log("flight is found :",foundFare)
  		} else {
    		var foundFare = flightDivs[0].querySelectorAll('.flight-price-number')[0].textContent.trim().replace(/\s+/g, ' ') + ""
    		//console.log("Lowest fare is :",foundFare)
  		}
  		return foundFare
		}
		catch (err) {
		console.log(err);
  	return null;
	}

}

module.exports.findLowestFare = async (function(flightName,browser,url){
try {
	console.log("Finding lowest fare.....");
  	var result = await( browser.execute(getLowestFare,flightName))
  	await (browser.url(url));
  	if (result != null)
  	{
  		return result.value;
  	}
	return result;
 }
 catch(err)
 {
  console.log(err);
  return null;
 } 
});

var roundTrip = function(source,destination,date1,date2){
//  var b1 = webdriverio.remote(options).init().url("http://www.flighthub.com/")
  console.log("b1",b1)
  b1.then(()=>b1.setValue('#main_search_fares_form .container-home-search-from .hp-search-city input.airport_search', source))
    .then(()=>b1.setValue('#main_search_fares_form .container-home-search-from .hp-search-date input', date1))
    .then(()=>b1.setValue('#main_search_fares_form .container-home-search-to .hp-search-city input.airport_search', destination))
    .then(()=>b1.setValue('#main_search_fares_form .container-home-search-to .hp-search-date input', date2))
    .then(()=>b1.click('#btn-search-flight'))
    .then(()=>b1.saveScreenshot('./src/scrap/snapshot1.png'))
    .then(()=>b1.waitForVisible('.filter-button.active',10000))
    .then(()=>b1.saveScreenshot('./src/scrap/snapshot2.png'))
    .then(()=>b1.end())
}

/*
 * TRIP TYPE = ROUND_TRIP
 * roundTrip2('YYZ','LHR','2017-04-05','2017-04-12','46')
 *
*/ 
module.exports.roundTrip2 = async (function(source,destination,date1,date2,browser,url){
try {
  //console.log("Round Trip search .................>")
  //var browser = webdriverio.remote(options).init().url("http://us.flighthub.com/")
  var currentUrl = await ( browser.getUrl());
  console.log("Current URL : "+currentUrl + " url : "+ url);
  if (currentUrl != url)
  {
  		console.log("Loading url : "+ url);
      await (browser.url(url));
  }
  await (browser.click('#inline-search-form-1 .form-filters-wrap.flight-type.clearfix ul > li:nth-child(1) > a'))
  await (browser.setValue('#inline-search-form-1 .form-field-from input.airport-related[name^="seg0_from"]', source))
  await (browser.setValue('#inline-search-form-1 .form-field-to input.airport-related[name^="seg0_to"]', destination)) 
  await (browser.execute(function(){document.getElementsByName("seg0_date")[0].removeAttribute('readonly')}))
  await (browser.execute(function(){document.getElementsByName("seg1_date")[0].removeAttribute('readonly')}))
  await (browser.setValue('#inline-search-form-1 .form-field-from-date input[name^="seg0_date"]', date1))
  await (browser.setValue('#inline-search-form-1 .form-field-to-date input[name^="seg1_date"]', date2).then((s)=>console.log("success",s),(f)=> console.log("failure",f) ) )
  //Clicking search button
  await (browser.click('#inline-search-form-1 .form-field-button'))
  await (browser.waitForVisible('.lowest-price.active',20000))
  await (browser.saveScreenshot('./src/scrap/FinalResult.png'))
  return true;
 }
 catch(err)
 {
  console.log(err);
  return null;
 } 

});

 /*
 * TRIP TYPE = ONE_WAY
 * FOR us.flighthub.com
 *
 * oneway('YYZ','LHR','2017-03-17','46')
 */
module.exports.oneway = async (function(source,destination,date1,browser,url){
try {
  //console.log("One Way search .......................>")
  var currentUrl = await ( browser.getUrl());
  console.log("Current URL : "+currentUrl + " url : "+ url);
  if (currentUrl != url)
  {
  		console.log("Loading url : "+ url);
      await (browser.url(url));
  }
  await (browser.click('#inline-search-form-1 .form-filters-wrap.flight-type.clearfix ul > li:nth-child(2) > a'))
  //await (browser.saveScreenshot('./src/scrap/oneWay.png'))
  await (browser.setValue('#inline-search-form-1 .form-field-from input.airport-related[name^="seg0_from"]', source))
  await (browser.setValue('#inline-search-form-1 .form-field-to input.airport-related[name^="seg0_to"]', destination)) 
  await (browser.execute(function(){document.getElementsByName("seg0_date")[0].removeAttribute('readonly')}))
  await (browser.setValue('#inline-search-form-1 .form-field-from-date input[name^="seg0_date"]', date1))
  await (browser.click('#inline-search-form-1 .form-field-button'))
  await (browser.waitForVisible('.lowest-price.active',20000))
  await (browser.saveScreenshot('./src/scrap/FinalResult.png'))
  //console.log('Calculating lowest fare.....');
  return true;
 }
 catch(err)
 {
  console.log(err);
  return null;
 } 

});

/*
 *TRIP TYPE = MULTICITY
 * for us.flighthub.com
 *
 * multicity('YYZ','LHR','2017-04-17','46','LHR','SIN','2017-04-28')
 */
module.exports.multicity = async (function(source1,destination1,date1,source2,destination2,date2,browser,url){
try {
  //console.log("Multicity search ......................>")
  //var browser = webdriverio.remote(options).init().url("http://us.flighthub.com/")
    var currentUrl = await ( browser.getUrl());
  console.log("Current URL : "+currentUrl + " url : "+ url);
  if (currentUrl != url)
  {
  		console.log("Loading url : "+ url);
      await (browser.url(url));
  }
  await (browser.click('#inline-search-form-1 .form-filters-wrap.flight-type.clearfix ul > li:nth-child(3) > a'))
  //City 1 data 
  await (browser.setValue('#inline-search-form-1 .form-field-from input.airport-related[name^="seg0_from"]', source1))
  await (browser.setValue('#inline-search-form-1 .form-field-to input.airport-related[name^="seg0_to"]', destination1)) 
  await (browser.execute(function(){document.getElementsByName("seg0_date")[0].removeAttribute('readonly')}))
  await (browser.execute(function(){document.getElementsByName("seg1_date")[1].removeAttribute('readonly')}))
  await (browser.setValue('#inline-search-form-1 .form-field-from-date input[name^="seg0_date"]', date1))
 // await (b1.setValue(function(){document.getElementById("ui-datepicker-div").style.display = 'none'}));
  //City 2 data
  await (browser.setValue('#inline-search-form-1 #inline-search-form-segment-1 .form-field-from input.airport-related[name^="seg1_from"]', source2))
  await (browser.setValue('#inline-search-form-1 #inline-search-form-segment-1 .form-field-to input.airport-related[name^="seg1_to"]', destination2))
  await (browser.setValue('#inline-search-form-1 #inline-search-form-segment-1 .form-field-from-date input[name^="seg1_date"]', date2))
  //Starting search process by clicking search button
  await (browser.click('#inline-search-form-1 .form-field-button'))
  await (browser.waitForVisible('.lowest-price.active',20000))
  await (browser.saveScreenshot('./src/scrap/FinalResult.png'))
  console.log('Calculating lowest fare.....');
  return true;
 }
 catch(err)
 {
  console.log(err);
  return null;
 } 

});
