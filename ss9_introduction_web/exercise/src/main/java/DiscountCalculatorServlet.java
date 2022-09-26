import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

@WebServlet(name = "DiscountCalculatorServlet", value = "/convert")
public class DiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            double price= Double.parseDouble(request.getParameter("price"));
            BigDecimal listPrice = new BigDecimal(price);
            double discountPercent = Double.parseDouble(request.getParameter("discount"));

            BigDecimal discountAmount = new BigDecimal(price * discountPercent * 0.01);
            BigDecimal discountPrice = listPrice.subtract(discountAmount);
            String description = request.getParameter("text");

            request.setAttribute("description", description);
            request.setAttribute("listPrice", listPrice);
            request.setAttribute("discountPercent", discountPercent);
            request.setAttribute("discountAmount", discountAmount);
            request.setAttribute("discountPrice", discountPrice);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
