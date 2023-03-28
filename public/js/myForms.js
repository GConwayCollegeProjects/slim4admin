

function showTab(tab){
    $("ul li").removeClass('disabled-tab').addClass('active-tab');
    $('.nav-tabs a[href="' + tab + '"]').tab('show');





}





function updateRightBox(x, y)
{
    console.log(y)

    let oRightBox = document.getElementById('routehome');

    oRightBox.innerHTML = "<h2 id='right_head' class='text-center'><strong>Text</strong> select / add</h2>\n"+

        "<div id='rightbox' style='max-height: 70%; max-width 70%; background-color: white;" +
        "font-size: x-small; overflow: auto; padding: 0 .5em; text-overflow: clip' ></div>"

    let oOutput = document.getElementById("rightbox");

    //oOutput.innerHTML = "";
    let oData = new FormData();
    oData.append('id', x);
    oData.append('type', y);
    let oReq = new XMLHttpRequest();
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            oOutput.innerHTML = oReq.response;
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred . <br>";
        }
    };

    oReq.open("POST", "../app/helpers/includeHelper.php", true);
    oReq.send(oData);

}



