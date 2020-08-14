package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser;

    public class _Str_5655 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5655(k:Function)
        {
            super(k, UserUnbannedFromRoomParser);
        }

        public function getParser():UserUnbannedFromRoomParser
        {
            return this._parser as UserUnbannedFromRoomParser;
        }
    }
}
