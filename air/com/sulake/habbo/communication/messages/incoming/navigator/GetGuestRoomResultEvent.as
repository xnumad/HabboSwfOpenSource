//com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;

    [SecureSWF(rename="true")]
    public class GetGuestRoomResultEvent extends MessageEvent implements IMessageEvent {

        public function GetGuestRoomResultEvent(k:Function);

        public function getParser():GetGuestRoomResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

