//com.sulake.habbo.communication.messages.incoming.room.furniture.PresentOpenedMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.PresentOpenedMessageParser;

    [SecureSWF(rename="true")]
    public class PresentOpenedMessageEvent extends MessageEvent implements IMessageEvent {

        public function PresentOpenedMessageEvent(k:Function);

        public function getParser():PresentOpenedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

