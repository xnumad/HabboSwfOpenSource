package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7819 implements IMessageParser 
    {
        private var _Str_5400:int = -1;
        private var _Str_3764:String;
        private var _message:String;


        public function get _Str_3293():int
        {
            return this._Str_5400;
        }

        public function get _Str_3251():String
        {
            return this._Str_3764;
        }

        public function get message():String
        {
            return this._message;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3764 = k.readString();
            this._Str_5400 = k.readInteger();
            this._message = k.readString();
            return true;
        }
    }
}
