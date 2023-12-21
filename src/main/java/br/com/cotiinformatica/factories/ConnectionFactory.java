package br.com.cotiinformatica.factories;

import java.sql.Connection;
import java.sql.DriverManager;

/*
 * Classe para fabricar e gerar as conexões
 * com o banco de dados do PostGreSQL
 */
public class ConnectionFactory {

	// atributos
	private static final String DRIVER = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://localhost:5433/bd_javacontasmvc";
	private static final String USER = "postgres";
	private static final String PASSWORD = "coti";

	// método para abrir conexão com o banco de dados
	public static Connection getConnection() throws Exception {
		Class.forName(DRIVER);
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
}
