const templates = document.getElementById('template-list');

window.addEventListener('load', function() {
  fetchTemplates('All');

});



function fetchTemplates(type) {
    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('type', type);
    let oReq = new XMLHttpRequest();

    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
           templates.innerHTML = oReq.response;
          
        } else {
            templates.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };
   
   
    oReq.open("GET", "/test", true);
    oReq.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    oReq.send(oData);

}

function testTemplates(type) {
    console.log(window.location.pathname);
    templates.style.backgroundColor = 'lightgreen';



}