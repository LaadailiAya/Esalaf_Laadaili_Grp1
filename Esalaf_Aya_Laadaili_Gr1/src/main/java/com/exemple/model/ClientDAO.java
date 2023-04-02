package com.exemple.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ClientDAO extends  BaseDAO<Client> {
    public ClientDAO() throws SQLException {

        super();
    }

    // mapping objet --> relation
    @Override
    public void save(Client object) throws SQLException {

        String req = "insert into client (nom ,prenom, telephone) values (? , ? , ?) ;";


        this.preparedStatement = this.connection.prepareStatement(req);

        this.preparedStatement.setString(1 , object.getNom());
        this.preparedStatement.setString(2,object.getPrenom());
        this.preparedStatement.setString(3 , object.getTelepehone());


        this.preparedStatement.execute();

    }

    @Override
        public void update(Client object) throws SQLException {
            String req = "update client set nom = ?, prenom = ?, telephone = ? where id_client= ?;";
            this.preparedStatement = this.connection.prepareStatement(req);
            this.preparedStatement.setString(1, object.getNom());
            this.preparedStatement.setString(2, object.getPrenom());
            this.preparedStatement.setString(3, object.getTelepehone());
            this.preparedStatement.setLong(4, object.getId_client());
            this.preparedStatement.executeUpdate();
        }


    @Override
    public void delete(Client object) throws SQLException {

        String req = "delete from client where id_client = ?;";

        this.preparedStatement = this.connection.prepareStatement(req);

        this.preparedStatement.setLong(1, object.getId_client());

        this.preparedStatement.executeUpdate();

    }


    @Override
    public Client getOne(Long id_client) throws SQLException {
        String query = "SELECT * FROM client WHERE id_client = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, id_client);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Client(
                            resultSet.getLong("id_client"),
                            resultSet.getString("nom"),
                            resultSet.getString("prenom"),
                            resultSet.getString("telephone")
                    );
                }
            }
        }
        return null;
    }

    // mapping relation --> objet
    @Override
    public List<Client> getAll() throws SQLException{

        List<Client> clients = new ArrayList<>();

        String query = "SELECT * FROM client";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    clients.add(new Client(
                            resultSet.getLong("id_client"),
                            resultSet.getString("nom"),
                            resultSet.getString("prenom"),
                            resultSet.getString("telephone")
                    ));
                }
            }
        }

        return clients;
    }
    }

