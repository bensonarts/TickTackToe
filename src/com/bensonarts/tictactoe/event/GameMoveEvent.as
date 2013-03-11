package com.bensonarts.tictactoe.event
{
	import com.bensonarts.tictactoe.model.vo.GamePieceVO;
	
	import flash.events.Event;
	
	public class GameMoveEvent extends Event
	{
		private var _vo:GamePieceVO;
		
		public function GameMoveEvent(type:String, vo:GamePieceVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._vo = vo;
		}
		
		public function get vo():GamePieceVO
		{
			return this._vo;
		}
		
		override public function clone():Event
		{
			return new GameMoveEvent(type, vo, bubbles, cancelable);
		}
	}
}
