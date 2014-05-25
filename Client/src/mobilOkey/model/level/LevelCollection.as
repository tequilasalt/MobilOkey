package mobilOkey.model.level {
	
	public class LevelCollection{
		
		private var _levels:Vector.<Level>;
		
		public function LevelCollection(){
			_levels = new Vector.<Level>();
		}
		
		public function getByExp(exp:uint):Level{
			
			var currentLevel:Level;
			
			for each(var l:Level in _levels){
				
				if(!currentLevel){
					currentLevel = l;
				}else{
					if(l.exp > exp){
						continue;
					}else{
						currentLevel = l;
					}
				}
				
			}
			
			return currentLevel;
		}
		
		private function levelComparer(level1:Level, level2:Level):int{
			
			if(level1.index < level2.index){
				return 1;
			}
			
			if(level1.index > level2.index){
				return -1;
			}
			
			return 0;
		}
	}
}