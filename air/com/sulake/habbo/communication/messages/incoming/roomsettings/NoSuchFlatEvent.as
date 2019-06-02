//com.sulake.habbo.communication.messages.incoming.roomsettings.NoSuchFlatEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.NoSuchFlatMessageParser;

    [SecureSWF(rename="true")]
    public class NoSuchFlatEvent extends MessageEvent implements IMessageEvent {

        public function NoSuchFlatEvent(k:Function);

        public function getParser():NoSuchFlatMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

