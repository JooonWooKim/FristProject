let id = $ ('#id');
let pw = $ ('#pw');
let btn = $ ('#btn');

$(btn).on('click', function()
{
    if($(id).val() == ""){
        $(id).next('label').addClass('warning');
        seeTimeout(function(){
            $('label').removeClass('warning');
        },1500);

    }
    else if($(pw).val() == ""){
        $(pw).next('label').addClass('warning');
    }
});

// login
function check(form)
{
    if(form.id.value == "joon")
    {
        if(form.pw.value == "1234"){
            window.open('firstproject.html')
        }
        else
        {
        alert("Error password");
        }
    }
    else
    {
        alert("Error ID");
    }
}

const dropArea = document.getElementById("drop-file");

function highlight(e) {
  preventDefaults(e);
  dropArea.classList.add("highlight");
}

