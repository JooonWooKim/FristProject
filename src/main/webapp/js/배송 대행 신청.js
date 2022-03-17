function unhighlight(e) {
    preventDefaults(e);
    dropArea.classList.remove("highlight");
  }
  
  dropArea.addEventListener("dragenter", highlight, false);
  dropArea.addEventListener("dragover", highlight, false);
  dropArea.addEventListener("dragleave", unhighlight, false);
  
  function handleDrop(e) {
      unhighlight(e);
      let dt = e.dataTransfer;
      let files = dt.files;
    
      console.log(files);
  }
  
  function renderFile(file) 
  {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = function () 
    {
      let img = dropArea.getElementsByClassName("preview")[0];
      img.src = reader.result;
      img.style.display = "block";
    };
  }