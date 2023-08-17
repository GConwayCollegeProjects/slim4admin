
const templates = document.getElementById('template-list');
let globalCurrent = 'general';



document.addEventListener("click", evt => {
    if (evt.target.type === "radio" && evt.target.name === "filter") {
      document.getElementById('search').value = "";
      fetchTemplates('type', evt.target.id);
    }
  });

  document.getElementById("search").addEventListener("change", function() {

    fetchTemplates('search', this.value);

  });


  
function getTemplate(event) {
    event.preventDefault()
    showTab('#details');
   
}

function newTemplate() {
    const templatesRight = document.getElementById('templates-right');
    templatesRight.innerHTML = 
    '<Form>'+
    '<label>Select Template Type:</label><br>'+
    '<select name="type" id="input-type">'+
    '<option value="meals">Meals</option>'+
    '<option value="social">Social</option>'+
    '<option value="walks">Walks</option>'+
    '<option value="weekends">Weekends</option>'+
    '</select>'+
    '<br>'+
    '<label>Enter Template Name:</label><br>'+
    '<input type="text" id="input-name" size=40></input><br><br>'+
    '<button id="template-button" type="button" value="submit" onclick="openTemplate(name, type.value)">SUBMIT</button>'+
    '</Form>';

}

function openTemplate() {
  const templateName = document.getElementById('input-name');
  const templateType = document.getElementById('input-type');
  const name = templateName.value;
  const type = templateType.value;

  
  if(type !=="walks"){
          if (globalCurrent === 'walks') {
            document.getElementById("details").id = 'walk-details';
            document.getElementById("includes").id = 'walk-includes';
            document.getElementById("general-details").id = 'details';
            document.getElementById("general-includes").id = 'includes';
          }
          globalCurrent ='general';
          showTab('#details');
          }
  else{
          if (globalCurrent !== 'walks') {
            document.getElementById("details").id = 'general-details';
            document.getElementById("includes").id = 'general-includes';
            document.getElementById("walk-details").id = 'details';
            document.getElementById("walk-includes").id = 'includes';
          }

            globalCurrent ='walks';
            
            showTab('#details');
  }    
    
}

function fetchTemplates(source, value) {
  console.log (location.hostname)
  if(location.hostname !== "localhost")
  {
  let url = '/website/public/template-list';
  let oData = new FormData();
  oData.append('submit', 'submit');
  oData.append('source', source);
  oData.append('value', value);
  fetch(url, {
    "method": "POST",
    "body": oData,
   })
.then((response) => response.text())
    .then((text) => {
    templates.innerHTML = text;
  });
  }
  else {
    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('source', source);
    oData.append('value', value);
    let oReq = new XMLHttpRequest();
   
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            
            templates.innerHTML = oReq.response;
          
        } else {
            templates.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };
   
    //const url = window.location.href+'/template-list'
    const origin = location.origin;
    console.log (origin);
    url = origin + '/template-list';
    console.log(url);
    oReq.open("POST", url , true);
    oReq.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    oReq.send(oData);
   
  }
}




