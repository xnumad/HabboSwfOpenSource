package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9187 implements IMessageParser 
    {
        private var _questionId:int;
        private var _Str_17066:String;


        public function get questionId():int
        {
            return this._questionId;
        }

        public function get _Str_26387():String
        {
            return this._Str_17066;
        }

        public function flush():Boolean
        {
            this._questionId = -1;
            this._Str_17066 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._questionId = k.readInteger();
            this._Str_17066 = k.readString();
            return true;
        }
    }
}
