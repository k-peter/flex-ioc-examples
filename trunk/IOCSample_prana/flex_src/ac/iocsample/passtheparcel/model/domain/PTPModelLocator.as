package ac.iocsample.passtheparcel.model.domain
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	[Bindable]
	public class PTPModelLocator implements ModelLocator
	{
		private static var instance : PTPModelLocator;
		
		public var parcel : Parcel = new Parcel( "A box of sweets" );
		
		public function PTPModelLocator()
		{
			if( instance != null )
			{
				throw new Error( "use getInstance instead" );
			}
		}
		
		public static function getInstance() : PTPModelLocator
		{
			if( instance == null )
			{
				instance = new PTPModelLocator();
			}
			return instance;
		}

	}
}