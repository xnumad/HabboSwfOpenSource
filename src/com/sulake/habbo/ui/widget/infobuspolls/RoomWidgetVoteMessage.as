package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
	/**
	 * ...
	 * @author 
	 */
	public class RoomWidgetVoteMessage extends RoomWidgetMessage
	{
		public static const VOTE_MESSAGE:String = "RWVM_VOTE_MESSAGE";

        private var _index:int;
		
		public function RoomWidgetVoteMessage(index:int) 
		{
			super(VOTE_MESSAGE);
			this._index = index;
		}
		
        public function get index():int
        {
            return this._index;
        }
	}

}
