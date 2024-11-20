<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .banner {
        position: relative;
        overflow: hidden;
        height: 500px; /* Set the desired height for the banner */
    }

    .banner-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    .banner-image.active {
        opacity: 1;
    }
    .logo{
        width: 80px;
        border-radius: 30%; 
    }
</style>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark" style="background-color:black">
    <div class="container">
        <a class="navbar-brand" href="HomeController"><img class="logo" src="https://helios.vn/cdn/shop/files/logo_500x.png?v=1652960279" alt="Sneaker"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Manager Account</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="ManagerController">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="LoginController">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number" name="action" value="Search">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                    <a class="btn btn-sm ml-3" href="ViewWish" style = "background-color: rgb(250, 179, 32);color: #B57335;">
                        <i class="fa fa-heart" aria-hidden="true"></i>                   
                    </a>
                    <a class="btn btn-sm ml-3" href="ViewCart" style = "background-color: rgb(250, 179, 32);color: white;">
                        <i class="fa-solid fa-store"></i>　Cart
                        <span class="badge badge-light" id="cartItemCount">0</span>
                    </a>

<!--                <button class="btn btn-success btn-sm ml-3" type="submit" name="action" value="View">
                    <i class="fa fa-shopping-cart"></i>Cart
                    <span class="badge badge-light">3</span>
                </button>-->
            </form>
        </div>
    </div>
</nav>

<div class="banner">
    <img class="banner-image active" src="https://scontent.fsgn2-9.fna.fbcdn.net/v/t39.30808-6/429531873_372629832291256_4397950180372741688_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=cERSuvwQuMEQ7kNvgEgPAO4&_nc_ht=scontent.fsgn2-9.fna&oh=00_AYBxsmWs2Sg9dgV1b9dvfAyVw04OIYTPmEPdrYoW_GVRKQ&oe=668216BB" alt="Banner Image 1">
    <img class="banner-image" src="https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/412930024_331978789689694_7038931285001225027_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=86c6b0&_nc_ohc=53g_0N_e8WgQ7kNvgHVn_KX&_nc_ht=scontent.fsgn2-7.fna&oh=00_AYCAkV_Z9qnoxBfG8caplgcd4bBOWbHiF9v0wZIYvCdLSg&oe=66821153" alt="Image 2">
    <img class="banner-image" src="https://scontent.fsgn2-10.fna.fbcdn.net/v/t39.30808-6/371317907_266147916272782_8211219164070973799_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=127cfc&_nc_ohc=JDU7OIisYgkQ7kNvgG00UQ5&_nc_ht=scontent.fsgn2-10.fna&oh=00_AYAVC5ttq-7pd-eG5iR5ABACtgYIF0wxnQYPMza8GU3rOw&oe=66822FA9" alt="Image 3">
</div>
<script>
    const images = document.querySelectorAll('.banner-image');
    let currentImageIndex = 0;

    function showNextImage() {
        images[currentImageIndex].classList.remove('active');
        currentImageIndex = (currentImageIndex + 1) % images.length;
        images[currentImageIndex].classList.add('active');
    }

    setInterval(showNextImage, 3000);</script>

<script>
            // Lấy số lượng sản phẩm từ localStorage (nếu đã lưu)
            var cartItemCount = localStorage.getItem("cartItemCount");

            // Cập nhật thẻ <span> với số lượng sản phẩm
            document.getElementById("cartItemCount").textContent = cartItemCount || "0";
</script>

<!--end of menu-->
