package mobilOkey.model {
	import mobilOkey.model.level.LevelCollection;
	
	public class Settings {
		
		private static var _instance:Settings;
		
		private var _levels:LevelCollection;
		
		public function Settings(){
			
			_levels = new LevelCollection();
			
		}
		
		public function get levels():LevelCollection {
			return _levels;
		}

		public static function get instance():Settings {
			
			if(!_instance){
				_instance = new Settings();
			}
			
			return _instance;
		}

	}
}