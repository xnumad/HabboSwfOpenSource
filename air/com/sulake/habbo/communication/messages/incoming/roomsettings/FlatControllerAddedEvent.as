//com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerAddedEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser;

    [SecureSWF(rename="true")]
    public class FlatControllerAddedEvent extends MessageEvent implements IMessageEvent {

        public function FlatControllerAddedEvent(k:Function);

        public function getParser():FlatControllerAddedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

