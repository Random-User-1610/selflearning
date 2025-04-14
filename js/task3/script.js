
var Modal = document.getElementById("modal");
var modalImage = document.getElementById("modal-img");
let imgNum= 0;

function openModal(n){
    Modal.style.visibility = "visible";
    Modal.style.opacity = 1;
    modalImage.src = `assets/s${n}.jpg`; 
    imgNum = n;
}

function next(){
   imgNum++;
   if(imgNum == 5){
       imgNum = 1;
   }
   modalImage.src = `assets/s${imgNum}.jpg`;
}

function prev(){
   imgNum--;
   if(imgNum == 0){
       imgNum = 4;
   }
   modalImage.src = `assets/s${imgNum}.jpg`;
}


console.log(document.querySelectorAll(".open")); 

let openButtons = document.querySelectorAll(".open");

openButtons.forEach((button,index)=>{
    button.addEventListener("click",()=>openModal(index+1)); // index is starting from 0 so added +1
})

//click close button from modal
document.getElementById("close").addEventListener("click",()=>closeModal());

//click next button from modal
document.getElementById("next").addEventListener("click",()=>next());

//click prev button from modal
document.getElementById("prev").addEventListener("click",()=>prev());