package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability._Str_8720;

    public class _Str_17595 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17595(k:Function)
        {
            super(k, _Str_8720);
        }

        public function getParser():_Str_8720
        {
            return _parser as _Str_8720;
        }
    }
}
