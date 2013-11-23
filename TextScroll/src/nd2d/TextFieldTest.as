package nd2d {

	import de.nulldesign.nd2d.display.Scene2D;
	import de.nulldesign.nd2d.display.TextField2D;
	import flash.events.Event;
	import flash.text.TextFormat;
	
	public class TextFieldTest extends Scene2D {
		
		private var _textField2D:TextField2D;
		private var _speed:Number;
		private var _frameRate:Number;
		private var _stageWidth:int;
		public function TextFieldTest(speed:Number, frameRate:int, stageWidth:int) {
			
			_speed = speed;
			_frameRate = frameRate;
			_stageWidth = stageWidth;
			
			_textField2D = new TextField2D();
			_textField2D.textFormat = new TextFormat(new Migu1C_Regular_DF3().fontName, 80, 0xFFFFFF);
			_textField2D.embedFonts = true;
			_textField2D.align = "left";
			_textField2D.text = "ゆく河の流れは絶えずして、しかももとの水にあらず。";
			_textField2D.x = _stageWidth;
			_textField2D.y = 60;// Math.floor(_textField2D.height * 0.5);
			addChild(_textField2D);
		}
		
		override protected function step(elapsed:Number):void {
			
			if (_textField2D) {
				_textField2D.x -= _speed / _frameRate;
				if ((_textField2D.x + _textField2D.width) < 0) {
					_textField2D.x = _stageWidth;
				}
			}
		}
		
		override public function dispose():void 
		{
			super.dispose();
		}
		
	}
}
