//com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllersEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser;

    [SecureSWF(rename="true")]
    public class FlatControllersEvent extends MessageEvent implements IMessageEvent {

        public function FlatControllersEvent(k:Function);

        public function getParser():FlatControllersMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

