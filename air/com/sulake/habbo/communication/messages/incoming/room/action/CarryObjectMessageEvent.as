//com.sulake.habbo.communication.messages.incoming.room.action.CarryObjectMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.CarryObjectMessageParser;

    [SecureSWF(rename="true")]
    public class CarryObjectMessageEvent extends MessageEvent implements IMessageEvent {

        public function CarryObjectMessageEvent(k:Function);

        public function getParser():CarryObjectMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

