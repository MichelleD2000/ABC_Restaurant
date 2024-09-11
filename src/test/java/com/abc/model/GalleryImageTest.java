package com.abc.model;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class GalleryImageTest {

    private GalleryImage galleryImage;

    @BeforeEach
    public void setUp() {
        // Initialize the GalleryImage object before each test
        galleryImage = new GalleryImage(1, "Beautiful Sunset", "A stunning sunset over the mountains", "sunset.jpg");
    }

    @Test
    public void testGetId() {
        assertEquals(1, galleryImage.getId());
    }

    @Test
    public void testSetId() {
        galleryImage.setId(2);
        assertEquals(2, galleryImage.getId());
    }

    @Test
    public void testGetTitle() {
        assertEquals("Beautiful Sunset", galleryImage.getTitle());
    }

    @Test
    public void testSetTitle() {
        galleryImage.setTitle("Ocean View");
        assertEquals("Ocean View", galleryImage.getTitle());
    }

    @Test
    public void testGetDescription() {
        assertEquals("A stunning sunset over the mountains", galleryImage.getDescription());
    }

    @Test
    public void testSetDescription() {
        galleryImage.setDescription("A beautiful view of the ocean");
        assertEquals("A beautiful view of the ocean", galleryImage.getDescription());
    }

    @Test
    public void testGetImageUrl() {
        assertEquals("sunset.jpg", galleryImage.getImageUrl());
    }

    @Test
    public void testSetImageUrl() {
        galleryImage.setImageUrl("ocean_view.jpg");
        assertEquals("ocean_view.jpg", galleryImage.getImageUrl());
    }
}
