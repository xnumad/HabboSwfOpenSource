package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6680 implements IMessageParser 
    {
        private var _messages:Array;


        public function flush():Boolean
        {
            this._messages = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._messages.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get messages():Array
        {
            return this._messages;
        }
    }
}
