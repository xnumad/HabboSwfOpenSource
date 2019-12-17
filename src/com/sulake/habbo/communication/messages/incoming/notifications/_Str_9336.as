package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_6256;

    public class _Str_9336 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9336(k:Function)
        {
            super(k, _Str_6256);
        }

        public function getParser():_Str_6256
        {
            return _parser as _Str_6256;
        }
    }
}
