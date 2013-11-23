package  
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.tweens.ITween;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByBetweenAS3 extends Sprite 
	{
		private var _textField:TextField;
		private var _t:ITween;
		private var _speed:Number;
		public function ByBetweenAS3(speed:Number) 
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
			
			_t = BetweenAS3.tween(_textField, { x: toX }, { x:fromX }, time);
			_t.stopOnComplete = false;
			_t.play();
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			if (_t != null) {
				_t.stop();
			}
			
			removeChild(_textField);
		}
		
	}
	
}