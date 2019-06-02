//com.sulake.habbo.communication.messages.incoming.sound.UserSongDisksInventoryMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser;

    [SecureSWF(rename="true")]
    public class UserSongDisksInventoryMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserSongDisksInventoryMessageEvent(k:Function);

        public function getParser():UserSongDisksInventoryMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

