package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	/**
	 * ...
	 * @author 
	 */
	public class StartRoomPollEvent extends MessageEvent implements IMessageEvent
	{
		public function StartRoomPollEvent(k:Function)
        {
            super(k, RoomPollDataParser);
        }
		
		public function getParser():RoomPollDataParser
		{
			return this._parser as RoomPollDataParser;
		}
	}

}
