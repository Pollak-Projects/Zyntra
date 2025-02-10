document.addEventListener("DOMContentLoaded", function() {
    const menuIcon = document.querySelector(".menu-icon");
    const menu = document.createElement("div");
    menu.classList.add("hamburger-menu");
    menu.innerHTML = `
        <div class="menu-header">
            <span class="close-menu">&times;</span>
        </div>
        <ul>
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In</a></li>
            <li><a href="#">Nearby</a></li>
            <li><a href="#">Start a Project</a></li>
            <li><a href="#">Add a Business on Zyntra</a></li>
        </ul>
        <div class="menu-footer">
            <span>Ad Choices</span>
            <span>Support</span>
        </div>
    `;
    document.body.appendChild(menu);
    
    menuIcon.addEventListener("click", function() {
        menu.classList.add("active");
    });
    
    document.querySelector(".close-menu").addEventListener("click", function() {
        menu.classList.remove("active");
    });
    
    document.addEventListener("click", function(event) {
        if (!menu.contains(event.target) && !menuIcon.contains(event.target)) {
            menu.classList.remove("active");
        }
    });
});
