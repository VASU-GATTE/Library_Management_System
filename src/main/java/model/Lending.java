package model;

import java.sql.Date;

public class Lending {
    private int id;
    private int bookId;
    private int userId;
    private Date lentDate;
    private Date returnDate;

    // Additional helpful fields for joined data (not required in DB)
    private String bookTitle;
    private String userName;

    // Constructors

    public Lending() {
    }

    public Lending(int id, int bookId, int userId, Date lentDate, Date returnDate) {
        this.id = id;
        this.bookId = bookId;
        this.userId = userId;
        this.lentDate = lentDate;
        this.returnDate = returnDate;
    }

    public Lending(int bookId, int userId, Date lentDate, Date returnDate) {
        this.bookId = bookId;
        this.userId = userId;
        this.lentDate = lentDate;
        this.returnDate = returnDate;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getLentDate() {
        return lentDate;
    }

    public void setLentDate(Date lentDate) {
        this.lentDate = lentDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
