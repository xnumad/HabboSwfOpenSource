package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestionFinishedParser implements IMessageParser
    {
        private var _questionId:int;
        private var _answerCounts:Map;


        public function get questionId():int
        {
            return this._questionId;
        }

        public function get answerCounts():Map
        {
            return this._answerCounts;
        }

        public function flush():Boolean
        {
            this._questionId = -1;
            this._answerCounts = null;
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var key:String;
            var value:int;
            this._questionId = k.readInteger();
            this._answerCounts = new Map();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                key = k.readString();
                value = k.readInteger();
                this._answerCounts.add(key, value);
                index++;
            }
            return true;
        }
    }
}
