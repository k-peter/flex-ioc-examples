package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.model.domain.Account;
	
	
	[Bindable]
	public class OtherPM
	{
		
		public var account : Account;
		
		public function OtherPM( account : Account )
		{
			this.account = account;
		}

	}
}