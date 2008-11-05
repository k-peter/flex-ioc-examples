package flicc.config.dependency
{

import flicc.error.FliccError;

import mx.collections.IList;

/**
 * Describes a dependency to be applied to a <code>IList</code> or an <code>
 * Array</code> instance.
 * 
 * <p>
 * Unless creating your own <code>IObjectDescriptor</code> implementation, or
 * sub-classing <code>MxmlObjectDescriptor</code> then you will not need to 
 * instantiate this class directly. The <code>ListDescriptor</code> class
 * will do this for you.
 * </p>
 * 
 * @see flicc.config.mxml.ListDescriptor#dependencies 
 */ 
public class ListDependency implements IDependency
{      
	private var _index : Number = -1;
    private var _value : *;
  
  	/**
  	 * Create a new ListDependency
  	 * 
  	 * @param index The index at which the value is to be set on the target
  	 * object. 
  	 * @param value The value to be set.
  	 * 
  	 * @see #value   
  	 */ 
  	public function ListDependency( index : Number, value : Object )
  	{
  		this._index = index;
  		this._value = value;	
  	}
  	
  	/**
  	 * @inheritDoc 
  	 */  
	public function get value() : *
  	{
    	return _value;
  	}
  	
  	/**
  	 * The index that that <code>value</code> will be set at when this 
  	 * dependency is applied.
  	 */ 
  	public function get index() : Number
  	{
  		return _index;
  	}
  
  	/**
  	 * Applies <code>value</code> to <code>instance</code> at the position
  	 * specified in the constructor. 
  	 * 	
  	 * <p>
  	 * If instance is an <code>Array</code>, the provided value will be directly 
  	 * applied at the provided index using the square brackets notation.
  	 * </p>
  	 * 
  	 * <p>
  	 * If instance is an <code>IList</code> then the item will be added using 
  	 * <code>setItemAt</code>. If the <code>IList</code> is not long enough, 
  	 * null items are added to "pad" the list to the required size.
  	 * </p>
  	 * 
  	 * @throws flicc.error.FliccError if instance is neither an <code>IList</code> or an
  	 * <code>Array</code>.  
  	 */
	public function apply( value : *, instance : Object ) : void
  	{
  		try
  		{
        
	       	if( instance is IList )
	        {
	           var instanceAsList : IList = IList( instance );
	              
	           while( instanceAsList.length <= _index )
	           {
	              instanceAsList.addItem( null );
	           }
	                 
	           instanceAsList.setItemAt( value, _index );  
	        }
	        else if( instance is Array )
	        {
	           instance[ _index ] = value;  
	        }
	        else
	        {
	        	throw new FliccError( 
	        			"Provided instance ( " + instance + " ) must be an " + 
	        			"Array or implementation of IList for a index based " + 
	        			"Dependency." 
	        	);
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