//com.sulake.habbo.communication.messages.incoming.room.furniture.CustomUserNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.CustomUserNotificationMessageParser;

    [SecureSWF(rename="true")]
    public class CustomUserNotificationMessageEvent extends MessageEvent {

        public function CustomUserNotificationMessageEvent(k:Function);

        public function getParser():CustomUserNotificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

