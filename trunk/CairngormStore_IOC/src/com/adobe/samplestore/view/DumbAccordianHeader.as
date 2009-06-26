package com.adobe.samplestore.view
{

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;

import mx.containers.accordionClasses.AccordionHeader;
import mx.core.IDataRenderer;
import mx.core.IFlexDisplayObject;
import mx.core.mx_internal;
import mx.styles.ISimpleStyleClient;

use namespace mx_internal;


public class DumbAccordianHeader extends AccordionHeader
{

	public function DumbAccordianHeader()
	{
		super();
	}

	override protected function rollOverHandler(event:MouseEvent):void
	{
	}
	
	
}

}
