//com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.GuestRoomSearchResultMessageParser;

    [SecureSWF(rename="true")]
    public class GuestRoomSearchResultEvent extends MessageEvent implements IMessageEvent {

        public function GuestRoomSearchResultEvent(k:Function);

        public function getParser():GuestRoomSearchResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

