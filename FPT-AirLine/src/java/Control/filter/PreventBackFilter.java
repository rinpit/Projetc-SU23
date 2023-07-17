//package Control.filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//
//public class PreventBackFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig config) throws ServletException {
//        // Khởi tạo bộ lọc
//    }
//
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//
//        // Kiểm tra xem yêu cầu là POST hay GET
//        if (httpRequest.getMethod().equals("POST")) {
//            // Xóa các thông tin liên quan đến yêu cầu POST từ lịch sử trình duyệt
//            HttpServletResponse httpResponse = (HttpServletResponse) response;
//            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//            httpResponse.setHeader("Pragma", "no-cache");
//            httpResponse.setDateHeader("Expires", 0);
//        }
//
//        // Chuyển tiếp yêu cầu tới filter tiếp theo trong chuỗi
//        chain.doFilter(request, response);
//    }
//
//    public void destroy() {
//        // Hủy bỏ bộ lọc
//    }
//}
