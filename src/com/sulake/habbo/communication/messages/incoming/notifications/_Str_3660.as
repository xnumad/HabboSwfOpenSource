package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_5519;

    public class _Str_3660 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3660(k:Function)
        {
            super(k, _Str_5519);
        }

        public function getParser():_Str_5519
        {
            return _parser as _Str_5519;
        }
    }
}
