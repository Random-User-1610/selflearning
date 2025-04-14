function loadContent(){
    if(!location.hash){
        location.hash = "home";
    }

    const hash = location.hash.substring(1);

    document.querySelectorAll(".content").forEach(item =>{

        item.style.display = "none";
        console.log(item.id);

        if(item.id == hash ){
            // console.log(item);
            item.style.display = "block";
        }
    })
}


// console.log(location);

// window.onhashchange = loadContent(); 
window.addEventListener("hashchange",loadContent);
window.addEventListener("load",loadContent);