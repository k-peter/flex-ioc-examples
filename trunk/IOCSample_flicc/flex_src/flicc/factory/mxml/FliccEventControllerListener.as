package flicc.factory.mxml
{
	import com.adobe.cairngorm.control.FrontController;
	
	public class FliccEventControllerListener
	{
		public var factory : IObjectFactory;

		private var _controller : FrontController;

		public function FliccEventControllerListener()
		{
		
		}
		
		public function set controller( value : FrontController ) : void
		{
			if( value != null )
			{
				_controller = value;
				
			}
		}

	}
}