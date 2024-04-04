import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import processing.core.PApplet;
import processing.core.PImage;

public class Heatmap {
  PApplet parent;
    PImage mapImage;
    String flightsDBPath = "flights100k.db";
    String airportsDBPath = "global_airports_sqlite.db";
    
    public Heatmap(PApplet parent){
    this.parent = parent;
    }

    void drawAirports() {
        try {
            Connection flightsConn = DriverManager.getConnection("jdbc:sqlite:" + flightsDBPath);
            Statement flightsStmt = flightsConn.createStatement();

            // Query unique ORIGIN column from the global database and counts number of flights for each ORIGIN to determine circle size
            ResultSet rsOrigins = flightsStmt.executeQuery("SELECT ORIGIN, COUNT(*) AS flight_count FROM data GROUP BY ORIGIN");

            // Connect to the airports table in global database
            Connection airportsConn = DriverManager.getConnection("jdbc:sqlite:" + airportsDBPath);
            Statement airportsStmt = airportsConn.createStatement();

            while (rsOrigins.next()) {
                String origin = rsOrigins.getString("ORIGIN");
                int flight_count = rsOrigins.getInt("flight_count");

                // Query for based on origin from the airports database
                ResultSet rsAirport = airportsStmt.executeQuery(
                        "SELECT * FROM airports WHERE ident = '" + origin + "' AND country = 'USA'");

                if (rsAirport.next()) {
                    float lat = convertToDecimal(rsAirport.getInt("lat_deg"), rsAirport.getInt("lat_min"), rsAirport.getInt("lat_sec"), rsAirport.getString("lat_dir"));
                    float lon = convertToDecimal(rsAirport.getInt("lon_deg"), rsAirport.getInt("lon_min"), rsAirport.getInt("lon_sec"), rsAirport.getString("lon_dir"));

                    // Convert the latitude, longitude, minutes, seconds, degrees to simple x y co-ordinates
                    float[] xy = latLonToXY(lat, lon);
                    
                    // Uses the number of flights as queried to determine the width of the circle drawn
                    float scale = 0.1;
                    float circleSize = flight_count * scale; // Adjust scale as needed
                    parent.fill(255, 0, 0, 100); // Sets a semi-transparent red for heatmap effect
                    parent.ellipse(xy[0], xy[1], circleSize, circleSize); // Draws circle for each airport
                }
                rsAirport.close();
            }

            rsOrigins.close();
            flightsStmt.close();
            flightsConn.close();
            airportsStmt.close();
            airportsConn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    float[] latLonToXY(float lat, float lon) {
        // Change x y co-ords to appear on the map image
        float x = map(lon, -125, -66, 0, mapImage.width); // Adjusted for US map longitude bounds so it fits the US image
        float y = map(lat, 50, 24, 0, mapImage.height); // Adjusted for US map latitude bounds so it fits the US image
        return new float[]{x, y};
    }

    float convertToDecimal(int deg, int min, int sec, String dir) {
        // Convert degrees, minutes, seconds, direction to decimal for lat/lon
        float decimal = deg + min / 60.0f + sec / 3600.0f;
        if (dir.equals("S") || dir.equals("W")) {
            decimal *= -1;
        }
        return decimal;
    }
}
