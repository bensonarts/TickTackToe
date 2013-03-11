package com.bensonarts.tictactoe.pattern.strategy
{
	import com.bensonarts.tictactoe.enum.PlayerType;
	import com.bensonarts.tictactoe.model.vo.GamePieceVO;
	
	import mx.collections.ArrayCollection;

	public class AIStrategy
	{
		public static const MODE_EASY:int = 0;
		public static const MODE_HARD:int = 1;
		
		public function AIStrategy()
		{
		}
		
		public static function choosePiece(col:ArrayCollection, mode:int):void
		{
			switch (mode)
			{
				case AIStrategy.MODE_EASY:
					choosePieceEasy(col);
					break;
				case AIStrategy.MODE_HARD:
					// TODO
					break;
				default:
					break;
			}
		}
		
		protected static function choosePieceEasy(col:ArrayCollection):void
		{
			var total:int = col.length;
			var allowedSpaces:Array = [];
			for (var i:int = 0; i < total; i++)
			{
				var vo:GamePieceVO = col.getItemAt(i) as GamePieceVO;
				if (vo.used)
				{
					continue;
				}
				
				allowedSpaces.push(i);
				
			}
			// Easy mode. Just random placement.
			var idx:int = Math.floor(Math.random() * allowedSpaces.length);
			var chosenGamePiece:GamePieceVO = col.getItemAt(allowedSpaces[idx]) as GamePieceVO;
			chosenGamePiece.used = true;
			chosenGamePiece.label = "0";
			chosenGamePiece.playerType = PlayerType.PLAYER_COMPUTER;
		}
	}
}