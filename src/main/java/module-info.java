module java.enigmaaa {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.enigmaaa to javafx.fxml;
    exports com.enigmaaa;
}