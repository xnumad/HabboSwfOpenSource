package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestionParser implements IMessageParser 
    {
        private var _pollType:String = null;
        private var _pollId:int = -1;
        private var _questionId:int = -1;
        private var _duration:int = -1;
        private var _question:Dictionary = null;


        public function get _Str_5302():String
        {
            return this._pollType;
        }

        public function get _Str_5213():int
        {
            return this._pollId;
        }

        public function get _Str_3218():int
        {
            return this._questionId;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function get question():Dictionary
        {
            return this._question;
        }

        public function flush():Boolean
        {
            this._pollType = null;
            this._pollId = -1;
            this._questionId = -1;
            this._duration = -1;
            this._question = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:int;
            this._pollType = k.readString();
            this._pollId = k.readInteger();
            this._questionId = k.readInteger();
            this._duration = k.readInteger();
            this._question = new Dictionary();
            this._question["id"] = k.readInteger();
            this._question["number"] = k.readInteger();
            this._question["type"] = k.readInteger();
            this._question["content"] = k.readString();
            if (((this._question["type"] == 1) || (this._question["type"] == 2)))
            {
                this._question["selection_min"] = k.readInteger();
                _local_2 = k.readInteger();
                _local_3 = new Array();
                _local_4 = new Array();
                this._question["selections"] = _local_3;
                this._question["selection_values"] = _local_4;
                this._question["selection_count"] = _local_2;
                this._question["selection_max"] = _local_2;
                _local_5 = 0;
                while (_local_5 < _local_2)
                {
                    _local_4.push(k.readString());
                    _local_3.push(k.readString());
                    _local_5++;
                }
            }
            return true;
        }
    }
}
