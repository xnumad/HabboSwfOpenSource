package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestionAnsweredParser implements IMessageParser
    {
        private var _userId:int;
        private var _value:String;
        private var _answerCounts:Map;


        public function get userId():int
        {
            return this._userId;
        }

        public function get value():String
        {
            return this._value;
        }

        public function get answerCounts():Map
        {
            return this._answerCounts;
        }

        public function flush():Boolean
        {
            this._userId = -1;
            this._value = "";
            this._answerCounts = null;
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var key:String;
            var value:int;
            this._userId = k.readInteger();
            this._value = k.readString();
            this._answerCounts = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                key = k.readString();
                value = k.readInteger();
                this._answerCounts.add(key, value);
                _local_3++;
            }
            return true;
        }
    }
}
