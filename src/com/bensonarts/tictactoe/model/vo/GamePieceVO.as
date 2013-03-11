package com.bensonarts.tictactoe.model.vo
{
	[Bindable]
	public class GamePieceVO
	{
		public var id:int = 0;
		public var used:Boolean = false;
		public var side:int = 0;
		public var label:String = "";
		public var playerType:int;
		
		public function GamePieceVO(id:int)
		{
			this.id = id;
		}
	}
}
