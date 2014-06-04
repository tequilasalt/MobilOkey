package mobilOkey.model.user {
	
	import flash.events.EventDispatcher;
	
	public class UserCollection extends EventDispatcher{
		
		private var _users:Vector.<User>;
		private var _currentIndex:uint;
		
		public function UserCollection(){
			_users = new Vector.<User>();
		}
		
		public function add(user:User):void{
			dispatchEvent(null);
		}
		
		public function remove():void{
			dispatchEvent(null);
		}
		
		public function get users():Vector.<User>{
			return _users;
		}
		
		public function get index():uint{
			return 0;
		}
		
		public function set index(value:uint):void{
			_currentIndex = value;
		}
		
		public function get next():User{
			return null;
		}
		
		public function get previous():User{
			return null;
		}
		
		public function reset():void{
			
		}
	}
}