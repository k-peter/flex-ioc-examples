package flicc.config.mxml
{
	
import mx.collections.ICollectionView;
import mx.utils.StringUtil;

[DefaultProperty("simpleValues")]

/**
 * An extension of <code>ListDescriptor</code> that allows a list of numeric or
 * string values to be described as a comma delimited list.
 * 
 * <p>
 * Rather than use <code>ListDescriptor</code> with <code>&lt;mx:String&gt;
 * </code> or <code>&lt;mx:Number&gt;</code>, you can specificy a comma 
 * delimited string as the direct child of this tag when used in mxml.
 * </p>
 * 
 * @mxml
 * <pre>
 * 	&lt;Simple objectId="listId"&gt;
 * 		One,Two,Three
 * 	&lt;/SimpleList&gt;
 * </pre> 
 */ 
public class SimpleList extends ListDescriptor
{
	public var simpleValues : String;
	
	override public function get dependencies() : ICollectionView
	{
		listDependencies = []
		
		for each( var sub : String in simpleValues.replace( /\n/, "" ).split( "," ) )
		{
			listDependencies.push( StringUtil.trim( sub ) );
		}
		
		return super.dependencies;	
	} 
}

}