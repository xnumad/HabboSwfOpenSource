package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_7264;

    public class IsFirstLoginOfDayEvent extends MessageEvent implements IMessageEvent 
    {
        public function IsFirstLoginOfDayEvent(k:Function)
        {
            super(k, _Str_7264);
        }

        public function getParser():_Str_7264
        {
            return this._parser as _Str_7264;
        }
    }
}
