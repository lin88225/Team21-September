// TO DO
// -Alter intensity colours to constants?
// -retrieve long and lat data of airports
// -determine magnitude of the flights to influence 'intensity' colour around airports
// -Uncomment call in main
// 

import java.awt.Color;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FlightHeatmap {
    private int[][] heatmap;
    private int width;
    private int height;
    private String databasePath;

    public FlightHeatmap(int width, int height) {
        this.width = width;
        this.height = height;
        this.heatmap = new int[width][height];
    }

    public FlightHeatmap(String databasePath) {
        this.databasePath = databasePath;
    }

    public void setIntensity(int x, int y, int magnitude) {
        if (x >= 0 && x < width && y >= 0 && y < height) {
            heatmap[x][y] += magnitude; // Accumulate magnitudes
        }
    }

    public void generateHeatmap() {
        try {
            Connection connection = DriverManager.getConnection("jdbc:sqlite:" + databasePath);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_data");

            while (resultSet.next()) {
                int x = resultSet.getInt("x_coordinate");
                int y = resultSet.getInt("y_coordinate");
                int magnitude = resultSet.getInt("magnitude");
                setIntensity(x, y, magnitude);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void draw(PGraphics pg) {
        Color lowIntensityColor = Color.BLUE;
        Color highIntensityColor = Color.RED;

        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                int magnitude = heatmap[x][y];
                int intensity = (int) map(magnitude, 0, 1000, 0, 255);
                Color color1 = interpolateColor(lowIntensityColor, highIntensityColor, intensity / 255.0);
                pg.fill(color1.getRGB());
                pg.rect(x, y, 1, 1);
            }
        }
    }

    private Color interpolateColor(Color startColor, Color endColor, double intensity) {
        int r = (int) (startColor.getRed() + intensity * (endColor.getRed() - startColor.getRed()));
        int g = (int) (startColor.getGreen() + intensity * (endColor.getGreen() - startColor.getGreen()));
        int b = (int) (startColor.getBlue() + intensity * (endColor.getBlue() - startColor.getBlue()));
        return new Color(r, g, b);
    }
}
