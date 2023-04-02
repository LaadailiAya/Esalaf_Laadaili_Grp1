package com.exemple.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class AdminDAO extends  BaseDAO<Admin> {
    public AdminDAO() throws SQLException {

        super();
    }
    // mapping objet --> relation
    @Override
    public void save(Admin object) throws SQLException {
    }

    @Override
    public void update(Admin object) throws SQLException {
    }


    @Override
    public void delete(Admin object) throws SQLException {
    }


    @Override
    public Admin getOne(Long id_client) throws SQLException {
        return null;
    }

    // mapping relation --> objet
    @Override
    public List<Admin> getAll() throws SQLException{
        return null;
    }
    public boolean connect(Integer id,String user, Integer pwd) throws SQLException {
        boolean connected = false;
        String query = "SELECT * FROM Admin WHERE id=? AND user = ? AND pwd = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, String.valueOf(id));
            pstmt.setString(2, user);
            pstmt.setString(3, String.valueOf(pwd));
            ResultSet rs = pstmt.executeQuery();
            connected = rs.next();
        }
        return connected;
    }
}
