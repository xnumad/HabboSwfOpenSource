package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_9220;

    public class _Str_9632 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9632(k:Function)
        {
            super(k, _Str_9220);
        }

        public function getParser():_Str_9220
        {
            return _parser as _Str_9220;
        }
    }
}
