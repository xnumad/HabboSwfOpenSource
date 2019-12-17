package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7739;

    public class _Str_8414 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8414(k:Function)
        {
            super(k, _Str_7739);
        }

        public function getParser():_Str_7739
        {
            return _parser as _Str_7739;
        }
    }
}
