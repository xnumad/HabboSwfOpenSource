package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;
	import com.sulake.core.communication.messages.IMessageParser;
	/**
	 * ...
	 * @author 
	 */
	public class RoomPollResultParser implements IMessageParser
	{
		private var _question:String;
        private var _choices:Array;
        private var _SafeStr_7651:Array;
        private var _SafeStr_7654:int;


        public function get question():String
        {
            return this._question;
        }

        public function get choices():Array
        {
            return this._choices.slice();
        }

        public function get _SafeStr_4173():Array
        {
            return this._SafeStr_7651.slice();
        }

        public function get _SafeStr_4174():int
        {
            return this._SafeStr_7654;
        }

        public function flush():Boolean
        {
            this._question = "";
            this._choices = [];
            this._SafeStr_7651 = [];
            this._SafeStr_7654 = 0;
            return true;
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._question = _arg_1.readString();
            this._choices = [];
            this._SafeStr_7651 = [];
            var _local_2:int = _arg_1.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _arg_1.readInteger();
                this._choices.push(_arg_1.readString());
                this._SafeStr_7651.push(_arg_1.readInteger());
                _local_3++;
            }
            this._SafeStr_7654 = _arg_1.readInteger();
            return true;
        }

	}

}
