package com.teoware.refapp.service.mock;

import com.teoware.refapp.service.AuthorServiceLocal;
import com.teoware.refapp.service.message.RegisterAuthorRequest;
import com.teoware.refapp.service.message.RegisterAuthorResponse;

public class AuthorServiceMock implements AuthorServiceLocal {

	private static final long serialVersionUID = 1L;

	@Override
	public RegisterAuthorResponse registerAuthor(RegisterAuthorRequest authorCreateRequest) {
		return null;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}
}