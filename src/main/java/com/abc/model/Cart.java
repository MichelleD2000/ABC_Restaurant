package com.abc.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    // Add a product to the cart
    public void addItem(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getProductId() == product.getProductId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        items.add(new CartItem(product, quantity));
    }

    // Remove a product from the cart
    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct().getProductId() == productId);
    }

    // Update the quantity of a product in the cart
    public void updateItem(int productId, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getProductId() == productId) {
                if (quantity <= 0) {
                    removeItem(productId);
                } else {
                    item.setQuantity(quantity);
                }
                break;
            }
        }
    }

    // Get all items in the cart
    public List<CartItem> getItems() {
        return items;
    }

    // Calculate the total price of the cart
    public double getTotal() {
        double total = 0.0;
        for (CartItem item : items) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        return total;
    }

    // Clear the cart
    public void clear() {
        items.clear();
    }
}
