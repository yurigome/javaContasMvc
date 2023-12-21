<nav class="navbar navbar-expand-lg navbar-primary bg-primary">
    <div class="container">
        <a class="navbar-brand text-light" href="#">
        	<strong>Controle Financeiro</strong>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link text-light" 
                    	href="/javaContasMvc/admin/dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" 
                    	href="/javaContasMvc/admin/cadastro-contas">Cadastrar Contas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" 
                    	href="/javaContasMvc/admin/consulta-contas">Consultar Contas</a>
                </li>
            </ul>
            <div class="d-flex">
                <span class="text-light me-3 mt-1">
					<strong>${usuario_auth.nome}</strong> | ${usuario_auth.email}
				</span> 
                <a href="/javaContasMvc/logout"
                	onclick="return confirm('Deseja realmente sair do sistema?');" 
                	class="btn btn-sm btn-outline-light">
                	Sair do Sistema
                </a>
            </div>
        </div>
    </div>
</nav>