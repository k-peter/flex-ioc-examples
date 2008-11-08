package ac.iocsample.populatedomain.model.domain
{
	public class PopulateDomainModelLocator
	{
		public var backend : Account = new Account();
		
		private static var instance : PopulateDomainModelLocator;
		
		public function PopulateDomainModelLocator()
		{
			if( instance != null ) 
			{
				throw new Error("use getInstance instead" );
			}
		}
		
		public static function getInstance() : PopulateDomainModelLocator
		{
			if( instance == null )
			{
				instance = new PopulateDomainModelLocator();
			}
			return instance;
		}

	}
}