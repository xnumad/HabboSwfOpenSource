package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_6053;

    public class GenericErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function GenericErrorEvent(k:Function)
        {
            super(k, _Str_6053);
        }

        public function getParser():_Str_6053
        {
            return this._parser as _Str_6053;
        }
    }
}
