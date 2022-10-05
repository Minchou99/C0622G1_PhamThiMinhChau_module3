import java.security.NoSuchAlgorithmException;

import static java.lang.Math.pow;

public class Calculator {

    public static void main(String[] args) {
    }

    public static void quadraticEquation(double a, double b, double c) {
        if (denta(a, b, c) < 0) {
            System.out.println("Phương trình vô nghiệm");
        } else if (denta(a, b, c) == 0) {
            System.out.println("Phương trình có nghiệm kép là: " + doubleRoot(a,b) );
        } else {
            System.out.println("Phương trình có hai nghiệm lần lượt là:" + "\n" + "Nghiệm thứ nhất: " + rootOne(a,b,denta(a,b,c)) + "Nghiệm thứ hai: " + rootTwo(a,b,denta(a,b,c)) );
        }
    }

    public static double denta(double a, double b, double c) {
        return (Math.pow(b, 2) - 4 * a * c);
    }

    public static double doubleRoot(double a, double b) {
        return (-b / (2 * a));
    }

    public static double rootOne(double a, double b, double denta) {
        return ((-b + Math.sqrt(denta)) / 2 * a);
    }

    public static double rootTwo(double a, double b, double denta) {
        return ((-b - Math.sqrt(denta)) / 2 * a);
    }
}
