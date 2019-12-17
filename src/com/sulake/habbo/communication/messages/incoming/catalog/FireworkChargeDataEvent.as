package com.sulake.habbo.communication.messages.incoming.catalog 
{
	import com.sulake.core.communication.messages.IMessageEvent;
	import com.sulake.core.communication.messages.MessageEvent;
	/**
	 * ...
	 * @author 
	 */
	public class FireworkChargeDataEvent extends MessageEvent implements IMessageEvent
	{
		
		public function FireworkChargeDataEvent(k:Function)
        {
            super(k, FireworkChargeDataParser);
        }

        public function getParser():FireworkChargeDataParser
        {
            return this._parser as FireworkChargeDataParser;
        }

		
	}

}
