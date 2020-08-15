package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser;

    public class UserSongDisksInventoryMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function UserSongDisksInventoryMessageEvent(k:Function)
        {
            super(k, UserSongDisksInventoryMessageParser);
        }

        public function getParser():UserSongDisksInventoryMessageParser
        {
            return this._parser as UserSongDisksInventoryMessageParser;
        }
    }
}
