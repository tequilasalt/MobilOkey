package util.stage {
	
	import flash.display.Stage;
	
	public class StageReference{
		
		private static var _stage:Stage;
		
		public static function get stage():Stage{
			return _stage;
		}

		public static function set stage(value:Stage):void{
			
			if(_stage){
				return;
			}
			
			_stage = value;
		}

	}
}