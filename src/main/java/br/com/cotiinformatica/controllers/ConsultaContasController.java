package br.com.cotiinformatica.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Conta;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.repositories.ContaRepository;

@Controller
public class ConsultaContasController {

	@RequestMapping(value = "/admin/consulta-contas")
	public ModelAndView consultaContas() {
		ModelAndView modelAndView = new ModelAndView("admin/consulta-contas");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/consulta-contas-post", method = RequestMethod.POST)
	public ModelAndView consultaContasPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("/admin/consulta-contas");
		
		try {
			
			//capturando o usuário autenticado na sessão
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");
			
			String dataMin = request.getParameter("dataMin");
			String dataMax = request.getParameter("dataMax");
			
			Date filtroDataMin = new SimpleDateFormat("yyyy-MM-dd").parse(dataMin);
			Date filtroDataMax = new SimpleDateFormat("yyyy-MM-dd").parse(dataMax);
			
			//fazendo a consulta no banco de dados
			ContaRepository contaRepository = new ContaRepository();
			List<Conta> contas = contaRepository.find(filtroDataMin, filtroDataMax, usuario.getIdUsuario());
			
			//enviando dados de volta para a página
			modelAndView.addObject("contas", contas);
			modelAndView.addObject("dataMin", dataMin);
			modelAndView.addObject("dataMax", dataMax);
		}
		catch(Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/exclusao-contas", method = RequestMethod.GET)
	public ModelAndView exclusaoContas(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("admin/consulta-contas");
		
		try {
			
			//resgatando os dados enviados pela URL (QueryString)
			Integer idConta = Integer.parseInt(request.getParameter("idConta"));
			String dataMin = request.getParameter("dataMin");
			String dataMax = request.getParameter("dataMax");
			
			//capturando o usuário autenticado no sistema
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");
			
			//capturando a conta através do ID
			ContaRepository contaRepository = new ContaRepository();
			Conta conta = contaRepository.findById(idConta);
			
			//verificando se a conta existe e se pertence ao usuário
			if(conta != null && conta.getIdUsuario() == usuario.getIdUsuario()) {
				
				//excluindo a conta
				contaRepository.delete(conta.getIdConta());		
				
				modelAndView.addObject("mensagem_sucesso", "Conta excluída com sucesso.");
				
				Date filtroDataMin = new SimpleDateFormat("yyyy-MM-dd").parse(dataMin);
				Date filtroDataMax = new SimpleDateFormat("yyyy-MM-dd").parse(dataMax);
				
				//fazendo uma nova consulta no banco de dados
				List<Conta> contas = contaRepository.find(filtroDataMin, filtroDataMax, usuario.getIdUsuario());
				
				//enviando dados de volta para a página
				modelAndView.addObject("contas", contas);
				modelAndView.addObject("dataMin", dataMin);
				modelAndView.addObject("dataMax", dataMax);
			}			
		}
		catch(Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
}










