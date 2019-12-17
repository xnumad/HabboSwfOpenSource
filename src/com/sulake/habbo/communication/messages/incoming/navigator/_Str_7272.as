package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5654;

    public class _Str_7272 extends MessageEvent 
    {
        public function _Str_7272(k:Function)
        {
            super(k, _Str_5654);
        }

        public function get _Str_17914():String
        {
            return (this._parser as _Str_5654)._Str_17914;
        }

        public function get _Str_12434():int
        {
            return (this._parser as _Str_5654)._Str_12434;
        }

        public function getParser():_Str_5654
        {
            return _parser as _Str_5654;
        }
    }
}
