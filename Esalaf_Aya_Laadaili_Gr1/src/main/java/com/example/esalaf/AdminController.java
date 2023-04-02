package com.example.esalaf;


import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import com.exemple.model.AdminDAO;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;

public class AdminController {
    @FXML
    private TextField id;

    @FXML
    private TextField user;

    @FXML
    private TextField pwd;

    // To delete a connect:
    @FXML
    protected void onConnectButtonClick() {
        try {
            AdminDAO adminDAO = new AdminDAO();
            boolean connected = adminDAO.connect(Integer.parseInt(id.getText()),user.getText(), Integer.parseInt(pwd.getText()));
            if (connected) {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("hello-view.fxml"));
                Parent root = loader.load();
                Scene scene = new Scene(root);
                Stage stage = (Stage) id.getScene().getWindow();
                stage.setScene(scene);
            } else {
                System.out.println("Nom d'utilisateur ou mot de passe incorrect.");
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

}
