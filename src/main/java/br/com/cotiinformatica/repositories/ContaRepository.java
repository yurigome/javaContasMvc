package br.com.cotiinformatica.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.cotiinformatica.entities.Conta;
import br.com.cotiinformatica.factories.ConnectionFactory;

public class ContaRepository {

	// método para inserir uma conta na tabela do banco de dados
	public void create(Conta conta) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection.prepareStatement(
				"insert into conta(nome, data, valor, descricao, tipo, idusuario) values(?,?,?,?,?,?)");

		statement.setString(1, conta.getNome());
		statement.setDate(2, new java.sql.Date(conta.getData().getTime()));
		statement.setDouble(3, conta.getValor());
		statement.setString(4, conta.getDescricao());
		statement.setInt(5, conta.getTipo());
		statement.setInt(6, conta.getIdUsuario());
		statement.execute();

		connection.close();
	}

	// método para atualizar uma conta na tabela do banco de dados
	public void update(Conta conta) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection
				.prepareStatement("update conta set nome=?, data=?, valor=?, descricao=?, tipo=? where idconta=?");

		statement.setString(1, conta.getNome());
		statement.setDate(2, new java.sql.Date(conta.getData().getTime()));
		statement.setDouble(3, conta.getValor());
		statement.setString(4, conta.getDescricao());
		statement.setInt(5, conta.getTipo());
		statement.setInt(6, conta.getIdConta());
		statement.execute();

		connection.close();
	}

	// método para excluir uma conta na tabela do banco de dados
	public void delete(Integer idConta) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection.prepareStatement("delete from conta where idconta = ?");

		statement.setInt(1, idConta);
		statement.execute();

		connection.close();
	}

	// método para consultar contas
	public List<Conta> find(Date dataMin, Date dataMax, Integer idUsuario) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection
				.prepareStatement("select * from conta where data between ? and ? and idusuario=?");

		statement.setDate(1, new java.sql.Date(dataMin.getTime()));
		statement.setDate(2, new java.sql.Date(dataMax.getTime()));
		statement.setInt(3, idUsuario);
		ResultSet resultSet = statement.executeQuery();

		List<Conta> lista = new ArrayList<Conta>();

		while (resultSet.next()) {

			Conta conta = new Conta();
			conta.setIdConta(resultSet.getInt("idconta"));
			conta.setNome(resultSet.getString("nome"));
			conta.setData(new SimpleDateFormat("yyyy-MM-dd").parse(resultSet.getString("data")));
			conta.setValor(resultSet.getDouble("valor"));
			conta.setDescricao(resultSet.getString("descricao"));
			conta.setTipo(resultSet.getInt("tipo"));
			conta.setIdUsuario(resultSet.getInt("idusuario"));

			lista.add(conta);
		}

		connection.close();
		return lista;
	}

	// método para consultar 1 conta através do ID
	public Conta findById(Integer idConta) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection
				.prepareStatement("select * from conta where idconta=?");

		statement.setInt(1, idConta);
		ResultSet resultSet = statement.executeQuery();

		Conta conta = null;

		if (resultSet.next()) {

			conta = new Conta();
			
			conta.setIdConta(resultSet.getInt("idconta"));
			conta.setNome(resultSet.getString("nome"));
			conta.setData(new SimpleDateFormat("yyyy-MM-dd").parse(resultSet.getString("data")));
			conta.setValor(resultSet.getDouble("valor"));
			conta.setDescricao(resultSet.getString("descricao"));
			conta.setTipo(resultSet.getInt("tipo"));
			conta.setIdUsuario(resultSet.getInt("idusuario"));
		}

		connection.close();
		return conta;
	}

}
