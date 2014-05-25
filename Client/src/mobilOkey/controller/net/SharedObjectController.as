package mobilOkey.controller.net {
	import flash.net.SharedObject;
	import flash.net.dns.AAAARecord;
	
	import mobilOkey.controller.user.UserController;
	
	public class SharedObjectController {
		
		private static var _instance:SharedObjectController;
		
		public function SharedObjectController() {
			
		}
		
		public function init():void{
			
			var so:SharedObject = SharedObject.getLocal("mobilOkey"); 
			
			if (so.size != 0) { 
				
				var userId:String = so.data.userId;	
				var exp:uint = so.data.exp;
				var name:String = so.data.exp;
				
				UserController.instance.init(userId,exp,name);
				
				var test:AAAARecord = new AAAARecord();
			}
			
		}
		
		public function update():void{
			var so:SharedObject = SharedObject.getLocal("mobilOkey");
			
			so.data.userId = UserController.instance.superUser.id;
		}
		
		public static function get instance():SharedObjectController {
			
			if(!_instance){
				_instance = new SharedObjectController();
			}
			
			return _instance;
		}

	}
}