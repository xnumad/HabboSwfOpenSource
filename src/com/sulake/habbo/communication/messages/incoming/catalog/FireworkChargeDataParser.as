package com.sulake.habbo.communication.messages.incoming.catalog 
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;
	import com.sulake.core.communication.messages.IMessageParser;
	/**
	 * ...
	 * @author 
	 */
	public class FireworkChargeDataParser implements IMessageParser
	{
		private var _fireworkChargeData:FireworkChargeData;
		
		public function flush():Boolean 
		{
			return true;
		}
		
		public function parse(_arg_1:IMessageDataWrapper):Boolean 
		{
			this._fireworkChargeData = new FireworkChargeData(_arg_1);
			return true;
		}
		
		public function get fireworkChargeData():FireworkChargeData
		{
			return this._fireworkChargeData;
		}
	}

}
