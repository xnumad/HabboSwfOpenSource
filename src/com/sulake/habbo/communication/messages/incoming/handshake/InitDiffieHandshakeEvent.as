package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_8280;

    public class InitDiffieHandshakeEvent extends MessageEvent implements IMessageEvent 
    {
        public function InitDiffieHandshakeEvent(k:Function)
        {
            super(k, _Str_8280);
        }

        public function get _Str_16332():String
        {
            return (this._parser as _Str_8280)._Str_16332;
        }

        public function get _Str_16524():String
        {
            return (this._parser as _Str_8280)._Str_16524;
        }
    }
}
