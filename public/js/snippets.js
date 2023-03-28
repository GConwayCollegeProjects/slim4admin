console.log(`Value: ${evt.target.value}, text: ${
    document.querySelector(`label[for='${evt.target.id}']`).textContent}`);








const getSelectedValue = document.querySelector( 'input[name="filter"]:checked');   
if(getSelectedValue != null) {   
        templates.innerHTML = getSelectedValue;
}
 else {  
         document.write("Nothing has been selected");  
 }


 let oData = new FormData();
 oData.append('submit', 'submit');
 oData.append('id', 1);
 let oReq = new XMLHttpRequest();

 oReq.onload = function () {
     if (oReq.status === 200 && oReq.readyState === 4) {
        alert("MADE IT")
         templates.innerHTML = oReq.response;
       
     } else {
         templates.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
     }
 }


 oReq.open('POST', '/get-template', true);
 oReq.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
 oReq.send(oData);
 
};



function testTemplates(type) {
 console.log(window.location.pathname);
 templates.style.backgroundColor = 'lightgreen';


 $(document).ready(function(){
    //
         $('.nav-tabs a').on('hide.bs.tab', function(e) {
  
             let origin = e.target.hash;
             let destination = e.relatedTarget.hash;
  
          let valid = true;
          switch(origin) {
              case "#routes":
                  $("ul li").removeClass('active-tab').addClass('disabled-tab');
                  break;
              case "#details":
                  if(destination!=='#routes') {
                      let oRoute = document.getElementById('title');
                      let oDistance = document.getElementById('distance');
                      let oAscent = document.getElementById('ascent');
                      let oGridref = document.getElementById('gridref');
                      if (oRoute.value.length < 5) {
                          valid = false;
                      }
                      if (oDistance.value < 1) {
                          valid = false;
                      }
                      if (oAscent.value < 1) {
                          valid = false;
                      }
  
                      if (oGridref.value.length < 8) {
                          valid = false;
                      }
                  }
                      break;
  
              case "#includes":
                  valid = true;
                  break;
          }
  
          if(valid===false) {
              e.preventDefault();
              document.getElementById('message').innerHTML = "Please complete all entries correctly - there are errors or omissions"
              setTimeout(() => { document.getElementById('message').innerHTML = ""; }, 3000);
          }
          else {
              document.getElementById('message').innerHTML = '';
              if(destination==='#routes') {
                  $("ul li").removeClass('active-tab').addClass('disabled-tab');
  
              }
  
          }
  
  
  
  
      });
  
  
  });
  
