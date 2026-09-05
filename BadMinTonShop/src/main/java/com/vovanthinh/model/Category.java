package com.vovanthinh.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Category")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cate_id")
    private int cateId;

    @Column(name = "cate_name", nullable = false, unique = true, length = 100)
    private String cateName;

    @Column(name = "icons", length = 255)
    private String icons;

    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    public Category() {}
    public int getCateId() { return cateId; }
    public void setCateId(int cateId) { this.cateId = cateId; }
    public String getCateName() { return cateName; }
    public void setCateName(String cateName) { this.cateName = cateName; }
    public String getIcons() { return icons; }
    public void setIcons(String icons) { this.icons = icons; }
    public List<Product> getProducts() { return products; }
    public void setProducts(List<Product> products) { this.products = products; }
}
