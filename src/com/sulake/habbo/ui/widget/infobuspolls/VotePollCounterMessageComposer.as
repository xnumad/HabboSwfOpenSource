package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageComposer;
	/**
	 * ...
	 * @author 
	 */
	public class VotePollCounterMessageComposer implements IMessageComposer
	{
		private var _data:Array;

		public function VotePollCounterMessageComposer(counter:int) 
		{
			this._data = [];
            super();
            this._data = [counter];
		}
		
		
		public function getMessageArray():Array 
		{
			return this._data;
		}
		
		public function dispose():void 
		{
			
            this._data = null;
		}
		
	}

}
