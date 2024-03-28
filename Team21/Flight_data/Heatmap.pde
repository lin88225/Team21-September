import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FlightHeatmap {
    private int[][] heatmap; // 2D array to store intensity values
    private int width; // Width of the heatmap
    private int height; // Height of the heatmap
    private JPanel panel; // Panel to draw heatmap on
    private String databasePath; // Path to SQLite database

    // Constructor to initialize heatmap size
    public FlightHeatmap(int width, int height, JPanel panel) {
        this.width = width;
        this.height = height;
        this.panel = panel;
        this.heatmap = new int[width][height];
    }

    // Constructor to set database path
    public FlightHeatmap(String databasePath) {
        this.databasePath = databasePath;
    }

    // Method to set intensity values
    public void setIntensity(int x, int y, int intensity) {
        if (x >= 0 && x < width && y >= 0 && y < height) {
            heatmap[x][y] = intensity;
        }
    }

    // Method to generate heatmap from the database
    public void generateHeatmap() {
        try {
            Connection connection = DriverManager.getConnection("jdbc:sqlite:" + databasePath);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM intensity_data");

            while (resultSet.next()) {
                int x = resultSet.getInt("x_coordinate");
                int y = resultSet.getInt("y_coordinate");
                int intensity = resultSet.getInt("intensity");
                setIntensity(x, y, intensity);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to draw the heatmap
    public void draw(PGraphics pg) {
        // Define heatmap colors (you can adjust these)
        Color lowIntensityColor = Color.BLUE;
        Color highIntensityColor = Color.RED;

        // Draw heatmap based on intensity values
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                int intensity = heatmap[x][y];
                // Interpolate color based on intensity value
                Color color1 = interpolateColor(lowIntensityColor, highIntensityColor, intensity / 255.0);
                pg.fill(color1.getRGB());
                pg.rect(x, y, 1, 1); // Draw a single pixel
            }
        }
    }

    // Method to interpolate color between two colors based on intensity
    private Color interpolateColor(Color startColor, Color endColor, double intensity) {
        int r = (int) (startColor.getRed() + intensity * (endColor.getRed() - startColor.getRed()));
        int g = (int) (startColor.getGreen() + intensity * (endColor.getGreen() - startColor.getGreen()));
        int b = (int) (startColor.getBlue() + intensity * (endColor.getBlue() - startColor.getBlue()));
        return new Color(r, g, b);
    }
}
