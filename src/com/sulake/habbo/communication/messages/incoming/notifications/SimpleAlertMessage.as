package com.sulake.habbo.communication.messages.incoming.notifications 
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;
	import com.sulake.core.communication.messages.IMessageParser;
	/**
	 * ...
	 * @author 
	 */
	public class SimpleAlertMessage implements IMessageParser
	{
		private var _alertMessage:String;
		private var _titleMessage:String;
		
		public function flush():Boolean
        {
            this._alertMessage = null;
            return true;
        }
		
		public function parse(k:IMessageDataWrapper):Boolean
		{
			this._alertMessage = k.readString();
			
			if (k.bytesAvailable)
			{
				this._titleMessage = k.readString();
			}
			
			return true;
		}
		
		public function get alertMessage():String
		{
			return this._alertMessage;
		}
		
		public function get titleMessage():String
		{
			return this._titleMessage;
		}
		
	}

}
