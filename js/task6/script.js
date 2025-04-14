const list = document.querySelector(".container"); 
const items = document.querySelectorAll(".item"); 

items.forEach((item)=>{
    item.addEventListener("dragstart",()=>{
        item.classList.add("dragging")
    })
    item.addEventListener("dragend",()=>{
        item.classList.remove("dragging")
    })
})

list.addEventListener("dragover",(e)=>{
    e.preventDefault();

    const otherItems = [...list.querySelectorAll(".item:not(.dragging)")];
    const draggingItem = list.querySelector(".dragging");

    let reorderingItem = otherItems.find(hoveringItem =>{
        console.log(hoveringItem);

        //  It is the Y axis position of item's middle relative to nearest positioned ancestor (hoveringItem.offsetTop + hoveringItem.offsetHeight / 2)
        // Here these items don't have nearest ancestor so it will take body as ancestor and work relative to it.
        // It is the Y axis position of mouse realtive to viewport (e.clientY)
        // That means Comparing two Y axis position if mouse's is greater than items's it will return that item.

        return e.clientY <= hoveringItem.offsetTop + hoveringItem.offsetHeight / 2;
    });
    console.log(reorderingItem);
    
    // update the dom to reflect new order
    list.insertBefore(draggingItem,reorderingItem);
})

// dragenter runs when the dragged item enters another item.
list.addEventListener("dragenter",(e)=> e.preventDefault()); 