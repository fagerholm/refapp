package com.teoware.refapp.web.consumer;

import javax.ejb.EJB;

import com.teoware.refapp.service.ServiceException;
import com.teoware.refapp.service.dto.FindAuthorRequest;
import com.teoware.refapp.service.dto.FindAuthorResponse;
import com.teoware.refapp.service.dto.ListAuthorsResponse;
import com.teoware.refapp.service.dto.RegisterAuthorRequest;
import com.teoware.refapp.service.dto.RegisterAuthorResponse;
import com.teoware.refapp.service.facade.AuthorServiceFacade;
import com.teoware.refapp.service.validation.ValidationException;
import com.teoware.refapp.web.consumer.error.ErrorHandler;
import com.teoware.refapp.web.consumer.error.ValidationHandler;
import com.teoware.refapp.web.consumer.vo.AuthorListVO;
import com.teoware.refapp.web.consumer.vo.AuthorVO;
import com.teoware.refapp.web.consumer.vo.FindAuthorRequestVO;
import com.teoware.refapp.web.consumer.vo.RegisterAuthorRequestVO;
import com.teoware.refapp.web.consumer.vo.RegisterAuthorResponseVO;

public class AuthorServiceConsumerBean implements AuthorServiceConsumer {

	@EJB
	private AuthorServiceFacade authorServiceFacade;

	@Override
	public RegisterAuthorResponseVO registerAuthor(RegisterAuthorRequestVO vo) {
		try {
			RegisterAuthorRequest request = new RegisterAuthorRequest(vo.getAuthor(), vo.getAuthorPassword());
			RegisterAuthorResponse response = authorServiceFacade.registerAuthor(request);
			return new RegisterAuthorResponseVO(response.getBody());
		} catch (ValidationException e) {
			ValidationHandler.handle(e);
		} catch (ServiceException e) {
			ErrorHandler.handle(e);
		}
		return null;
	}

	@Override
	public AuthorVO findAuthor(FindAuthorRequestVO vo) {
		try {
			FindAuthorRequest request = new FindAuthorRequest();
			FindAuthorResponse response = authorServiceFacade.findAuthor(request);
			return new AuthorVO(response.getBody());
		} catch (ValidationException e) {
			ValidationHandler.handle(e);
		} catch (ServiceException e) {
			ErrorHandler.handle(e);
		}
		return null;
	}

	@Override
	public AuthorListVO listAuthors() {
		try {
			ListAuthorsResponse response = authorServiceFacade.listAuthors();
			return new AuthorListVO(response.getAuthorList());
		} catch (ServiceException e) {
			ErrorHandler.handle(e);
		}
		return null;
	}
}
