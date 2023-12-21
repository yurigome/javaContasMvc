<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Contas - Criar usuário</title>

<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

<!-- CSS -->
<link href="resources/style.css" rel="stylesheet"/>

</head>
<body class="bg-secondary">

	<div class="row mt-3">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body text-center">
					
					<h4>Sistema de controle de contas</h4>
					<p>Cadastre o seu usuário.</p>
					<hr/>
					
					<h5 class="text-success">${mensagem_sucesso}</h5>
					<h5 class="text-danger">${mensagem_erro}</h5>
					
					<form action="criar-usuario-post" method="post" id="formCadastro" class="text-start">
					
						<div class="mb-2">
							<label>Nome do usuário:</label>
							<input type="text" id="nome" name="nome" 
								class="form-control" placeholder="Digite seu nome aqui"/>
						</div>
						
						<div class="mb-2">
							<label>Email do usuário:</label>
							<input type="text" id="email" name="email"
								class="form-control" placeholder="Digite seu email aqui"/>
						</div>
						
						<div class="mb-2">
							<label>Senha do usuário:</label>
							<input type="password" id="senha" name="senha"
								class="form-control" placeholder="Digite sua senha aqui"/>
						</div>
						
						<div class="mb-2">
							<label>Confirme sua senha:</label>
							<input type="password" id="senhaConfirmacao" name="senhaConfirmacao"
								class="form-control" placeholder="Confirme sua senha aqui"/>
						</div>
						
						<div class="mb-2 d-grid">
							<input type="submit" class="btn btn-primary" value="Realizar Cadastro"/>
						</div>
						
						<div class="mb-2 d-grid">
							<a href="/javaContasMvc/" class="btn btn-light">
								Voltar para a página inicial.
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
			$("#formCadastro").validate({
				rules: {
					"nome" : {
						required : true,
						minlength: 8,
						maxlength: 150
					},
					"email" : {
						required: true,
						email: true
					},
					"senha" : {
						required : true,
						pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
					},
					"senhaConfirmacao" : {
						required: true,
						equalTo: "#senha"
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

