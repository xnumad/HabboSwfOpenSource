//com.sulake.habbo.communication.messages.incoming.room.furniture.RoomMessageNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomMessageNotificationMessageParser;

    [SecureSWF(rename="true")]
    public class RoomMessageNotificationMessageEvent extends MessageEvent implements IMessageEvent {

        public function RoomMessageNotificationMessageEvent(k:Function);

        public function getParser():RoomMessageNotificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

