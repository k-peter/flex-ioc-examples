package flicc.config.mxml
{
	
import flicc.config.dependency.IDependency;
import flicc.config.dependency.PropertyDependency;

import mx.collections.ArrayCollection;
import mx.collections.ICollectionView;

/**
 * An IObjectDescriptor to be used in mxml.
 * 
 * <p>
 * The <code>ObjectDescriptor</code> allows <code>IDependency</code>s to be 
 * defined by setting dynamic properties, where the property name will treated 
 * as the property name on <code>clazz</code>, and the value as the value to be 
 * set. 
 * </p>
 * 
 * @mxml
 * <p>
 * The below example describes an object of type <code>MyClass</code> that 
 * contains 2 dependencies: <em>myString</em> is set to "aString" and 
 * <em>myOtherObject</em> contains a reference to another <code>
 * IObjectDescriptor</code> within the same <code>
 * IObjectFactoryConfiguration</code>:
 * </p>
 * 
 * <pre>
 * 	&lt;ObjectDescriptor objectId="myObjectId" clazz="{ MyClass }"&gt;
 * 		&lt;myString&gt;aString&lt;/myString&gt;
 *  	&lt;myOtherObject&gt;&lt;Ref objectId="someObjectId" /&gt;&lt;/myOtherObject&gt;
 * 	&lt;/ObjectDescriptor&gt;
 * </pre>  
 *
 * @see #dependencies  
 * @see flicc.config.dependency.IDependency#value
 */ 
public dynamic class ObjectDescriptor extends BaseMxmlObjectDescriptor
{
	/**
	 * @inheritDoc
	 */ 
  	override public function get dependencies() : ICollectionView
  	{
  		var dependencyCollection : ArrayCollection = new ArrayCollection();
		
		for( var propertyName : String in this )
		{
			var dependency : IDependency = 
					new PropertyDependency( propertyName, this[ propertyName ] );
			
			dependencyCollection.addItem( dependency );
		}
		
		return dependencyCollection;
  	}	
}

}