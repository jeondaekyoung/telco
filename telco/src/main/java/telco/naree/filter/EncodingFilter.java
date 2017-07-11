package telco.naree.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void destroy() {
		// 

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain filter) throws IOException, ServletException {
		// 
		req.setCharacterEncoding(encoding);
		resp.setContentType("text/html; charset="+encoding);
		filter.doFilter(req, resp);

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// 
		this.encoding = config.getInitParameter("encoding");

	}

}
