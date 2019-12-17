package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_6719;

    public class _Str_9293 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9293(k:Function)
        {
            super(k, _Str_6719);
        }

        public function getParser():_Str_6719
        {
            return _parser as _Str_6719;
        }
    }
}
