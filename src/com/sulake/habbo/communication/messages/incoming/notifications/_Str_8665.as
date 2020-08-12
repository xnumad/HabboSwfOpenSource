package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboBroadcastMessageParser;

    public class _Str_8665 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8665(k:Function)
        {
            super(k, HabboBroadcastMessageParser);
        }

        public function get _Str_3460():String
        {
            return (_parser as HabboBroadcastMessageParser)._Str_3460;
        }

        public function getParser():HabboBroadcastMessageParser
        {
            return _parser as HabboBroadcastMessageParser;
        }
    }
}
