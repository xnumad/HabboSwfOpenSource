package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_8090;

    public class _Str_9259 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9259(k:Function)
        {
            super(k, _Str_8090);
        }

        public function getParser():_Str_8090
        {
            return _parser as _Str_8090;
        }
    }
}
