package flicc.config.mxml
{
	
import flicc.config.dependency.IDependency;
import flicc.config.dependency.ListDependency;

import mx.collections.ArrayCollection;
import mx.collections.ICollectionView;
	
[DefaultProperty("listDependencies")]

/**
 * An <code>IObjectDescriptor</code> used to describe an <code>Array</code> or 
 * <code>IList</code> implementation.
 * 
 * <p>
 * The ListDescriptor will take its child elements and create <code>IDependency
 * </code>s that will apply values on to a IList or an Array in the order they 
 * are declared. By default, the <code>ListDescriptor</code> will set the 
 * <code>clazz</code> property to <code>ArrayCollection</code>.
 * </p>
 * 
 * @mxml
 * <p>
 * The below example describes an <code>Array</code> with 2 elements, the first 
 * an instance of the object identified in the factory by the objectId 
 * "Class1Id" and the second an instance of the object identified by the 
 * objectId "Class2Id":
 * </p>
 *    
 * <pre>
 * 	&lt;ListDescriptor objectId="ArrayObjectDescriptorId" clazz="{ Array }"&gt;
 * 		&lt;Ref objectId="Class1Id" /&gt;
 *  	&lt;Ref objectId="Class2Id" /&gt;
 * 	&lt;/ListDescriptor&gt;
 * </pre>
 */  
public class ListDescriptor extends BaseMxmlObjectDescriptor
{
	/**
	 * An <code>Array</code> of values to be set on the created list.
	 * 
	 * <p>
	 * The <code>dependencies</code> implementation will take these values and
	 * create <code>IDependency</code>s that that apply the values to <code>
	 * clazz</code> in the order they are defined in this array. This property
	 * is defined as the mxml <code>DefaultProperty</code> so you do not need
	 * to explicitly set it. 
	 * </p>
	 *
	 * @see #clazz 
	 * @see #dependencies
	 */ 
	public var listDependencies : Array = [];
	
	public function ListDescriptor() 
	{
		clazz = ArrayCollection;
	}
	
	/**
	 * @inheritDoc
	 */ 
	override public function get dependencies() : ICollectionView
	{
		var deps : ArrayCollection = new ArrayCollection();
		
		for( var i : int = 0; i!=listDependencies.length; i++)
		{
			deps.addItem( new ListDependency( i, listDependencies[ i ] ) );
		}
		
		return deps;
	}
}

}