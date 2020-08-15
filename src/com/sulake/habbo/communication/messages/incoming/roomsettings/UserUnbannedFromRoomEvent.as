package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser;

    public class UserUnbannedFromRoomEvent extends MessageEvent implements IMessageEvent
    {
        public function UserUnbannedFromRoomEvent(k:Function)
        {
            super(k, UserUnbannedFromRoomParser);
        }

        public function getParser():UserUnbannedFromRoomParser
        {
            return this._parser as UserUnbannedFromRoomParser;
        }
    }
}
