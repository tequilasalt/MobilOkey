package mobilOkey.model.user {
	
	import flash.events.EventDispatcher;
	
	import mobilOkey.model.Settings;
	import mobilOkey.model.level.Level;
	
	public class User extends EventDispatcher{
		
		private var _id:String;
		private var _exp:uint;
		private var _name:String;
		private var _level:uint;
		
		private var _status:String;
		
		public function User(id:String, exp:uint, name:String = ""){
			_id = id;
			_exp = exp;			
			_name = name;
			_level = Settings.instance.levels.getByExp(_exp).index;
		}
		
		public function get id():String	{
			return _id;
		}
		
		public function get name():String{
			return _name;
		}
		
		public function get exp():uint{
			return _exp;
		}
		
		public function set exp(value:uint):void{
			_exp = value;
			
			var lvl:Level = Settings.instance.levels.getByExp(_exp);
			
			if(lvl.index > level){
				levelUp();
			}
		}
		
		public function incrementExp(value:uint):void{
			exp += value;
		}
		
		public function get level():uint{
			return _level;
		}
		
		public function get status():String{
			return _status;
		}
		
		public function set status(value:String):void{
			_status = value;
		}
		
		private function levelUp():void{
			/*TODO LevelEvent */
			
			_level = Settings.instance.levels.getByExp(_exp).index;
			
			dispatchEvent(null);
		}
	}
}