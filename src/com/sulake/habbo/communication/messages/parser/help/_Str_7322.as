package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7322 implements IMessageParser 
    {
        private var _resultType:int;
        private var _Str_2992:String;


        public function get resultType():int
        {
            return this._resultType;
        }

        public function get _Str_3460():String
        {
            return this._Str_2992;
        }

        public function flush():Boolean
        {
            this._resultType = -1;
            this._Str_2992 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultType = k.readInteger();
            this._Str_2992 = k.readString();
            return true;
        }
    }
}
