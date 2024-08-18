package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.abc.model.Product;
import com.abc.service.ProductService;

@WebServlet("/product")
@MultipartConfig
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                listProducts(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteProduct(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action.equals("add")) {
                addProduct(request, response);
            } else if (action.equals("update")) {
                updateProduct(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = productService.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("WEB-INF/view/listProducts.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addProduct.jsp").forward(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");  // Retrieve category from request parameters

        Part imagePart = request.getPart("image");
        String imageUrl = saveImage(imagePart);

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setCategory(category);  // Now, category is correctly set
        product.setImageUrl(imageUrl);

        productService.addProduct(product);
        response.sendRedirect("product?action=list");
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productService.getProductById(productId);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("WEB-INF/view/editProduct.jsp").forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");  // Retrieve category from request parameters
        String description = request.getParameter("description");

        Part imagePart = request.getPart("image");
        String imageUrl = saveImage(imagePart);

        Product product = new Product(productId, name, description, category, price, imageUrl);
        productService.updateProduct(product);
        response.sendRedirect("product?action=list");
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(productId);
        response.sendRedirect("product?action=list");
    }

    private String saveImage(Part imagePart) throws IOException {
        if (imagePart == null || imagePart.getSize() == 0) {
            return null;
        }
        String fileName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + "images" + java.io.File.separator + fileName;
        imagePart.write(uploadPath);
        return "images/" + fileName;
    }
}
