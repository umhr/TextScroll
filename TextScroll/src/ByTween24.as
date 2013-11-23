package  
{
	
	import a24.tween.Ease24;
	import a24.tween.Tween24;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByTween24 extends Sprite 
	{
		private var _textField:TextField;
		private var _speed:Number;
		public function ByTween24(speed:Number) 
		{
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
			
			_textField = new TextField();
			_textField.defaultTextFormat = new TextFormat(new Migu1C_Regular_DF3().fontName, 80, 0xFFFFFF);
			_textField.text = "ゆく河の流れは絶えずして、しかももとの水にあらず。";
			_textField.embedFonts = true;
			_textField.width = _textField.textWidth;
			_textField.mouseEnabled = false;
			_textField.cacheAsBitmap = true;
			addChild(_textField);
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			doTween();
		}
		
		private function doTween():void 
		{
			var time:Number = (_textField.width + stage.stageWidth) / _speed;
			var fromX:Number =  stage.stageWidth;
			var toX:Number =  -_textField.textWidth;
			
			Tween24.loop(0, 
				Tween24.prop(_textField).x(fromX),
				Tween24.tween(_textField, time, Ease24._Linear).x(toX)
				).play();
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			Tween24.disposeIdTween();
			
			removeChild(_textField);
		}
		
	}
	
}