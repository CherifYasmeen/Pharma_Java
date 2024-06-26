package models;

import java.sql.Date;

public class stock {

    private int id, quantite;
    private String nom_produit,type;
    private Float prix ;
    private Date date;
    private int fournisseur_id;
    private String fournisseurEmail;




    public stock() {

    }
    public stock(int id , String nom_produit,int quantite , Date date, String type, Float prix) {
        this.id = id;
        this.quantite = quantite;
        this.nom_produit = nom_produit;
        this.type = type;
        this.date = date;
        this.prix = prix ;
    }

    public stock( String nom_produit, String type, Date date,int quantite , Float prix) {
        this.quantite = quantite;
        this.nom_produit = nom_produit;
        this.type = type;
        this.date = date;
        this.prix = prix ;
    }

    public stock( String nom_produit, String type, Date date , int quantite , Float prix , String fournisseurEmail) {
        this.quantite = quantite;
        this.nom_produit = nom_produit;
        this.type = type;
        this.date = date;
        this.prix = prix ;
        this.fournisseurEmail = fournisseurEmail;
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

    public Float getPrix() {
        return prix;
    }

    public void setPrix(Float prix) {
        this.prix = prix;
    }


    public int getFournisseur_id() {
        return fournisseur_id;
    }

    public void setFournisseur_id(int fournisseur_id) {
        this.fournisseur_id = fournisseur_id;
    }


    public String getFournisseurEmail() {
        return fournisseurEmail;
    }

    public void setFournisseurEmail(String fournisseurEmail) {
        this.fournisseurEmail = fournisseurEmail;
    }

    @Override
    public String toString() {
        return "stock{" +
                "fournisseurEmail='" + fournisseurEmail + '\'' +
                ", date=" + date +
                ", prix=" + prix +
                ", type='" + type + '\'' +
                ", nom_produit='" + nom_produit + '\'' +
                ", quantite=" + quantite +
                '}';
    }
}
