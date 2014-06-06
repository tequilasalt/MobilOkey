package mobilOkey.model.settings {
	
	import mobilOkey.model.level.LevelCollection;
	
	public class Settings {
		
		private static var _instance:Settings;
		
		public static const REF_WIDTH	:int = 1280;
		public static const REF_HEIGHT	:int = 720;
		
		private var _currentWidth		:int;
		private var _currentHeight		:int;
		
		private var _appId				:String = "";
		
		private var _levels				:LevelCollection;
		
		public function Settings(){			
			_levels = new LevelCollection();			
		}
		
		public function get levels():LevelCollection {
			return _levels;
		}
		
		public function get currentWidth():int{
			return _currentWidth;
		}
		
		public function set currentWidth(value:int):void{
			_currentWidth = value;
		}
		
		public function get currentHeight():int{
			return _currentHeight;
		}
		
		public function set currentHeight(value:int):void{
			_currentHeight = value;
		}
		
		public function get appId():String{
			return _appId;
		}
		
		public static function get instance():Settings {
			
			if(!_instance){
				_instance = new Settings();
			}
			
			return _instance;
		}

	}
}