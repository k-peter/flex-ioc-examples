package flicc.error
{
	
public class FliccError extends Error
{
	public var cause : Error;
	
	public function FliccError( message : String, cause : Error = null )
	{
		super( message );
		this.cause = cause;
	}
}

}