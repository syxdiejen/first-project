/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 84868
 */
@WebServlet(name = "ViewCart", urlPatterns = {"/ViewCart"})
public class ViewCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Retrieve cart information from cookies
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(); // Lấy hoặc tạo một session mới
        List<Product> list = new ArrayList<>();
        DAO dao = new DAO();

        String txt = (String) session.getAttribute("id"); // Lấy giá trị từ session với key "id"

        if (txt != null) {
            String[] ids = txt.split(",");
            for (String id : ids) {
                list.add(dao.getProductByID(id));
            }
        }

        
        for (int i = 0; i < list.size(); i++) {
            Product product = list.get(i);
            if (product != null) {
                int count = 1;
                for (int j = i + 1; j < list.size(); j++) {
                    Product otherProduct = list.get(j);
                    if (otherProduct != null && product.getId() == otherProduct.getId()) {
                        count++;
                        list.set(j, null);
                    }
                }
                product.setQuantity(count);
            }
        }

        // Remove null entries from the list
        list.removeIf(product -> product == null);

        
//        for (int i = 0; i < list.size(); i++) {
//            int count = 1;
//            for (int j = i + 1; j < list.size(); j++) {
//                if (list.get(i).getId() == list.get(j).getId()) {
//                    count++;
//                    list.remove(j);
//                    j--;
//                    list.get(i).setQuantity(count);
//                }
//            }
//        }
        
        
//        for (int i = 0; i < list.size(); i++) {
//            int count = 1;
//            for (int j = i + 1; j < list.size(); j++) {
//                if (list.get(i).getId() == list.get(j).getId()) {
//                    count++;
//                    list.remove(j);
//                    j--;
//                }
//            }
//            list.get(i).setQuantity(count); // Set the quantity for the non-null item
//        }

        double total = 0;
        for (Product o : list) {
            total += o.getQuantity() * o.getPrice();
        }

        // Pass cart items to the JSP for rendering
        request.setAttribute("list", list);
        request.setAttribute("total", total);
        request.setAttribute("vat", 0.1 * total);
        request.setAttribute("sum", 1.1 * total);

        request.getRequestDispatcher("Cart.jsp").forward(request, response);
    }
    
    

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");

        if (productId != null) {
            String cartSession = (String) session.getAttribute("id");
            if (cartSession != null) {
                // Remove the productId from the cart
                String[] ids = cartSession.split(",");
                String updatedCart = "";
                for (String id : ids) {
                    if (!id.equals(productId)) {
                        if (!updatedCart.isEmpty()) {
                            updatedCart += ",";
                        }
                        updatedCart += id;
                    }
                }
                session.setAttribute("id", updatedCart);
            }
        }
        // Redirect back to the cart page
        response.sendRedirect(request.getContextPath() + "/ViewCart");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
