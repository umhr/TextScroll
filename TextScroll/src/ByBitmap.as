package  
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByBitmap extends Sprite 
	{
		private var _bitmap:Bitmap;
		private var _speed:Number;
		public function ByBitmap(speed:Number) 
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
			
			var textField:TextField = new TextField();
			textField.defaultTextFormat = new TextFormat(new Migu1C_Regular_DF3().fontName, 80, 0xFFFFFF);
			textField.text = "ゆく河の流れは絶えずして、しかももとの水にあらず。";
			textField.embedFonts = true;
			textField.width = textField.textWidth;
			
			_bitmap = new Bitmap(new BitmapData(textField.width, textField.height, false, 0x00000000));
			_bitmap.bitmapData.draw(textField);
			_bitmap.x = stage.stageWidth;
			addChild(_bitmap);
			
			textField = null;
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			doTween();
		}
		
		private function doTween():void 
		{
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			removeChild(_bitmap);
			_bitmap = null;
		}
		
		private function enterFrame(e:Event):void 
		{
			if(_bitmap){
				_bitmap.x -= _speed / stage.frameRate;
				if (_bitmap.x < -_bitmap.width) {
					_bitmap.x = stage.stageWidth;
				}
			}
		}
	}
	
}