package com.sulake.habbo.communication.messages.incoming.notifications 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	/**
	 * ...
	 * @author 
	 */
	public class SimpleAlertMessageEvent extends MessageEvent implements IMessageEvent
	{
		
		public function SimpleAlertMessageEvent(k:Function)
		{
			super(k, SimpleAlertMessageParser);
		}
		
		public function getParser():SimpleAlertMessageParser
        {
            return _parser as SimpleAlertMessageParser;
        }
	}
}
