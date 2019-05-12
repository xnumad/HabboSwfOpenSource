package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;
	import com.sulake.core.communication.messages.IMessageParser;
	/**
	 * ...
	 * @author 
	 */
	public class RoomPollDataParser implements IMessageParser
	{
	
		
	private var _question:String;
        private var _choices:Array;


        public function get question():String
        {
            return this._question;
        }

        public function get choices():Array
        {
            return this._choices.slice();
        }

        public function flush():Boolean
        {
            this._question = "";
            this._choices = [];
            return true;
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._question = _arg_1.readString();
            this._choices = [];
            var _local_2:int = _arg_1.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _arg_1.readInteger();
                this._choices.push(_arg_1.readString());
                _local_3++;
            }
            return true;
        }
	}
}
