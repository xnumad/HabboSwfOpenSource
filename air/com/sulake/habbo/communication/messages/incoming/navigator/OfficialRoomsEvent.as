//com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;

    [SecureSWF(rename="true")]
    public class OfficialRoomsEvent extends MessageEvent implements IMessageEvent {

        public function OfficialRoomsEvent(k:Function);

        public function getParser():OfficialRoomsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

