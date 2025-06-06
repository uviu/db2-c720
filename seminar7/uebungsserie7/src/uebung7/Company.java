package uebung7;

import java.sql.*;
import java.util.Scanner;

public class Company {
    private Connection connection;

    public void init(){
        try{
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection(System.getenv("DB_URL"),
                    System.getenv("DB_USER"), System.getenv("DB_PASSWORD"));
            System.out.println("Connected to database");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ResultSet listemp() {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EMPNO, ENAME, SAL FROM EMP");

            while (rs.next()) {
                System.out.printf("| %-12s | %-20s | %-10s |%n", rs.getInt("EMPNO"),
                        rs.getString("ENAME"), rs.getInt("SAL"));
            }

            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ResultSet listMetadata() {
        Statement stmt;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EMPNO, ENAME, SAL FROM EMP");
            ResultSetMetaData metaData = rs.getMetaData();

            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                System.out.printf("| %-12s | %-20s | %-10d | %-6d |%n",
                        metaData.getColumnName(i),
                        metaData.getColumnTypeName(i),
                        metaData.getColumnDisplaySize(i),
                        metaData.getScale(i));
            }

            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateEMP(){
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter employee number: ");
            int empNo = scanner.nextInt();
            scanner.nextLine(); // consume newline
            System.out.print("Enter new employee name: ");
            String newName = scanner.nextLine();

            String updateSQL = "UPDATE EMP SET ENAME = ? WHERE EMPNO = ?";
            PreparedStatement pstmt = connection.prepareStatement(updateSQL);
            pstmt.setString(1, newName);
            pstmt.setInt(2, empNo);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) updated");

            // Verify the update
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = " + empNo);
            if (rs.next()) {
                System.out.printf("Updated record: EMPNO=%d, ENAME=%s%n",
                        rs.getInt("EMPNO"), rs.getString("ENAME"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}