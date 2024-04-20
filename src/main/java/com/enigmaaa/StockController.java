package com.enigmaaa;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import models.stock;
import utils.MyDatabase;

import java.sql.*;

public class StockController {

    @FXML
    private TableView<stock> stockTable;

    @FXML
    private TableColumn<stock, String> nomp;

    @FXML
    private TableColumn<stock, Integer> quantitep;

    @FXML
    private TableColumn<stock, Date> datep;

    @FXML
    private TableColumn<stock, String> type;

    @FXML
    private Label title;

    @FXML
    public void initialize() {
        initializeColumns();
        afficherStocks();
    }

    private void initializeColumns() {
        nomp.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getNom_produit()));
        quantitep.setCellValueFactory(data -> new SimpleIntegerProperty(data.getValue().getQuantite()).asObject());
        datep.setCellValueFactory(data -> new SimpleObjectProperty<>(data.getValue().getDate()));
        type.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getType()));
    }

    private void afficherStocks() {
        try {
            Connection connection = MyDatabase.getInstance().getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT `nom_produit`, `quantite`, `date`, `type` FROM `stock`");
            while (resultSet.next()) {
                stock s = new stock(
                        resultSet.getString("nom_produit"),
                        resultSet.getInt("quantite"),
                        resultSet.getDate("date"),
                        resultSet.getString("type"));
                stockTable.getItems().add(s);
                System.out.println(s);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
