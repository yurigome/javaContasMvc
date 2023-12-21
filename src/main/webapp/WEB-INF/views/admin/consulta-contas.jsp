<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Contas - Consulta de Contas</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

<!-- folha de estilos CSS -->
<link href="../resources/style.css" rel="stylesheet"/>

</head>
<body>

	<!-- componente do menu do sistema -->
	<jsp:include page="/WEB-INF/views/admin/components/menu.jsp"></jsp:include>

	<div class="container mt-3">
		
		<h4>Consulta de Contas</h4>
		<p>Pesquise as contas cadastradas de acordo com um período de datas.</p>
		
		<form id="formConsulta" action="consulta-contas-post" method="post" class="mt-2 mb-2">
			<div class="row">
				<div class="col-md-2">
					<label>Data de início:</label>
					<input type="date" id="dataMin" name="dataMin" 
						value="${dataMin}" class="form-control" />
				</div>
				<div class="col-md-2">
					<label>Data de fim:</label>
					<input type="date" id="dataMax" name="dataMax" 
						value="${dataMax}" class="form-control" />
				</div>
				<div class="col-md-8">
					<input type="submit" class="btn btn-success mt-4" value="Pesquisar contas"/>
				</div>
			</div>
		</form>
		
		<div class="text-success mb-2">
			<strong>${mensagem_sucesso}</strong>
		</div>
		
		<div class="text-danger mb-2">
			<strong>${mensagem_erro}</strong>
		</div>
		
		<c:choose>
			<c:when test="${contas.size() > 0}">
				
				<div class="table-responsive mt-3">
					<table class="table table-sm">
						<thead>
							<tr>
								<th>Data</th>
								<th>Valor</th>
								<th>Tipo</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th>Operações</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${contas}" var="conta">
								
								<tr>
									<td>
										<fmt:formatDate 
											value="${conta.data}" 
											pattern="dd/MM/yy"
											/>										
									</td>
									<td>
										<fmt:formatNumber 
											value="${conta.valor}"
											type="currency"
											currencySymbol="R$"
											/>										
									</td>
									<td>
										<c:choose>
											<c:when test="${conta.tipo == 1}">
												<span class="badge bg-success">RECEBER</span>
											</c:when>
											<c:when test="${conta.tipo == 2}">
												<span class="badge bg-danger">PAGAR</span>
											</c:when>
										</c:choose>
									</td>
									<td>
										${conta.nome}
									</td>
									<td>
										${conta.descricao}
									</td>
									<td>
						
										<a href="/javaContasMvc/admin/edicao-contas?idConta=${conta.idConta}"
											class="btn btn-outline-primary btn-sm me-2">
											Editar
										</a>
										<a href="/javaContasMvc/admin/exclusao-contas?idConta=${conta.idConta}&dataMin=${dataMin}&dataMax=${dataMax}"
											onclick="return confirm('Deseja excluir a conta selecionada?');"
											class="btn btn-outline-danger btn-sm">
											Excluir	
										</a>
						
									</td>
								</tr>
								
							</c:forEach>						
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6">
									Quantidade de registros: ${contas.size()}
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				
			</c:when>
			<c:when test="${contas.size() == 0}">
				<div class="mt-3">
					Nenhum resultado foi encontrado para o filtro selecionado.
				</div>
			</c:when>
		</c:choose>	
		
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- JQuery -->	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- JQuery Validation -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/localization/messages_pt_BR.min.js"></script>
	
	<script>
		//executando quando a página abrir..
		$(document).ready(function(){ 

			//validação do formulário
			$("#formConsulta").validate({
				rules: {
					"dataMin" : {
						required: true
					},
					"dataMax" : {
						required: true
					}
				}
			});			
		});
	</script>
	
</body>
</html>