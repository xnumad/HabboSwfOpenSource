//com.sulake.habbo.communication.messages.incoming.moderation.ModeratorRoomInfoEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorRoomInfoMessageParser;

    [SecureSWF(rename="true")]
    public class ModeratorRoomInfoEvent extends MessageEvent implements IMessageEvent {

        public function ModeratorRoomInfoEvent(k:Function);

        public function getParser():ModeratorRoomInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

