package ac.iocsample.populatedomain.model.domain
{
	public class BackendModelLocator
	{
		public var backend : Account = new Account();
		
		private static var instance : BackendModelLocator;
		
		public function BackendModelLocator()
		{
			if( instance != null ) 
			{
				throw new Error("use getInstance instead" );
			}
		}
		
		public static function getInstance() : BackendModelLocator
		{
			if( instance == null )
			{
				instance = new BackendModelLocator();
			}
			return instance;
		}

	}
}