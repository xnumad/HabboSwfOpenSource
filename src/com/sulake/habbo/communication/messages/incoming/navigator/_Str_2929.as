package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_4537;

    public class _Str_2929 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_2929(k:Function)
        {
            super(k, _Str_4537);
        }

        public function getParser():_Str_4537
        {
            return this._parser as _Str_4537;
        }
    }
}
