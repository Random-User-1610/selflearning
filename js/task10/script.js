
const products = [
    { id: 1, name: "Briyani", price: 15.99, image: "https://images.unsplash.com/photo-1701579231305-d84d8af9a3fd?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
    { id: 2, name: "Parotta", price: 49.99, image: "https://images.unsplash.com/photo-1668357530437-72a12c660f94?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
    { id: 3, name: "Fried Rice", price: 29.99, image: "https://plus.unsplash.com/premium_photo-1694141252774-c937d97641da?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZnJpZWQlMjByaWNlfGVufDB8fDB8fHww" },
    { id: 4, name: "Crocodile Fry", price: 19.99, image: "https://www.shutterstock.com/image-photo/fried-crocodile-meat-on-barbeque-260nw-468388565.jpg" },
    { id: 5, name: "Fish Fry", price: 12.99, image: "https://images.unsplash.com/photo-1584182711222-2068e7eca683?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8RmlzaCUyMGZyeXxlbnwwfHwwfHx8MA%3D%3D" },
  ];
  
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  
  const productContainer = document.getElementById("products");
  const cartContainer = document.getElementById("cart-items");
  const cartTotal = document.getElementById("cart-total");
  const cartCount = document.getElementById("cart-count");
  const searchInput = document.getElementById("search");
  
  function renderProducts(list) {
    productContainer.innerHTML = "";
    list.forEach((product) => {
      const div = document.createElement("div");
      div.className = "product";
      div.innerHTML = `
        <img src="${product.image}" alt="${product.name}" />
        <h3>${product.name}</h3>
        <p>${product.price.toFixed(2)} ரூ</p>
        <button onclick="addToCart(${product.id})">Add to Cart</button>
      `;
      productContainer.appendChild(div);
    });
  }
  
  function renderCart() {
    cartContainer.innerHTML = "";
    let total = 0;
    cart.forEach((item) => {
      const product = products.find((p) => p.id === item.id);
      total += product.price * item.qty;
      const div = document.createElement("div");
      div.innerHTML = `
        ${product.name} - $${product.price} x 
        <input type="number" value="${item.qty}" min="1" onchange="updateQty(${item.id}, this.value)" />
        <button onclick="removeFromCart(${item.id})">❌</button>
      `;
      cartContainer.appendChild(div);
    });
    cartTotal.textContent = total.toFixed(2);
    cartCount.textContent = cart.reduce((acc, item) => acc + item.qty, 0);
    localStorage.setItem("cart", JSON.stringify(cart));
  }
  
  window.addToCart = (id) => {
    const item = cart.find((p) => p.id === id);
    if (item) {
      item.qty++;
    } else {
      cart.push({ id, qty: 1 });
    }
    renderCart();
  };
  
  window.removeFromCart = (id) => {
    cart = cart.filter((item) => item.id !== id);
    renderCart();
  };
  
  window.clearCart = () => {
    cart = [];
    renderCart();
  };
  
  window.updateQty = (id, qty) => {
    const item = cart.find((p) => p.id === id);
    if (item) {
      item.qty = parseInt(qty);
    }
    renderCart();
  };
  
  searchInput.addEventListener("input", () => {
    const keyword = searchInput.value.toLowerCase();
    const filtered = products.filter((p) => p.name.toLowerCase().includes(keyword));
    renderProducts(filtered);
  });
  
  renderProducts(products);
  renderCart();
  