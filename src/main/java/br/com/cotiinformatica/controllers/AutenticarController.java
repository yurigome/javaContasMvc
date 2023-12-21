package br.com.cotiinformatica.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.helpers.Sha1CryptoHelper;
import br.com.cotiinformatica.repositories.UsuarioRepository;

@Controller
public class AutenticarController {

	//mapeando a URL (rota) para exibir a página
	@RequestMapping(value = "/")
	public ModelAndView autenticar() {
		//definindo o nome da página que será exibida no navegador
		//WEB-INF/views/autenticar.jsp
		ModelAndView modelAndView = new ModelAndView("autenticar");
		return modelAndView;
	}	
	
	//método que irá receber a requisição POST (SUBMIT) do formulário
	@RequestMapping(value = "/autenticar-post", method = RequestMethod.POST)
	public ModelAndView autenticarPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("autenticar");
		
		try {
			
			//capturar o email e senha enviados pelo formulário
			String email = request.getParameter("email");
			String senha = Sha1CryptoHelper.getSha1Encrypt(request.getParameter("senha"));
			
			//consultando o usuário no banco de dados
			UsuarioRepository usuarioRepository = new UsuarioRepository();
			Usuario usuario = usuarioRepository.find(email, senha);
			
			//verificar se o usuário foi encontrado
			if(usuario != null) {
				
				//gravar os dados do usuário em sessão
				request.getSession().setAttribute("usuario_auth", usuario);
				
				//redirecionar para a página do dashboard
				modelAndView.setViewName("redirect:/admin/dashboard");
			}
			else {
				throw new Exception("Acesso negado. Usuário inválido.");
			}
		}
		catch(Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		
		//apagar os dados do usuário na sessão
		request.getSession().removeAttribute("usuario_auth");
		
		//redirecionar de volta para o raiz do projeto (página de autenticação)
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/");
		return modelAndView;
	}	
}



