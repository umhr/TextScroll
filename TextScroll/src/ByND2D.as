package
{

	import de.nulldesign.nd2d.display.World2D;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import nd2d.TextFieldTest;
	
	[SWF(width = "1000", height = "550", frameRate = "60", backgroundColor = "#000000")]
	public class ByND2D extends World2D
	{
		private var _speed:Number;
		private var _ndc2:TextFieldTest;
		public function ByND2D(speed:Number)
		{
			_speed = speed;
			super(Context3DRenderMode.AUTO, 60);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			//_ndc2.dispose();
			//dispose();
			//stopAllMovieClips();
		}

		override protected function addedToStage(event:Event):void
		{
			super.addedToStage(event);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			enableErrorChecking = false;
			
			if(!_ndc2){
				_ndc2 = new TextFieldTest(_speed, stage.frameRate, stage.stageWidth);
				setActiveScene(_ndc2);
				start();
			}
			
			//start();
		}
		
		
		
	}
}
