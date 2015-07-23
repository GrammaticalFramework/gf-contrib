var gf = new Object();
var pgf_base_url = "pgf";

gf.grammars = function (callback) {
  gf.httpGetJSONP(pgf_base_url, callback);
};

gf.grammar = function (grammar, callback) {
  gf.callFunction(grammar, "", [], callback);
};

gf.parse = function (grammar,input,from,cat,callback) {
  var args = [];
  args["input"] = input;
  args["from"] = from;
  args["cat"] = cat;
  gf.callFunction(grammar, "parse", args, callback);
};

gf.complete = function (grammar,input,from,cat,callback) {
  var args = [];
  args["input"] = input;
  args["from"] = from;
  args["cat"] = cat;
  gf.callFunction(grammar, "complete", args, callback);
};

gf.linearize = function (grammar,tree,to,callback) {
  var args = [];
  args["tree"] = tree;
  args["to"] = to;
  gf.callFunction(grammar, "linearize", args, callback);
};

gf.random = function (grammar,cat,limit,callback) {
  var args = [];
  args["cat"] = cat;
  args["limit"] = limit;
  gf.callFunction(grammar, "random", args, callback);
};

gf.translate = function (grammar,input,from,to,cat,callback) {
  var args = [];
  args["input"] = input;
  args["from"] = from;
  args["to"] = to;
  args["cat"] = cat;
  gf.callFunction(grammar, "translate", args, callback);
};

gf.callFunction = function (grammar, fun, args, callback) {
  var query = "";
  for (var i in args) {
    query += (query == "") ? "?" : "&";
    query += i + "=" + encodeURIComponent(args[i]);
  }
  var url = pgf_base_url + "/" + grammar +"/" + fun + query;

  // FIXME: if same domain, use gf.httpGetText
  gf.httpGetJSONP(url, callback);
}

gf.httpGetJSONP = function (url, callback) { 
  var script = document.createElement("script");

  if (!window.jsonCallbacks) {
    window.jsonCallbacks = new Array();
  }
  var callbackIndex = window.jsonCallbacks.length;
  window.jsonCallbacks.push(function (output) { 
    // get rid of the script tag
    document.getElementsByTagName("head")[0].removeChild(script);
    // let this function be garbage-collected
    window.jsonCallbacks[callbackIndex] = null;
    // shrink the array if possible
    while (window.jsonCallbacks.length > 0 && window.jsonCallbacks[window.jsonCallbacks.length-1] == null) {
      window.jsonCallbacks.pop();
    }
    callback(output);
  });
  var callbackName = "jsonCallbacks[" + callbackIndex + "]";

  var questionMarkPos = url.indexOf("?");
  if (questionMarkPos > -1) {
    url += (questionMarkPos < url.length-1) ? "&" : "";
  } else {
    url += "?";
  }
  url += "jsonp=" + callbackName;
  script.setAttribute("src", url);
  script.setAttribute("type", "text/javascript");
  document.getElementsByTagName("head")[0].appendChild(script);
};

gf.httpGetText = function (url, callback) { 
  var XMLHttpRequestObject = false; 

  if (window.XMLHttpRequest) {
    XMLHttpRequestObject = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
  }

  if (XMLHttpRequestObject) {
    XMLHttpRequestObject.open("GET", url); 

    XMLHttpRequestObject.onreadystatechange = function () { 
      if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) { 
          callback(XMLHttpRequestObject.responseText); 
          delete XMLHttpRequestObject;
          XMLHttpRequestObject = null;
      } 
    } 

    XMLHttpRequestObject.send(null); 

  }
};

gf.readJSON = function (text) {
  return eval("("+text+")");
};
