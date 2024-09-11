package com.abc.model;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ProductTest {

    private Product product;

    @BeforeEach
    public void setUp() {
        // Initialize the product object before each test
        product = new Product(1, "Cocktail Mix", "A refreshing blend of vodka", "Beverage", 12.99, "images/cocktail.jpg");
    }

    @Test
    public void testConstructor() {
        // Test the constructor with parameters
        assertEquals(1, product.getProductId());
        assertEquals("Cocktail Mix", product.getName());
        assertEquals("A refreshing blend of vodka", product.getDescription());
        assertEquals("Beverage", product.getCategory());
        assertEquals(12.99, product.getPrice());
        assertEquals("images/cocktail.jpg", product.getImageUrl());
    }

    @Test
    public void testSettersAndGetters() {
        // Test setting and getting values
        product.setProductId(2);
        product.setName("Margarita");
        product.setDescription("A classic margarita");
        product.setCategory("Cocktail");
        product.setPrice(9.99);
        product.setImageUrl("images/margarita.jpg");

        assertEquals(2, product.getProductId());
        assertEquals("Margarita", product.getName());
        assertEquals("A classic margarita", product.getDescription());
        assertEquals("Cocktail", product.getCategory());
        assertEquals(9.99, product.getPrice());
        assertEquals("images/margarita.jpg", product.getImageUrl());
    }
}
