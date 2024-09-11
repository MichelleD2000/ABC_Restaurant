package com.abc.model;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.util.List;

public class CartTest {

    private Cart cart;
    private Product product1;
    private Product product2;

    @BeforeEach
    public void setUp() {
        cart = new Cart();

        // Initializing products
        product1 = new Product(1, "Cocktail Mix", "A refreshing blend of vodka", "Beverage", 12.99, "images/cocktail.jpg");
        product2 = new Product(2, "Margarita", "A classic margarita", "Cocktail", 9.99, "images/margarita.jpg");
    }

    @Test
    public void testAddItem() {
        cart.addItem(product1, 2); // Add 2 units of product1
        List<CartItem> items = cart.getItems();
        
        assertEquals(1, items.size());
        assertEquals(2, items.get(0).getQuantity());
        assertEquals(product1, items.get(0).getProduct());
    }

    @Test
    public void testAddItemSameProduct() {
        cart.addItem(product1, 2); // Add 2 units of product1
        cart.addItem(product1, 3); // Add 3 more units of product1

        List<CartItem> items = cart.getItems();
        
        assertEquals(1, items.size()); // Only one product should exist in the cart
        assertEquals(5, items.get(0).getQuantity()); // Quantity should be 5
    }

    @Test
    public void testRemoveItem() {
        cart.addItem(product1, 2);
        cart.addItem(product2, 1);
        
        cart.removeItem(product1.getProductId()); // Remove product1
        
        List<CartItem> items = cart.getItems();
        
        assertEquals(1, items.size());
        assertEquals(product2, items.get(0).getProduct()); // Only product2 should remain
    }

    @Test
    public void testUpdateItem() {
        cart.addItem(product1, 2);
        cart.updateItem(product1.getProductId(), 5); // Update quantity to 5
        
        CartItem updatedItem = cart.getItems().get(0);
        assertEquals(5, updatedItem.getQuantity()); // Quantity should be updated
    }

    @Test
    public void testUpdateItemToRemove() {
        cart.addItem(product1, 2);
        cart.updateItem(product1.getProductId(), 0); // Update quantity to 0 (remove)
        
        assertEquals(0, cart.getItems().size()); // Cart should be empty
    }

    @Test
    public void testGetTotal() {
        cart.addItem(product1, 2); // Add 2 units of product1
        cart.addItem(product2, 3); // Add 3 units of product2
        
        double expectedTotal = (2 * product1.getPrice()) + (3 * product2.getPrice());
        assertEquals(expectedTotal, cart.getTotal(), 0.01); // Test total with precision
    }

    @Test
    public void testClearCart() {
        cart.addItem(product1, 2);
        cart.addItem(product2, 1);
        
        cart.clear(); // Clear the cart
        
        assertEquals(0, cart.getItems().size()); // Cart should be empty
    }
}

