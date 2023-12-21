package br.com.cotiinformatica.entities;

import java.util.Date;

public class Conta {

	private Integer idConta;
	private String nome;
	private Date data;
	private Double valor;
	private String descricao;
	private Integer tipo;
	private Integer idUsuario;
	private Usuario usuario;

	public Conta() {
		// TODO Auto-generated constructor stub
	}

	public Conta(Integer idConta, String nome, Date data, Double valor, String descricao, Integer tipo,
			Integer idUsuario, Usuario usuario) {
		super();
		this.idConta = idConta;
		this.nome = nome;
		this.data = data;
		this.valor = valor;
		this.descricao = descricao;
		this.tipo = tipo;
		this.idUsuario = idUsuario;
		this.usuario = usuario;
	}

	public Integer getIdConta() {
		return idConta;
	}

	public void setIdConta(Integer idConta) {
		this.idConta = idConta;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public String toString() {
		return "Conta [idConta=" + idConta + ", nome=" + nome + ", data=" + data + ", valor=" + valor + ", descricao="
				+ descricao + ", tipo=" + tipo + ", idUsuario=" + idUsuario + ", usuario=" + usuario + "]";
	}

}
