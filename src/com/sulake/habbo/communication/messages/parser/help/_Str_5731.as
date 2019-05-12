package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.data._Str_5959;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5731 implements IMessageParser 
    {
        public static const _Str_17350:int = 0;
        public static const _Str_15134:int = 1;
        public static const _Str_18403:int = 2;
        public static const _Str_17955:int = 3;

        private var _Str_14988:int;
        private var _Str_17655:_Str_5959;


        public function flush():Boolean
        {
            this._Str_17655 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_14988 = k.readInteger();
            if (this._Str_14988 == _Str_15134)
            {
                this._Str_17655 = new _Str_5959(k);
            }
            return true;
        }

        public function get _Str_23632():int
        {
            return this._Str_14988;
        }

        public function get _Str_25474():_Str_5959
        {
            return this._Str_17655;
        }

        public function get _Str_5961():String
        {
            switch (this._Str_14988)
            {
                case _Str_18403:
                    return "blocked";
                case _Str_17955:
                    return "tooquick";
                default:
                    return "";
            }
        }
    }
}
