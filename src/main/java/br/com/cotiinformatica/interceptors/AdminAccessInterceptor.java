package br.com.cotiinformatica.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminAccessInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		//verificar se o usuário está navegando em alguma rota da pasta /admin
		if(request.getServletPath().toLowerCase().contains("/admin/")) {
			
			//verificando se o usuário não está autenticado (gravado em sessão)
			if(request.getSession().getAttribute("usuario_auth") == null) {
				
				//redirecionando para a página inicial do sistema
				response.sendRedirect("/javaContasMvc/");
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
