package ac.iocsample.populatedomain.model.pm
{
	
	[Bindable]
	public class OtherPM
	{
		
		public var backend : Object;
		
		public function OtherPM( backend : Object )
		{
			this.backend = backend;
		}

	}
}