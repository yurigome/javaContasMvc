<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Contas - Autenticar</title>

<!-- Folha de estilos CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

<!-- CSS -->
<link href="resources/style.css" rel="stylesheet"/>

</head>
<body class="bg-secondary">

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
		
			<div class="card">
				<div class="card-body text-center">
				
					<img src="https://www.cotiinformatica.com.br/imagens/logo-coti-informatica.svg"/>
				
					<h4>Sistema de controle de contas</h4>
					<p>Autenticação de usuários.</p>
					<hr/>	
					
					<p>Entre com suas credenciais de acesso:</p>
					
					<h5 class="text-danger">${mensagem_erro}</h5>
					
					<form id="formAutenticar" class="text-start" action="autenticar-post" method="post">
					
						<div class="mt-2">
							<label>Entre com seu email:</label>
							<input type="text" id="email" name="email" 
								class="form-control" placeholder="Digite o email aqui."/>
						</div>
						<div class="mt-2">
							<label>Entre com sua senha:</label>
							<input type="password" id="senha" name="senha" 
								class="form-control" placeholder="Digite a senha aqui."/>
						</div>
						<div class="mt-2 d-grid">
							<input type="submit" value="Acessar Sistema" class="btn btn-primary"/>
						</div>
						<div class="mt-2 d-grid">
							<a href="/javaContasMvc/criar-usuario" class="btn btn-light">
								Não possui conta? <strong>Cadastre-se aqui!</strong>
							</a>
						</div>
						
					</form>
					
				</div>		
			</div>
			
		</div>
	</div>

	<!-- Bootstrap -->
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
			$("#formAutenticar").validate({
				rules: {					
					"email" : {
						required: true,
						email: true
					},
					"senha" : {
						required : true,
						pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
					}
				},
				messages: {
					"senha": {
						pattern: "Informe 1 letra maíúscula, 1 letra minúscula, 1 número, 1 símbolo e pelo menos 8 caracteres."
					}
				}
			});			
		});
	</script>

</body>
</html>