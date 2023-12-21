<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Contas - Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

</head>
<body>

	<!-- componente do menu do sistema -->
	<jsp:include page="/WEB-INF/views/admin/components/menu.jsp"></jsp:include>

	<div class="container mt-3">
		
		<h4>Dashboard principal</h4>
		<p>Seja bem vindo ao sistema.</p>
		
		<div class="row mb-5">
			<div class="col">
				
				<p>
					<strong>
						Resumo financeiro de  
						<fmt:formatDate value="${dataAtual}" pattern="MMM/yyyy"/>
					</strong>
				</p>
				
				<table class="table table-sm table-bordered">
					<tbody>
						<tr>
							<td>Total de contas a receber:</td>
							<td>
								<fmt:formatNumber value="${totalContasReceber}"
								 currencySymbol="R$" type="currency"/>
							</td>
						</tr>
						<tr>
							<td>Total de contas a pagar:</td>
							<td>
								<fmt:formatNumber value="${totalContasPagar}"
								 currencySymbol="R$" type="currency"/>
							</td>
						</tr>
						<tr>
							<td>Saldo:</td>
							<td>
								<fmt:formatNumber value="${saldo}"
								 currencySymbol="R$" type="currency"/>
							</td>
						</tr>
						<tr>
							<td>Situação:</td>
							<td>${situacao}</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col">
				<div id="grafico"></div>
			</div>
		</div>
		
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Highcharts JS -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	
	<script>
		Highcharts.chart('grafico', {
        	chart: {
            	type: 'pie'
        	},
        	title: {
            	text: 'Contas a Pagar e a Receber'
        	},
        	series: [{
            	name: 'Contas',
            	data: [{
                	name: 'Contas a Pagar',
                	y: ${totalContasPagar},
                	sliced: true,
                	selected: true
            	}, {
                	name: 'Contas a Receber',
                	y: ${totalContasReceber},
            	}]
        	}]
    	});
	</script>
	
</body>
</html>