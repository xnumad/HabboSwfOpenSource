package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_15432;

    public class PingMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function PingMessageEvent(k:Function)
        {
            super(k, _Str_15432);
        }
    }
}
