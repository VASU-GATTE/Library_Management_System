package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String status;        // "Available" or "Lent
    private String category;
    private String publisher;
    private int publishedYear;

    // Constructors

    public Book() {
        // No-arg constructor
    }

    public Book(int id, String title, String author, String status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.status = status;
        this.category = category;
        this.publisher = publisher;
        this.publishedYear = publishedYear;

    }

    public Book(int id,String title, String author, String status, String category,
                String publisher, int publishedYear) {
        this.id=id;
    	this.title = title;
        this.author = author;
        this.status = status;
        this.category = category;
        this.publisher = publisher;
        this.publishedYear = publishedYear;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPublishedYear() {
        return publishedYear;
    }

    public void setPublishedYear(int publishedYear) {
        this.publishedYear = publishedYear;
    }
  
}
