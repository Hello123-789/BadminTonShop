<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Web Footer Component -->
<footer class="bg-dark text-white pt-4 pb-3 mt-auto border-top border-secondary">
    <div class="container">
        <div class="row mb-4">
            <!-- Col 1: Shop Info -->
            <div class="col-md-3 mb-3">
                <h5 class="text-warning fw-bold"><i class="bi bi-trophy-fill me-2"></i>Badminton Shop</h5>
                <p class="text-muted small">Cửa hàng chuyên cung cấp vợt cầu lông chính hãng Yonex, Lining, Victor, Mizuno uy tín chất lượng cao.</p>
            </div>
            
            <!-- Col 2: Athlete Showcase (Vận Động Viên Nổi Tiếng) -->
            <div class="col-md-5 mb-3">
                <h6 class="text-uppercase fw-bold text-warning mb-3">
                    <i class="bi bi-star-fill me-2"></i>Vận Động Viên Đại Diện
                </h6>
                <div class="d-flex flex-wrap gap-3">
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/axelsen.jpg" 
                             alt="Viktor Axelsen" class="img-fluid rounded mb-1" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-light" style="font-size: 11px; font-weight: 600;">Axelsen</div>
                        <div class="text-warning" style="font-size: 10px;">Yonex</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/lee-zii-jia.jpg" 
                             alt="Lee Zii Jia" class="img-fluid rounded mb-1" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-light" style="font-size: 11px; font-weight: 600;">Lee Zii Jia</div>
                        <div class="text-warning" style="font-size: 10px;">Victor</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/an-se-young.jpg" 
                             alt="An Se-young" class="img-fluid rounded mb-1" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-light" style="font-size: 11px; font-weight: 600;">An Se-young</div>
                        <div class="text-warning" style="font-size: 10px;">Yonex</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/shi-yu-qi.jpg" 
                             alt="Shi Yu Qi" class="img-fluid rounded mb-1" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-light" style="font-size: 11px; font-weight: 600;">Shi Yu Qi</div>
                        <div class="text-warning" style="font-size: 10px;">Lining</div>
                    </div>
                </div>
            </div>
            
            <!-- Col 3: Contact Info -->
            <div class="col-md-4 mb-3">
                <h6 class="text-uppercase fw-bold text-light mb-3">Liên hệ</h6>
                <ul class="list-unstyled text-muted small">
                    <li><i class="bi bi-geo-alt-fill me-2 text-warning"></i>Địa chỉ: TP. Hồ Chí Minh</li>
                    <li><i class="bi bi-telephone-fill me-2 text-warning"></i>Hotline: 0900 123 456</li>
                    <li><i class="bi bi-envelope-fill me-2 text-warning"></i>Email: contact@badmintonshop.com</li>
                </ul>
            </div>
        </div>
        <hr class="bg-secondary">
        <div class="text-center text-muted small">
            &copy; 2026 Badminton Shop. All rights reserved. Built with Servlet & SiteMesh 3.
        </div>
    </div>
</footer>
