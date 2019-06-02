//com.sulake.habbo.communication.messages.incoming.moderation.RoomChatlogEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomChatlogMessageParser;

    [SecureSWF(rename="true")]
    public class RoomChatlogEvent extends MessageEvent implements IMessageEvent {

        public function RoomChatlogEvent(k:Function);

        public function getParser():RoomChatlogMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

