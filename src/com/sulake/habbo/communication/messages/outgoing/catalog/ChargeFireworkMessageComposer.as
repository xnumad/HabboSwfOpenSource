package com.sulake.habbo.communication.messages.outgoing.catalog 
{
	import com.sulake.core.communication.messages.IMessageComposer;
	import com.sulake.core.runtime.IDisposable;
	/**
	 * ...
	 * @author 
	 */
	public class ChargeFireworkMessageComposer  implements IMessageComposer 
	{
        private var _data:Array;
		
		public function ChargeFireworkMessageComposer(spriteId:int, type:int) 
		{
			this._data = new Array();
			super();
			this._data.push(spriteId);
			this._data.push(type);
		}
		
		
		/* INTERFACE com.sulake.core.runtime.IDisposable */
		
		public function dispose():void 
		{
			this._data = null;
		}
		
		
		/* INTERFACE com.sulake.core.communication.messages.IMessageComposer */
		
		public function getMessageArray():Array 
		{
			return this._data;
		}
		
	}

}
