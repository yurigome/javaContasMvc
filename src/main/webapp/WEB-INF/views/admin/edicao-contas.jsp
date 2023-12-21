<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Contas - Edição de Contas</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

<!-- folha de estilo CSS -->
<link href="../resources/style.css" rel="stylesheet"/>

</head>
<body>

	<!-- componente do menu do sistema -->
	<jsp:include page="/WEB-INF/views/admin/components/menu.jsp"></jsp:include>

	<div class="container mt-3">
		
		<h4>Edição de Contas</h4>
		<p>Preencha os campos para atualizar uma conta a pagar ou receber.</p>
		
		<div class="text-success mb-2">
			<strong>${mensagem_sucesso}</strong>
		</div>
		
		<div class="text-danger mb-2">
			<strong>${mensagem_erro}</strong>
		</div>
		
		<form class="mt-2 mb-2" id="formEdicao" action="edicao-contas-post" method="post">
		
			<!-- campo oculto -->
			<input type="hidden" value="${conta.idConta}" 
				id="idConta" name="idConta"/>
			
			<div class="row mb-2">
				
				<div class="col">
					<label>Nome da conta:</label>
					<input type="text" class="form-control" 
						id="nome" name="nome"
						value="${conta.nome}"/>
				</div>
				
				<div class="col">
					<label>Data da conta:</label>
					<input type="date" class="form-control" 
						id="data" name="data"
						value='<fmt:formatDate value="${conta.data}" pattern="yyyy-MM-dd"/>'/>
				</div>
				
				<div class="col">
					<label>Valor da conta:</label>
					<input type="text" class="form-control" 
						id="valor" name="valor"
						value="${conta.valor}"/>
				</div>
				
				<div class="col">
					<label>Tipo da conta:</label>
					<select class="form-select" id="tipo" name="tipo">
						<option value="">Selecione uma opção</option>
						<option value="1" ${conta.tipo == 1 ? "selected" : ""}>Conta a receber</option>
						<option value="2" ${conta.tipo == 2 ? "selected" : ""}>Conta a pagar</option>
					</select>
				</div>
				
			</div>
			
			<div class="row mb-2">
				<div class="col">
					<label>Descrição / observações da conta:</label>
					<textarea class="form-control" id="descricao" name="descricao">${conta.descricao}</textarea>
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col">
					<input type="submit" class="btn btn-primary" value="Salvar alterações"/>
					<a href="/javaContasMvc/admin/consulta-contas" class="btn btn-light">
						Ir para a consulta
					</a>
				</div>
			</div>
			
		</form>
		
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
			$("#formEdicao").validate({
				rules: {					
					"nome" : {
						required: true,
						minlength: 8,
						maxlength: 100
					},
					"data" : {
						required: true
					},
					"valor" : {
						required: true,
						min: 1
					},
					"tipo" : {
						required: true
					},
					"descricao" : {
						required : true,
						minlength: 8,
						maxlength: 500
					}
				}
			});			
		});
	</script>
	
</body>
</html>