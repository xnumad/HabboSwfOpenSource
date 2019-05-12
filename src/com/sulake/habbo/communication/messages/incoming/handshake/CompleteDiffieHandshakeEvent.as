package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_8602;

    public class CompleteDiffieHandshakeEvent extends MessageEvent implements IMessageEvent 
    {
        public function CompleteDiffieHandshakeEvent(k:Function)
        {
            super(k, _Str_8602);
        }

        public function get _Str_16514():String
        {
            return (this._parser as _Str_8602)._Str_16514;
        }

        public function get _Str_17893():Boolean
        {
            return (this._parser as _Str_8602)._Str_17893;
        }
    }
}
