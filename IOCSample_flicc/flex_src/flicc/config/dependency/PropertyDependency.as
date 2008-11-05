package flicc.config.dependency
{

import flicc.error.FliccError;

/**
 * Describes a dependency to be applied to a publicly exposed property or setter
 * on a target object.
 * 
 * <p>
 * Unless creating your own <code>IObjectDescriptor</code> implementation, or
 * sub-classing <code>MxmlObjectDescriptor</code> then you will not need to 
 * instantiate this class directly. The <code>ObjectDescriptor</code> class
 * will do this for you.
 * </p>
 * 
 * @see flicc.config.mxml.ObjectDescriptor#dependencies
 */ 
public class PropertyDependency implements IDependency
{      
	private var _name : String;
	private var propertyValue : *;
	
	/**
	 * Create a new PropertyDependency
	 * 
	 * @param name The name of the property or setter on which the value is to 
	 * be applied
	 * @param value The value to be applied to <code>property</code>
	 * 
	 * @see #value 
	 */   
  	public function PropertyDependency( name : String, value : Object )
  	{
  		this._name = name;
  		this.propertyValue = value;	
  	}
  	
  	/**
  	 * @inheritDoc
  	 */ 
	public function get value() : *
  	{
 		return propertyValue;
  	}
  	
  	/**
  	 * The name of the property that <code>value</code> will be set on when
  	 * this dependency is applied.
  	 */
  	public function get name() : String
  	{
  		return _name;	
  	}

  	/**
  	 * Applies <code>value</code> to the property provided in the constructor.
  	 * 
  	 * <p>
  	 * The property must be public and accessible through the square brakcets
  	 * (<code>instance[propertyName]</code>) notation.
  	 * </p>.
  	 */ 
  	public function apply( value : *, instance : Object ) : void
  	{
  		try
  		{
		
		//Move this in to its own IDependency implementation
		if( instance[ _name ] is Function )
     	{
     		instance[ _name ].call( instance, value );	
     	}   
     	else
     	{  
        	instance[ _name ] = value;
      	}
  	
  		}  
		catch( e : Error ) 
		{
			throw new FliccError( "Error trying to apply value ( " + 
				"" + value + " ) on to instance ( " + instance + "):" + e.message, e );			
		}
	}
}

}