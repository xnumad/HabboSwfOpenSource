//com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomEventEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser;

    [SecureSWF(rename="true")]
    public class CanCreateRoomEventEvent extends MessageEvent implements IMessageEvent {

        public function CanCreateRoomEventEvent(k:Function);

        public function getParser():CanCreateRoomEventMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

