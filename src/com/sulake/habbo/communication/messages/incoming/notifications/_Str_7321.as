package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_6680;

    public class _Str_7321 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7321(k:Function)
        {
            super(k, _Str_6680);
        }

        public function getParser():_Str_6680
        {
            return _parser as _Str_6680;
        }
    }
}
