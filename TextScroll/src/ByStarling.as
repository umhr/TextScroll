package  
{
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import starling.core.Starling;
	import starling.MainView;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByStarling extends Sprite 
	{
		private var _starling:Starling;
		private var _speed:Number;
		private var _isInt:Boolean;
		private var _txInt:int = 0;
		private var _txNumber:Number = 0;
		public function ByStarling(speed:Number, isInt:Boolean) 
		{
			_isInt = isInt;
			_speed = speed;
			init();
		}
		private function init():void 
		{
			if (stage) onInit();
			else addEventListener(Event.ADDED_TO_STAGE, onInit);
		}

		private function onInit(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			// entry point
			
			var textField:TextField = new TextField();
			textField.defaultTextFormat = new TextFormat(new IPAexm00201_DF3().fontName, 80, 0xFFFFFF);
			textField.text = "森鴎麒麟淡麗蒙殲滅懺癇謬癪爵健康優薔薇瑠璃";
			textField.embedFonts = true;
			textField.width = textField.textWidth;
			
			MainView.bitmapData = new BitmapData(textField.width, textField.height, false, 0x00000000);
			MainView.bitmapData.draw(textField);
			textField = null;
			
			MainView.speed = _speed;
			MainView.frameRate = stage.frameRate;
			MainView.stageWidth = stage.stageWidth;
			MainView.isInt = _isInt;
			_starling = new Starling(MainView, stage, null, null);
            _starling.enableErrorChecking = false;
            _starling.start();
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			_starling.dispose();
		}
	}
	
}