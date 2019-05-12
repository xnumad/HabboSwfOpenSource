package com.sulake.habbo.communication.messages.incoming.notifications 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	/**
	 * ...
	 * @author 
	 */
	public class SimpleAlertMessageParser extends MessageEvent implements IMessageEvent
	{
		
		public function SimpleAlertMessageParser(k:Function)
		{
			super(k, SimpleAlertMessage);
		}
		
		public function _Str_2273():SimpleAlertMessage
        {
            return _parser as SimpleAlertMessage;
        }
	}
}
