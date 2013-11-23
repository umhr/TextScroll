package  
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByDrawMatrix extends Sprite 
	{
		private var _textField:TextField;
		private var _bitmap:Bitmap;
		private var _speed:Number;
		private var _isInt:Boolean;
		private var _txInt:int = 0;
		private var _txNumber:Number = 0;
		public function ByDrawMatrix(speed:Number, isInt:Boolean) 
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
			
			_textField = new TextField();
			_textField.defaultTextFormat = new TextFormat(new IPAexm00201_DF3().fontName, 80, 0xFFFFFF);
			_textField.text = "森鴎麒麟淡麗蒙殲滅懺癇謬癪爵健康優薔薇瑠璃";
			_textField.embedFonts = true;
			_textField.width = _textField.textWidth;
			_textField.mouseEnabled = false;
			_textField.cacheAsBitmap = true;
			_txInt = _txNumber = stage.stageWidth;
			
			_bitmap = new Bitmap(new BitmapData(stage.stageWidth, _textField.height, false, 0x00000000), PixelSnapping.NEVER);
			addChild(_bitmap);
			
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
			_textField = null;
		}
		
		private function enterFrame(e:Event):void 
		{
			if (_textField) {
				_bitmap.bitmapData.fillRect(_bitmap.bitmapData.rect, 0x00000000);
				if(_isInt){
					_txInt -= Math.round(_speed / stage.frameRate);
					_bitmap.bitmapData.draw(_textField, new Matrix(1, 0, 0, 1, _txInt, 0));
				}else {
					_txNumber -= _speed / stage.frameRate;
					_bitmap.bitmapData.draw(_textField, new Matrix(1, 0, 0, 1, _txNumber, 0));
				}
				if (_txInt < -_textField.textWidth || _txNumber < -_textField.textWidth) {
					_txInt = _txNumber = stage.stageWidth;
				}
			}
		}
	}
	
}