/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Customer extends Account {
    private String cusName;
    private String gender;
    private String birthday;
    private String phone;
    private String email;
    private String address;
    private String nation;
    private String cccd;

    public Customer() {
    }

    public Customer(String cusName, String gender, String birthday, String phone, String email, String address, String nation, String cccd) {
        this.cusName = cusName;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.nation = nation;
        this.cccd = cccd;
    }

    public Customer( String cusName, String phone, String email, String cccd) {
        this.cusName = cusName;
        this.phone = phone;
        this.email = email;
        this.cccd = cccd;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    @Override
    public String toString() {
        return "Customer{" + ", cusName=" + cusName + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address + ", nation=" + nation + ", cccd=" + cccd + '}';
    }
}
