
function insertAfter(el,ref) {
    ref.parentNode.insertBefore(el,ref.nextSibling);
}

function text(s) { return document.createTextNode(s); }

function node(tag,as,ds) {
    var n=attr(as,document.createElement(tag));
    if(ds) for(var i in ds) n.appendChild(ds[i]);
    return n;
}

function attr(as,n) {
    for(var a in as) n.setAttribute(a,as[a]);
    return n
}

function uploadFileTo(file) {
    var files=browse.files
    if(files.length==1) {
        var reader=new FileReader()
        reader.readAsText(files[0])
        reader.onload=function() { file.value=reader.result }
    }
}

function postForm(form,callback) {
    var fd=new FormData(form)
    var http=new XMLHttpRequest()
    http.onload=function() { callback(http.responseText) }
    http.open("POST",form.action)
    http.send(fd)
    return false
}

// Create a Save button
// as described at https://stackoverflow.com/a/30832210
function saveButton(text,filename,type) {
    var saveBtn=node("input",{type:"button",value:"Save"})
    saveBtn.onclick=function() {
	var file=new Blob([text],{type:type})
	var a=node("a")
	var url=URL.createObjectURL(file)
	a.href=url
	a.download=filename
	document.body.appendChild(a)
	a.click()
	setTimeout(function(){
	    document.body.removeChild(a)
	    URL.revokeObjectURL(url)
	},0)
    }
    return saveBtn
}
