import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculatorServlet", value = "/convert")
public class DiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        double amount = price * discount * 0.01 ;
        double payment = price - amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>List Price: " + price + "</h1>");
        writer.println("<h1>Discount: " + discount + "</h1>");
        writer.println("<h1>Discounted: " + amount + "</h1>");
        writer.println("<h1>Payment: " + payment + "</h1>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
