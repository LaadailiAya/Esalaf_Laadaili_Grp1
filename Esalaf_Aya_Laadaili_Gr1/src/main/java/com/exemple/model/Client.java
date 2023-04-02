package com.exemple.model;



public class Client {

        private Long id_client ;

        private String nom ;

        private String prenom;

        private String telepehone ;

    public Client() {
    }

    public Client(Long id_client, String nom,String prenom, String telepehone) {
        this.id_client = id_client;
        this.nom = nom;
        this.prenom = prenom;
        this.telepehone = telepehone;
    }

    public Long getId_client() {
        return id_client;
    }

    public void setId_client(Long id_client) {
        this.id_client = id_client;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom){ this.prenom = prenom; }

    public String getPrenom(){ return prenom;}

    public String getTelepehone() {
        return telepehone;
    }

    public void setTelepehone(String telepehone) {
        this.telepehone = telepehone;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id_client=" + id_client +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", telepehone='" + telepehone + '\'' +
                '}';
    }
}
