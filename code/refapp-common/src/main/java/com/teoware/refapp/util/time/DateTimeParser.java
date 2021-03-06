package com.teoware.refapp.util.time;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class DateTimeParser {

	public static final DateTimeFormatter DATE_FORMATTER = ISODateTimeFormat.date();
	public static final DateTimeFormatter TIME_FORMATTER = ISODateTimeFormat.time();
	public static final DateTimeFormatter DATETIME_FORMATTER = ISODateTimeFormat.dateTime();
	public static final String DATE_PATTERN = "yyyy-MM-dd";
	public static final String TIME_PATTERN = "HH:mm:ss";
	public static final String DATETIME_PATTERN = DATE_PATTERN + "'T'" + TIME_PATTERN;
	public static final String DATETIME_MILLIS_PATTERN = DATETIME_PATTERN + ".SSS";
	public static final String DATETIME_ZONE_PATTERN = DATETIME_PATTERN + "Z";
	public static final String DATETIME_FULL_PATTERN = DATETIME_PATTERN + ".SSSZ";

	public static DateTime stringToDateTime(String dateString, String pattern) {
		DateTimeFormatter formatter = DateTimeFormat.forPattern(pattern);
		return stringToDateTime(dateString, formatter);
	}

	public static String dateTimeToString(DateTime dateTime, String pattern) {
		DateTimeFormatter formatter = DateTimeFormat.forPattern(pattern);
		return dateTimeToString(dateTime, formatter);
	}

	public static DateTime stringToDateTime(String dateString, DateTimeFormatter formatter) {
		return formatter.parseDateTime(dateString);
	}

	public static String dateTimeToString(DateTime dateTime, DateTimeFormatter formatter) {
		return formatter.print(dateTime.getMillis());
	}
}
