package br.com.cotiinformatica.controllers;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Conta;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.repositories.ContaRepository;

@Controller
public class DashboardController {

	/*
	 * Mapeamento da rota para abrir a página
	 */
	@RequestMapping(value = "/admin/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		//WEB-INF/views/admin/dashboard.jsp
		ModelAndView modelAndView = new ModelAndView("admin/dashboard");
		
		try {
			
			//capturar os dados do usuário autenticado
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");
			
			//capturar o mês e o ano atual
			Calendar calendar = Calendar.getInstance();
			Integer mes = calendar.get(Calendar.MONTH) + 1;
			Integer ano = calendar.get(Calendar.YEAR);
			
			//capturar o primeiro dia do mês
			Calendar primeiroDia = Calendar.getInstance();
			primeiroDia.set(ano, mes - 1, 1);
			
			//capturar o ultimo dia do mês
			Calendar ultimoDia = Calendar.getInstance();
			ultimoDia.set(ano, mes - 1, primeiroDia.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			//consultar as contas do usuário dentro do periodo de datas
			ContaRepository contaRepository = new ContaRepository();
			List<Conta> lista = contaRepository.find(primeiroDia.getTime(), ultimoDia.getTime(), usuario.getIdUsuario());
			
			//calcular os dados que serão exibidos nbo dashboard
			Double totalContasReceber = 0.0;
			Double totalContasPagar = 0.0;
			Double saldo = 0.0;
			String situacao = "";
			
			for(Conta conta : lista) {
				if(conta.getTipo() == 1) //conta a receber
					totalContasReceber += conta.getValor();
				else if(conta.getTipo() == 2) //conta a pagar
					totalContasPagar += conta.getValor();
			}
			
			saldo = totalContasReceber - totalContasPagar;
			if(saldo > 0)
				situacao = "Saldo positivo";
			else if(saldo < 0)
				situacao = "Saldo devedor";
			else
				situacao = "Saldo nulo";
			
			//enviando as variáveis para a página
			modelAndView.addObject("dataAtual", calendar.getTime());
			modelAndView.addObject("totalContasReceber", totalContasReceber);
			modelAndView.addObject("totalContasPagar", totalContasPagar);
			modelAndView.addObject("saldo", saldo);
			modelAndView.addObject("situacao", situacao);
		}
		catch(Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
	
}
