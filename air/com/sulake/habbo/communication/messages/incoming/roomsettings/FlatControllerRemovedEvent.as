//com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerRemovedEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerRemovedMessageParser;

    [SecureSWF(rename="true")]
    public class FlatControllerRemovedEvent extends MessageEvent implements IMessageEvent {

        public function FlatControllerRemovedEvent(k:Function);

        public function getParser():FlatControllerRemovedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

