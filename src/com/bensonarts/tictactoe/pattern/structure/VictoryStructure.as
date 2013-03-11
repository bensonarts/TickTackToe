package com.bensonarts.tictactoe.pattern.structure
{
	import com.bensonarts.tictactoe.enum.PlayerType;
	import com.bensonarts.tictactoe.model.vo.GamePieceVO;
	
	import mx.collections.ArrayCollection;

	public class VictoryStructure
	{
		public static const PTS_TO_WIN:int = 3;
		
		public static const WIN_STRUCT_0:Array = [
			1, 1, 1,
			0, 0, 0,
			0, 0, 0
		];
		public static const WIN_STRUCT_1:Array = [
			0, 0, 0,
			1, 1, 1,
			0, 0, 0
		];
		public static const WIN_STRUCT_2:Array = [
			0, 0, 0,
			0, 0, 0,
			1, 1, 1
		];
		public static const WIN_STRUCT_3:Array = [
			1, 0, 0,
			1, 0, 0,
			1, 0, 0
		];
		public static const WIN_STRUCT_4:Array = [
			0, 1, 0,
			0, 1, 0,
			0, 1, 0
		];
		public static const WIN_STRUCT_5:Array = [
			0, 0, 1,
			0, 0, 1,
			0, 0, 1
		];
		public static const WIN_STRUCT_6:Array = [
			1, 0, 0,
			0, 1, 0,
			0, 0, 1
		];
		public static const WIN_STRUCT_7:Array = [
			0, 0, 1,
			0, 1, 0,
			1, 0, 0
		];
		
		[Bindable]
		public var gamePieceCollection:ArrayCollection;
		
		private static var _instance:VictoryStructure;
		
		public static function getInstance():VictoryStructure
		{
			if (VictoryStructure._instance == null)
			{
				VictoryStructure._instance = new VictoryStructure();
			}
			
			return VictoryStructure._instance;
		}
		
		public static function getVictoryConditions():Array
		{
			return [
				VictoryStructure.WIN_STRUCT_0,
				VictoryStructure.WIN_STRUCT_1,
				VictoryStructure.WIN_STRUCT_2,
				VictoryStructure.WIN_STRUCT_3,
				VictoryStructure.WIN_STRUCT_4,
				VictoryStructure.WIN_STRUCT_5,
				VictoryStructure.WIN_STRUCT_6,
				VictoryStructure.WIN_STRUCT_7,
			];
		}
		
		public function startup(col:ArrayCollection):void
		{
			this.gamePieceCollection = col;
		}
		
		public function isVictory(player:int):Boolean
		{
			var total:int = VictoryStructure.getVictoryConditions().length;
			for (var i:int = 0; i < total; i++)
			{
				var victoryStructure:Array = VictoryStructure.getVictoryConditions()[i] as Array;
				var victoryStructureTotal:int = victoryStructure.length;
				var gamePoints:int = 0;
				
				for (var j:int = 0; j < victoryStructureTotal; j++)
				{
					var val:int = victoryStructure[j] as int;
					if (val == 1)
					{
						var vo:GamePieceVO = this.gamePieceCollection.getItemAt(j) as GamePieceVO;
						if (vo.used && vo.playerType == player)
						{
							gamePoints++;
						}
					}
					if (gamePoints == VictoryStructure.PTS_TO_WIN)
					{
						return true;
					}
				}
			}
			return false;
		}
		
		public function isDraw():Boolean
		{
			// First check to see if there are any remaining pieces.
			var total:int = this.gamePieceCollection.length;
			for (var i:int = 0; i < total; i++)
			{
				var vo:GamePieceVO = this.gamePieceCollection.getItemAt(i) as GamePieceVO;
				if (vo.used == false)
				{
					return false;
				}
			}
			
			if (this.isVictory(PlayerType.PLAYER_HUMAN) || this.isVictory(PlayerType.PLAYER_COMPUTER))
			{
				return false;
			}
			
			return true;
		}
	}
	
}
