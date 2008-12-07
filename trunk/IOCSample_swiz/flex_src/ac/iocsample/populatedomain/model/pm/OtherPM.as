package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.model.domain.Account;
	
	[Bindable]
	public class OtherPM
	{
		
		public var backend : Account;
		
		public function OtherPM( backend : Account )
		{
			this.backend = backend;
		}

	}
}