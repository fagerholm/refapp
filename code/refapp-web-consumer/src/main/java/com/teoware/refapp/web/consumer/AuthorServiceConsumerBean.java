package com.teoware.refapp.web.consumer;

import javax.ejb.EJB;

import com.teoware.refapp.service.AuthorService;
import com.teoware.refapp.service.ServiceException;
import com.teoware.refapp.service.dto.FindAuthorRequest;
import com.teoware.refapp.service.dto.FindAuthorResponse;
import com.teoware.refapp.service.dto.ListAuthorsResponse;
import com.teoware.refapp.service.dto.RegisterAuthorRequest;
import com.teoware.refapp.service.dto.RegisterAuthorResponse;
import com.teoware.refapp.service.validation.ValidationException;

public class AuthorServiceConsumerBean implements AuthorServiceConsumer {

	private static AuthorServiceConsumer instance;
	
	@EJB
	private AuthorService authorService;
	
	public static AuthorServiceConsumer getInstance() {
		if (instance == null) {
			instance = new AuthorServiceConsumerBean();
		}
		return instance;
	}

	@Override
	public RegisterAuthorResponse registerAuthor(RegisterAuthorRequest request) {
		try {
			return authorService.registerAuthor(request);
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public FindAuthorResponse findAuthor(FindAuthorRequest request) {
		return authorService.findAuthor(request);
	}

	@Override
	public ListAuthorsResponse listAuthors() {
		return authorService.listAuthors();
	}
}
