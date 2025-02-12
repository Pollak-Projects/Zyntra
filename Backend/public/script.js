document.addEventListener("DOMContentLoaded", function() {
    // Dinamikusan töltsük be a kategóriákat
    fetch('/api/categories')
        .then(response => response.json())
        .then(categories => {
            const categoriesContainer = document.querySelector('.categories');
            categories.forEach(category => {
                const categoryElement = document.createElement('div');
                categoryElement.classList.add('category');
                categoryElement.textContent = category.name; // Kategória neve
                categoriesContainer.appendChild(categoryElement);
            });
        })
        .catch(error => console.error('Error fetching categories:', error));

    // Dinamikusan töltsük be a véleményeket
    fetch('/api/reviews')
        .then(response => response.json())
        .then(reviews => {
            console.log(reviews); // Nézd meg, hogy mit kapsz vissza
            const reviewsContainer = document.querySelector('.reviews');
            reviews.forEach(review => {
                const reviewElement = document.createElement('div');
                reviewElement.classList.add('review');

                const userInfo = document.createElement('div');
                userInfo.classList.add('user-info');
                userInfo.innerHTML = `<span><img src="${review.user_avatar}" class="avatar"></span> <span>${review.user_name}</span>`;



                const imageElement = document.createElement('div');
                imageElement.classList.add('image');


                const commentElement = document.createElement('div');
                commentElement.textContent = review.comment || 'No comment'; // Ha van hozzászólás, azt is megjelenítjük
                commentElement.innerHTML = `<span style="font-weight: bold; font-size: 20px">${review.business_name}</span> <br><br> <span class="rating">${review.rating}/5</span> <br><br> <span class="comment">${review.comment}</span> <br><br> <span class="time">${new Date(review.created_at).toLocaleString()}</span>`;



                reviewElement.appendChild(userInfo);
                reviewElement.appendChild(imageElement);
                reviewElement.appendChild(commentElement);
                reviewsContainer.appendChild(reviewElement);
            });
        })
        .catch(error => console.error('Error fetching reviews:', error));

    // Menü funkciók
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
