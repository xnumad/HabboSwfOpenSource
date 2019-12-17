package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_7486;

    public class _Str_8524 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8524(k:Function)
        {
            super(k, _Str_7486);
        }

        public function getParser():_Str_7486
        {
            return _parser as _Str_7486;
        }
    }
}
