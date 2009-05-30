package com.adobe.ioc.smartypants
{
	import mx.core.IMXMLObject;

	public class BeansHolder implements IMXMLObject
	{
		
		public function initialized(document:Object, id:String):void
		{
			trace("beans holder initialized" );
			
		}
		
	}
}