package uebung7;

import java.sql.ResultSet;

public class Main {
    public static void main(String[] args) {
        Company company = new Company();
        company.init();
        ResultSet listEmp = company.listemp();
        //ResultSet listMetadata = company.listMetadata();
        //company.updateEMP();
    }
}