package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_9060;

    public class IdentityAccountsEvent extends MessageEvent implements IMessageEvent 
    {
        public function IdentityAccountsEvent(k:Function)
        {
            super(k, _Str_9060);
        }

        public function getParser():_Str_9060
        {
            return this._parser as _Str_9060;
        }
    }
}
