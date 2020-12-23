package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FaqTextMessageParser implements IMessageParser
    {
        private var _questionId:int;
        private var _answerText:String;


        public function get questionId():int
        {
            return this._questionId;
        }

        public function get _Str_26387():String
        {
            return this._answerText;
        }

        public function flush():Boolean
        {
            this._questionId = -1;
            this._answerText = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._questionId = k.readInteger();
            this._answerText = k.readString();
            return true;
        }
    }
}
