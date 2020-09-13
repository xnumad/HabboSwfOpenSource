package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestionFinishedParser implements IMessageParser
    {
        private var _questionId:int;
        private var _results:Map;


        public function get questionId():int
        {
            return this._questionId;
        }

        public function get results():Map
        {
            return this._results;
        }

        public function flush():Boolean
        {
            this._questionId = -1;
            this._results = null;
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var key:String;
            var value:int;
            this._questionId = k.readInteger();
            this._results = new Map();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                key = k.readString();
                value = k.readInteger();
                this._results.add(key, value);
                index++;
            }
            return true;
        }
    }
}
