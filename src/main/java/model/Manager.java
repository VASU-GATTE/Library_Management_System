package model;

public class Manager {
    private String name;
    private String password;

    // Constructors

    public Manager() {
    }

//    public Manager(String name, String password) {
////        this.id = id;
//        this.name = name;
//        this.password = password;
//    }

    public Manager(String name, String password) {
        this.name = name;
        this.password = password;
    }

    // Getters and Setters

//    public int getId() {
//        return id;
//    }

//    public void setId(int id) {
//        this.id = id;
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//	public void setEmail(String email) {
//		this.setEmail(email);
//	}
}
