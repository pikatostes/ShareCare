import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SQLiteDB {
    public static void main(String[] args) {
        try {
            // Establecer conexión a la base de datos SQLite
            Connection connection = DriverManager.getConnection("jdbc:sqlite:project.db");

            // Crear la tabla "Solicitudes" si no existe
            Statement statement = connection.createStatement();
            String sql = "CREATE TABLE IF NOT EXISTS Solicitudes (" +
                    "Id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "Usuario TEXT, " +
                    "Descripcion TEXT, " +
                    "Fecha TEXT)";
            statement.executeUpdate(sql);

            // Cerrar la conexión y liberar los recursos
            statement.close();
            connection.close();

            System.out.println("La tabla 'Solicitudes' ha sido creada correctamente.");
        } catch (Exception e) {
            System.err.println("Error al crear la tabla 'Solicitudes': " + e.getMessage());
        }
    }
}
