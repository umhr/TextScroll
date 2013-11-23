package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.UncaughtErrorEvent;
	import net.hires.debug.Stats;
	
	/**
	 * ...
	 * @author umhr
	 */
	[SWF(width = 592, height = 300, backgroundColor = 0x000000, frameRate = 60)]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			addChild(new Canvas());
			
			loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorEvents_uncaughtError);
		}
		
		private var _prevMessage:String = "";
		private function uncaughtErrorEvents_uncaughtError(event:UncaughtErrorEvent):void 
		{
			var teemp:String = event.errorID +"," + event.type + "," + event.error;
			if (_prevMessage != teemp) {
				trace(event.errorID, event.type, event.error);
				trace("PrintScreen!");
				_prevMessage = teemp;
			}
			//e.preventDefault();
		}
		
	}
	
}