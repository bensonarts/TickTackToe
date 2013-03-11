package com.bensonarts.tictactoe.ai
{
	import com.bensonarts.tictactoe.ai.interfaces.IAIPlayer;
	import com.bensonarts.tictactoe.enum.PlayerType;
	import com.bensonarts.tictactoe.model.vo.GamePieceVO;
	import com.bensonarts.tictactoe.pattern.strategy.AIStrategy;
	
	import mx.collections.ArrayCollection;

	public class AIPlayer implements IAIPlayer
	{
		[Binable]
		protected var gamePieceCollection:ArrayCollection;
		
		private static var _instance:AIPlayer;
		private static var _mode:int;
		
		public static function getInstance():AIPlayer
		{
			if (AIPlayer._instance == null)
			{
				AIPlayer._instance = new AIPlayer();
			}
			
			return AIPlayer._instance;
		}
		
		public function startup(col:ArrayCollection, mode:int):void
		{
			AIPlayer._mode = mode;
			this.gamePieceCollection = col;
		}
		
		public function move():void
		{
			AIStrategy.choosePiece(this.gamePieceCollection, AIPlayer._mode);
		}
	}
}