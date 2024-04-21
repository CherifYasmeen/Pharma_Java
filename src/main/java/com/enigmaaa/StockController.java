package com.enigmaaa;
import javafx.beans.property.SimpleFloatProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import models.stock;
import utils.MyDatabase;
import javafx.event.ActionEvent;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private TableColumn<stock, Float> prixx;

    @FXML
    private Button btnAdd;

    @FXML
    private Button btnDelete;

    @FXML
    private Button btnUpdate;

    @FXML
    private TextField tnom;

    @FXML
    private TextField tprix;

    @FXML
    private TextField tquan;

    @FXML
    private TextField ttype;

    @FXML
    private ChoiceBox<String> typeChoice;

    @FXML
    private TextField nomChoice;



    @FXML
    public void initialize() {
        initializeColumns();
        afficherStocks();

        nomChoice.textProperty().addListener((observable, oldValue, newValue) -> {
            rechercher(newValue);
        });

        table();
    }

    private void initializeColumns() {
        nomp.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getNom_produit()));
        quantitep.setCellValueFactory(data -> new SimpleIntegerProperty(data.getValue().getQuantite()).asObject());
        datep.setCellValueFactory(data -> new SimpleObjectProperty<>(data.getValue().getDate()));
        type.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getType()));
        prixx.setCellValueFactory(data -> new SimpleFloatProperty(data.getValue().getPrix()).asObject()); // Corrected cell value factory
    }

    private void afficherStocks() {
        try {
            Connection connection = MyDatabase.getInstance().getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT `nom_produit`, `quantite`, `date`, `type` , `prix` FROM `stock`");
            while (resultSet.next()) {
                stock s = new stock(
                        resultSet.getString("nom_produit"),
                        resultSet.getInt("quantite"),
                        resultSet.getDate("date"),
                        resultSet.getString("type"),
                        resultSet.getFloat("prix"));
                stockTable.getItems().add(s);
                System.out.println(s);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    @FXML
    void add(ActionEvent event) {
        String nomProduit = tnom.getText();
        int quantite = Integer.parseInt(tquan.getText());
        Date date = new Date(System.currentTimeMillis());
        String produitType = ttype.getText();
        float prix = Float.parseFloat(tprix.getText());

        try {
            Connection connection = MyDatabase.getInstance().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO stock (nom_produit, quantite, date, type, prix) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, nomProduit);
            preparedStatement.setInt(2, quantite);
            preparedStatement.setDate(3, date);
            preparedStatement.setString(4, produitType);
            preparedStatement.setFloat(5, prix);

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Record added successfully!");
                // Show success message
                Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                alert.setTitle("Add Product");
                alert.setHeaderText("Add Product");
                alert.setContentText("Product added successfully!");
                alert.showAndWait();

                // Clear text fields after adding
                tnom.clear();
                tquan.clear();
                tprix.clear();
                ttype.clear();

                // Refresh table view
                stockTable.getItems().clear(); // Clear table
                afficherStocks(); // Re-populate table
            } else {
                System.out.println("Failed to add record!");
                // Show error message
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Add Product");
                alert.setHeaderText("Add Product");
                alert.setContentText("Failed to add product!");
                alert.showAndWait();
            }

            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Show error message
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Add Product");
            alert.setHeaderText("Add Product");
            alert.setContentText("An error occurred while adding product!");
            alert.showAndWait();
        }
    }


    @FXML
    public void table() {
        Connection connection = MyDatabase.getInstance().getConnection();

        ObservableList<stock> stocks = FXCollections.observableArrayList();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT `nom_produit`, `quantite`, `date`, `type` , `prix` FROM `stock`");
            while (resultSet.next()) {
                stock s = new stock(
                        resultSet.getString("nom_produit"),
                        resultSet.getInt("quantite"),
                        resultSet.getDate("date"),
                        resultSet.getString("type"),
                        resultSet.getFloat("prix"));
                stocks.add(s);
            }
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(StockController.class.getName()).log(Level.SEVERE, null, ex);
        }
        stockTable.setItems(stocks);

        stockTable.setRowFactory(tv -> {
            TableRow<stock> myRow = new TableRow<>();
            myRow.setOnMouseClicked(event -> {
                if (event.getClickCount() == 1 && (!myRow.isEmpty())) {
                    int myIndex = stockTable.getSelectionModel().getSelectedIndex();
                    if (myIndex >= 0) {
                        stock selectedItem = stockTable.getItems().get(myIndex);
                        tnom.setText(selectedItem.getNom_produit());
                        tquan.setText(String.valueOf(selectedItem.getQuantite()));
                        ttype.setText(selectedItem.getType());
                        tprix.setText(String.valueOf(selectedItem.getPrix()));
                    }
                }
            });
            return myRow;
        });
    }




    @FXML
    void delete(ActionEvent event) {
        stock selectedItem = stockTable.getSelectionModel().getSelectedItem();
        if (selectedItem != null) {
            try {
                Connection connection = MyDatabase.getInstance().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM stock WHERE nom_produit = ?");
                preparedStatement.setString(1, selectedItem.getNom_produit());

                int affectedRows = preparedStatement.executeUpdate();
                if (affectedRows > 0) {
                    System.out.println("Record deleted successfully!");
                    // Show success message
                    Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                    alert.setTitle("Delete Product");
                    alert.setHeaderText("Delete Product");
                    alert.setContentText("Product deleted successfully!");
                    alert.showAndWait();

                    // Refresh table view
                    stockTable.getItems().remove(selectedItem);
                } else {
                    System.out.println("Failed to delete record!");
                    // Show error message
                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setTitle("Delete Product");
                    alert.setHeaderText("Delete Product");
                    alert.setContentText("Failed to delete product!");
                    alert.showAndWait();
                }

                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Show error message
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Delete Product");
                alert.setHeaderText("Delete Product");
                alert.setContentText("An error occurred while deleting product!");
                alert.showAndWait();
            }
        } else {
            // Show error message if no item is selected
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Delete Product");
            alert.setHeaderText("Delete Product");
            alert.setContentText("Please select a product to delete!");
            alert.showAndWait();
        }
    }

    @FXML
    void update(ActionEvent event) {
        // Get selected item from the table
        stock selectedItem = stockTable.getSelectionModel().getSelectedItem();

        // Check if an item is selected
        if (selectedItem != null) {
            // Retrieve updated values from text fields
            String newNomProduit = tnom.getText();
            int newQuantite = Integer.parseInt(tquan.getText());
            Date newDate = new Date(System.currentTimeMillis()); // Assuming the date is also updated
            String newProduitType = ttype.getText();
            float newPrix = Float.parseFloat(tprix.getText());

            try {
                // Establish connection to the database
                Connection connection = MyDatabase.getInstance().getConnection();

                // Construct SQL update statement
                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE stock SET nom_produit = ?, quantite = ?, date = ?, type = ?, prix = ? WHERE nom_produit = ?");
                preparedStatement.setString(1, newNomProduit);
                preparedStatement.setInt(2, newQuantite);
                preparedStatement.setDate(3, newDate);
                preparedStatement.setString(4, newProduitType);
                preparedStatement.setFloat(5, newPrix);
                preparedStatement.setString(6, selectedItem.getNom_produit());

                // Execute update statement
                int affectedRows = preparedStatement.executeUpdate();

                if (affectedRows > 0) {
                    System.out.println("Record updated successfully!");
                    // Show success message
                    Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                    alert.setTitle("Update Product");
                    alert.setHeaderText("Update Product");
                    alert.setContentText("Product updated successfully!");
                    alert.showAndWait();

                    // Update the selected item in the observable list
                    selectedItem.setNom_produit(newNomProduit);
                    selectedItem.setQuantite(newQuantite);
                    selectedItem.setDate(newDate);
                    selectedItem.setType(newProduitType);
                    selectedItem.setPrix(newPrix);

                    // Refresh table view
                    stockTable.refresh();
                } else {
                    System.out.println("Failed to update record!");
                    // Show error message
                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setTitle("Update Product");
                    alert.setHeaderText("Update Product");
                    alert.setContentText("Failed to update product!");
                    alert.showAndWait();
                }

                // Close prepared statement
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Show error message
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Update Product");
                alert.setHeaderText("Update Product");
                alert.setContentText("An error occurred while updating product!");
                alert.showAndWait();
            }
        } else {
            // Show error message if no item is selected
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Update Product");
            alert.setHeaderText("Update Product");
            alert.setContentText("Please select a product to update!");
            alert.showAndWait();
        }
    }

    void rechercher(String nomProduit) {
        ObservableList<stock> stocks = FXCollections.observableArrayList();
        try {
            Connection connection = MyDatabase.getInstance().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT `nom_produit`, `quantite`, `date`, `type` , `prix` FROM `stock` WHERE `nom_produit` LIKE ?");
            preparedStatement.setString(1, "%" + nomProduit + "%"); // Using LIKE operator
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                stock s = new stock(
                        resultSet.getString("nom_produit"),
                        resultSet.getInt("quantite"),
                        resultSet.getDate("date"),
                        resultSet.getString("type"),
                        resultSet.getFloat("prix"));
                stocks.add(s);
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        stockTable.setItems(stocks);
    }




}