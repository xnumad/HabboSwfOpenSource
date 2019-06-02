//com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomMessageParser;

    [SecureSWF(rename="true")]
    public class CanCreateRoomEvent extends MessageEvent implements IMessageEvent {

        public function CanCreateRoomEvent(k:Function);

        public function getParser():CanCreateRoomMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

