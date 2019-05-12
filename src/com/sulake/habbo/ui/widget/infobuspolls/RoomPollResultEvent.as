package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	
	/**
	 * ...
	 * @author 
	 */
	public class RoomPollResultEvent extends MessageEvent implements IMessageEvent
	{
		public function RoomPollResultEvent(k:Function)
        {
            super(k, RoomPollResultParser);
        }
		
		public function _Str_2273():RoomPollResultParser
		{
			return this._parser as RoomPollResultParser;
		}
	}

}
