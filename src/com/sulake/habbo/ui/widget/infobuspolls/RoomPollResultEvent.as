package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	
	public class RoomPollResultEvent extends MessageEvent implements IMessageEvent
	{
		public function RoomPollResultEvent(k:Function)
        {
            super(k, RoomPollResultParser);
        }
		
		public function getParser():RoomPollResultParser
		{
			return this._parser as RoomPollResultParser;
		}
	}

}
