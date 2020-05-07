package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.AuthenticationOKMessageParser;

    public class AuthenticationOKMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function AuthenticationOKMessageEvent(k:Function)
        {
            super(k, AuthenticationOKMessageParser);
        }
    }
}
