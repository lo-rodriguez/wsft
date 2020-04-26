/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ronasoft.wsfamilytracking.common;

import com.google.gson.Gson;
import java.text.SimpleDateFormat;

/**
 *
 * @author lrodriguezn
 */
public class ParentControllerService {

	// Constantes de la aplicacion
	public ParentControllerService() {
	}

	/**
	 * Format date in BZK
	 */
	public static final String FORMAT_DATE = "dd/MM/yyyy";
	public static final String DATE_NULL = "31/12/2999";
	public static final String DDMMYYYY_HHMMSS_24h = "dd/MM/yyyy".concat(" ").concat("HH:mm:ss");
	/**
	 * General constants
	 */
	protected static final String LOCATION = System.getProperty("LOCATION_PHOTO") == null
			? System.getenv("LOCATION_PHOTO")
			: System.getProperty("LOCATION_PHOTO"); // Temporary location where files will be stored
	protected static final String LOCATION_PDF = System.getProperty("LOCATION_FILE_PDF") == null
			? System.getenv("LOCATION_FILE_PDF")
			: System.getProperty("LOCATION_FILE_PDF"); // Temporary location where files will be stored
	protected static final String PDF = "pdf";

	public static final long getMaxFileSize() {
		try {

			return System.getProperty("MAX_FILE_SIZE") == null ? Long.parseLong(System.getenv("MAX_FILE_SIZE"))
					: Long.parseLong(System.getProperty("MAX_FILE_SIZE"));// 5242880; // 5MB : Max file size.
		} catch (NumberFormatException e) {
		}
		return 5242880l;
	}
	protected static final String TYPE_PRODUCTS="typeProducts";
	protected static final String KEY_MAX_FILE_SIZE = "keyMaxFileSize";
	public static final int BUFFER_SIZE = 1024;
	protected static final String MESSAGE_ALERT_SIZE_PHOTO = "dashboard.student.alert.photo.size";
	protected static final String KEY_MESSAGE_ALERT_SIZE_PHOTO = "messageAlertSizePhoto";
	protected static final String MESSAGE_ALERT_ADD_STUDENT = "dashboard.student.addstudent.form.inscription";
	protected static final String KEY_MESSAGE_ALERT_ADD_STUDENT = "messageAlertAddStudent";
	protected static final String MESSAGE_ALERT_EDIT_STUDENT = "dashboard.student.addstudent.form.edit";
	protected static final String MESSAGE_PAYMENT_OK = "message.payment.ok";
	protected static final String MESSAGE_ERROR_AUTHENTICATION = "login.error.user.authentication";
	protected static final String MESSAGE_ERROR_SESSION = "error.payment.session";
	protected static final String LIST_ERR = "listError";
	protected static final String ERROR_EMAIL_STUDENT = "dashboard.student.validEmail";
	protected static final String ERROR_DUPLICATE_PAYMENT = "dashboard.payment.form.valid.duplicatePayment";
	protected static final String REGISTRATION_DATE = "dashboard.student.editstudent.registrationDate";
	protected static final String REGISTRATION_DATE_ATRIBUTE = "registrationDate";
	protected final static Gson gson = new Gson();
	public static final String LOCATION_FILE_SQL = System.getProperty("LOCATION_FILE_SQL") == null
			? System.getenv("LOCATION_FILE_SQL")
			: System.getProperty("LOCATION_FILE_SQL");
    public static final String SECREPT_PATH = System.getProperty("SECREPT_PATH") == null? System.getenv("SECREPT_PATH")
    		: System.getProperty("SECREPT_PATH");
    
	public final static String QUERY_FILE_NAME = "wsftb-query.xml";
	/**
	 * SQL OF REPORTS
	 */
	protected static final String SQL_STUDENTS_STATUS_1 = "SQL001";
	protected static final String SQL_RECEIPTS_REPORT = "SQL002";
	protected static final String SQL_RECEIPTS_REPORT_FOOD = "SQL003";
	protected static final String SQL_REPORT_FOR_DOWNLOAD = "SQL004";
	protected static final String SQL_REPORT_FOR_DOWNLOAD_FOOD = "SQL005";
	protected static final String SQL_ADMINISTRATIVE_REPORT = "SQL006";
	protected static final String SQL_ADMINISTRATIVE_REPORT_FOOD = "SQL007";
	protected static final String SQL_STATE_STUDENTS = "SQL008";
	protected static final String SQL_STATE_STUDENTS_FOOD = "SQL009";
	protected static final String SQL_PAYMENT_HISTORY_BY_STUDENT = "SQL010";
	protected static final String SQL_PAYMENT_HISTORY_BY_STUDENT_FOOD = "SQL012";
	protected static final String SQL_PAYMENT_HISTORY_BY_STUDENT_CARD = "SQL011";
	protected static final String SQL_CHART_TYPES_PAYMENT_VS_YEARS = "SQL013";
	protected static final String SQL_GET_TYPES_PRODUCTS = "SQL014";
	protected static final String SQL_STATE_STUDENTS_FOOD_NOT_ACTIVE="SQL015";


	
	protected static final String ENABLE_ABOUT = "aboutEnable";
	protected static final String APP_VERSION = "appVersion";
	protected static final String APP_DEVELOPER = "developer";
	protected static final String APP_LICENCE = "licence";

}
