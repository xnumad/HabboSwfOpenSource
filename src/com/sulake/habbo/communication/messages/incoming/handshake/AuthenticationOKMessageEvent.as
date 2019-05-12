package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_14123;

    public class AuthenticationOKMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function AuthenticationOKMessageEvent(k:Function)
        {
            super(k, _Str_14123);
        }
    }
}
