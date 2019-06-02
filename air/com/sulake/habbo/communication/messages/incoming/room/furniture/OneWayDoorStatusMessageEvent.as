//com.sulake.habbo.communication.messages.incoming.room.furniture.OneWayDoorStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OneWayDoorStatusMessageParser;

    [SecureSWF(rename="true")]
    public class OneWayDoorStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function OneWayDoorStatusMessageEvent(k:Function);

        public function getParser():OneWayDoorStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

