/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Product {
    private int id;
    private String name;
    private int type;
    private ArrayList<Requirement> requirement = new ArrayList<>();
    private String os;
    private String color;
    private double original_price;
    private double current_price;
    private int ram;
    private int memory;
    private String cpu;
    private String graphic_card;
    private double size;
    private String description;
    private double discount;
    private ArrayList<Brand> brands = new ArrayList<>();
    private ArrayList<Vote> votes = new ArrayList<>();
    private ArrayList<Import_History> import_history = new ArrayList<>();
    private int qty;
    private int sold;
    private ArrayList<Image> image = new ArrayList<>();
    private boolean status;

    public double getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(double original_price) {
        this.original_price = original_price;
    }

    public double getCurrent_price() {
        return current_price;
    }

    public void setCurrent_price(double current_price) {
        this.current_price = current_price;
    }

    public ArrayList<Import_History> getImport_history() {
        return import_history;
    }

    public void setImport_history(ArrayList<Import_History> import_history) {
        this.import_history = import_history;
    }
    
    public ArrayList<Vote> getVotes() {
        return votes;
    }

    public void setVotes(ArrayList<Vote> votes) {
        this.votes = votes;
    }

    public ArrayList<Image> getImage() {
        return image;
    }

    public void setImage(ArrayList<Image> image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public ArrayList<Requirement> getRequirement() {
        return requirement;
    }

    public void setRequirement(ArrayList<Requirement> requirement) {
        this.requirement = requirement;
    }

    
    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGraphic_card() {
        return graphic_card;
    }

    public void setGraphic_card(String graphic_card) {
        this.graphic_card = graphic_card;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public ArrayList<Brand> getBrands() {
        return brands;
    }

    public void setBrands(ArrayList<Brand> brands) {
        this.brands = brands;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Product(String name, String color) {
        this.name = name;
        this.color = color;
    }

    public Product() {
    }

    public Product(int id, String name, String color) {
        this.id = id;
        this.name = name;
        this.color = color;
    }
    
    
}
