package telco.naree.exception;

public class TelcoWebException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8040732737971037031L;

	public TelcoWebException(String message){
		super(message, null, false, false);
	}
	
	public TelcoWebException(Exception exception){
		super(exception.getClass().getName() + " : " + exception.getMessage(), null, false, false);
	}
}
