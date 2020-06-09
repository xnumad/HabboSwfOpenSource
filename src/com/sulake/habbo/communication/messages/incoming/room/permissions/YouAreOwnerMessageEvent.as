package com.sulake.habbo.communication.messages.incoming.room.permissions
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions._Str_8433;

    public class YouAreOwnerMessageEvent extends MessageEvent
    {
        public function YouAreOwnerMessageEvent(k:Function)
        {
            super(k, _Str_8433);
        }

        public function getParser():_Str_8433
        {
            return _parser as _Str_8433;
        }
    }
}
