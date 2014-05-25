package mobilOkey.model.user {
	
	public class SuperUser extends User {
		
		public function SuperUser(id:String, exp:uint, name:String){
			super(id, exp, name);
			
			status = UserStatus.WAIT_FOR_AUTH;
		}
		
		private function auth():void{
			
		}
		
	}
}