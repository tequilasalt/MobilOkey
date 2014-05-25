package mobilOkey.controller.user {
	
	import mobilOkey.model.user.SuperUser;
	import mobilOkey.model.user.UserCollection;
	
	public class UserController {
		
		private var _userCollection:UserCollection;
		private var _superUser:SuperUser;
		
		private static var _instance:UserController; 
		
		public function UserController(){
			_userCollection = new UserCollection();
		}
		
		public function init(superUserId:String, exp:uint, name:String):void{			
			_superUser = new SuperUser(superUserId, exp, name);			
		}
		
		public function get superUser():SuperUser{
			return _superUser;
		}
		
		public static function get instance():UserController{
			
			if(_instance){
				_instance = new UserController();
			}
			
			return _instance;
			
		}

	}
	
}