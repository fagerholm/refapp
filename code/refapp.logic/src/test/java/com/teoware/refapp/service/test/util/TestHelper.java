package com.teoware.refapp.service.test.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.teoware.refapp.model.enums.Gender;
import com.teoware.refapp.service.message.RegisterAuthorRequest;
import com.teoware.refapp.service.util.BeanFactory;

public class TestHelper {

	public static RegisterAuthorRequest populateRegisterAuthorRequest() {
		return populateRegisterAuthorRequest(null);
	}

	public static RegisterAuthorRequest populateRegisterAuthorRequest(RegisterAuthorRequest request) {
		if (request == null) {
			request = BeanFactory.createRegisterAuthorRequestBean();
		}
		if (request.getBody() != null) {
			if (request.getBody().getAuthorId() != null) {
				request.getBody().getAuthorId().setUserName("johndoe");
			}
			if (request.getBody().getAuthorInfo() != null) {
				request.getBody().getAuthorInfo().setFirstName("John");
				request.getBody().getAuthorInfo().setLastName("Doe");
				request.getBody().getAuthorInfo().setBirthDate(createDate("01-01-1970"));
				request.getBody().getAuthorInfo().setGender(Gender.MALE);
				request.getBody().getAuthorInfo().setEmail("john.doe@mail.com");
				request.getBody().getAuthorInfo().setPhone("+123456789");
			}
			if (request.getBody().getAuthorAddress() != null) {
				request.getBody().getAuthorAddress().setAddress("Mystreet 1");
				request.getBody().getAuthorAddress().setPostalCode("1234");
				request.getBody().getAuthorAddress().setMunicipality("Mytown");
				request.getBody().getAuthorAddress().setRegion("Mycounty");
				request.getBody().getAuthorAddress().setCountry("Mycountry");
			}
		}
		return request;
	}

	public static Date createDate(String dateString) {
		return createDate(dateString, "dd-MM-yyyy");
	}

	public static Date createDate(String dateString, String dateFormat) {
		try {
			return new SimpleDateFormat(dateFormat).parse(dateString);
		} catch (ParseException e) {
			return new Date();
		}
	}
}