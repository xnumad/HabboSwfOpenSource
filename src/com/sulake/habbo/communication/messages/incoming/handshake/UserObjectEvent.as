package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;

    public class UserObjectEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserObjectEvent(k:Function)
        {
            super(k, _Str_4139);
        }

        public function getParser():_Str_4139
        {
            return this._parser as _Str_4139;
        }
    }
}
