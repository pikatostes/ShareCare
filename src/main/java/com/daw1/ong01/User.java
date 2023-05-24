package com.daw1.ong01;
import java.sql.*;

public class User {
    private int id;
    private String userName;
    private String password;
    private String name;
    private String phone;
    private String email;
    private int skill;
    private boolean contributor;

    // Constructor
    public User(int id, String userName, String password, String name, String phone, String email, int skill, boolean contributor) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.skill = skill;
        this.contributor = contributor;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSkill() {
        return skill;
    }

    public void setSkill(int skill) {
        this.skill = skill;
    }

    public boolean isContributor() {
        return contributor;
    }

    public void setContributor(boolean contributor) {
        this.contributor = contributor;
    }

    public void saveUser() throws SQLException {
        Connection connection = null;
        Statement statement = null;

        try {
            // Establecer conexión a la base de datos SQLite
            connection = HelloServlet.connect();

            // Crear una declaración
            statement = connection.createStatement();

            // Comprobar la existencia del número de socio introducido
            String consultaNumSocio = "SELECT * FROM User WHERE userName='" + userName + "'";
            ResultSet numeroDeSocios = statement.executeQuery(consultaNumSocio);

            if (numeroDeSocios.next()) {
                System.out.println("Lo siento, no se ha podido dar de alta, ya existe un socio con el nombre de usuario '" + userName + "'.");
            } else {
                // Realizar la inserción del usuario en la tabla
                String insercion = "INSERT INTO User (userName, password, name, phone, email, skill, contributor) VALUES ('"
                        + userName + "', '" + password + "', '" + name + "', '" + phone + "', '" + email + "', " + skill + ", " + (contributor ? 1 : 0) + ")";
                statement.execute(insercion);
                System.out.println("Socio dado de alta correctamente.");
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Cerrar la declaración y la conexión
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}