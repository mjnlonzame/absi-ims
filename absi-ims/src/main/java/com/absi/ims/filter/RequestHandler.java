package com.absi.ims.filter;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.catalina.util.ParameterMap;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
//@Component
public class RequestHandler implements Filter{

	private static final String TRANSFER_ENCODING = "Transfer-Encoding";
	private static final String CHUNKED = "chunked";

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String header = ((HttpServletRequest) request).getHeader(TRANSFER_ENCODING);
		
		InputStream is = null;
		try{
			if(header != null && header.equals(CHUNKED)){
				//time to work our magic

				((ParameterMap)request.getParameterMap()).setLocked(false);
				is = request.getInputStream();

				//read the body as a map
				Properties props = new Properties();
				props.load(is);
				
				//get the encoding to use for url-decoding
				String enc = request.getCharacterEncoding();
				if(enc == null){
					enc = "UTF-8";
				}

				for(Entry e : props.entrySet()){
					
					String key = (String) e.getKey();

					//need to decode it!
					key = URLDecoder.decode(key, enc);
					
					if(!request.getParameterMap().containsKey(key)){
						String[] valArray = {};
						String val = (String) e.getValue();

						//need to decode it!
						val = URLDecoder.decode(val, enc);
						valArray[0] = val;
						request.getParameterMap().put(key, valArray);
					}
				}
			}				
				
			((ParameterMap)request.getParameterMap()).setLocked(true);
				
		}finally{
			if(is != null) is.close();
		}
		
	}

	

}
