<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Web Footer Component -->
<footer class="bg-dark text-white pt-4 pb-3 mt-auto border-top border-secondary">
    <div class="container">
        <div class="row mb-4">
            <!-- Col 1: Shop Info -->
            <div class="col-md-3 mb-3">
                <h5 class="text-warning fw-bold"><i class="bi bi-trophy-fill me-2"></i>Badminton Shop</h5>
                <p class="text-light small">Cửa hàng chuyên cung cấp vợt cầu lông chính hãng Yonex, Lining, Victor, Mizuno uy tín chất lượng cao.</p>
            </div>
            
            <!-- Col 2: Athlete Showcase (Vận Động Viên Nổi Tiếng) -->
            <div class="col-md-5 mb-3">
                <h6 class="text-uppercase fw-bold text-warning mb-3">
                    <i class="bi bi-star-fill me-2"></i>Vận Động Viên Đại Diện
                </h6>
                <div class="d-flex flex-wrap gap-3">
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/axelsen.jpg" 
                             alt="Viktor Axelsen" class="img-fluid rounded mb-1 shadow-sm" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-white fw-bold" style="font-size: 12px;">Axelsen</div>
                        <div class="text-warning" style="font-size: 11px;">Yonex</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/lee-zii-jia.jpg" 
                             alt="Lee Zii Jia" class="img-fluid rounded mb-1 shadow-sm" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-white fw-bold" style="font-size: 12px;">Lee Zii Jia</div>
                        <div class="text-warning" style="font-size: 11px;">Victor</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/an-se-young.jpg" 
                             alt="An Se-young" class="img-fluid rounded mb-1 shadow-sm" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-white fw-bold" style="font-size: 12px;">An Se-young</div>
                        <div class="text-warning" style="font-size: 11px;">Yonex</div>
                    </div>
                    <div class="text-center" style="width: 80px;">
                        <img src="${pageContext.request.contextPath}/images/athletes/shi-yu-qi.jpg" 
                             alt="Shi Yu Qi" class="img-fluid rounded mb-1 shadow-sm" style="height: 85px; width: 75px; object-fit: cover;">
                        <div class="text-white fw-bold" style="font-size: 12px;">Shi Yu Qi</div>
                        <div class="text-warning" style="font-size: 11px;">Lining</div>
                    </div>
                </div>
            </div>
            
            <!-- Col 3: Contact Info -->
            <div class="col-md-4 mb-3">
                <h6 class="text-uppercase fw-bold text-warning mb-3">Liên hệ</h6>
                <ul class="list-unstyled text-light small lh-lg">
                    <li><i class="bi bi-geo-alt-fill me-2 text-warning"></i><strong class="text-white">Địa chỉ:</strong> Tăng Nhơn Phú A, TP. Thủ Đức, TP.HCM</li>
                    <li><i class="bi bi-telephone-fill me-2 text-warning"></i><strong class="text-white">Hotline:</strong> 0123456789</li>
                    <li><i class="bi bi-envelope-fill me-2 text-warning"></i><strong class="text-white">Email:</strong> votchinhhang@gmail.com</li>
                </ul>
            </div>
        </div>
        <hr class="border-secondary">
        <div class="text-center text-light opacity-75 small">
            &copy; 2026 Badminton Shop. All rights reserved. Built with Servlet & SiteMesh 3.
        </div>
    </div>
</footer>
