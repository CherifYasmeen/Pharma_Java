package models;

import java.sql.Date;

public class stock {

    private int id, quantite;
    private String nom_produit,type;

    public stock() {

    }

    public stock( String nom_produit,int quantite , Date date, String type) {
        this.quantite = quantite;
        this.nom_produit = nom_produit;
        this.type = type;
        this.date = date;
    }

    public stock(int id, int quantite, String nom_produit, String type, Date date) {
        this.id = id;
        this.quantite = quantite;
        this.nom_produit = nom_produit;
        this.type = type;
        this.date = date;
    }

    public stock(int quantite, String nom_produit, String type) {
        this.quantite= quantite;
        this.nom_produit = nom_produit;
        this.type = type;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantite() {
        return quantite;
    }


    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getNom_produit() {
        return nom_produit;
    }

    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private Date date;




    @Override
    public String toString() {
        return "stock{" +
                "id=" + id +
                ", quantite=" + quantite +
                ", nom_produit='" + nom_produit + '\'' +
                ", type='" + type + '\'' +
                ", date=" + date +
                '}';
    }


}
