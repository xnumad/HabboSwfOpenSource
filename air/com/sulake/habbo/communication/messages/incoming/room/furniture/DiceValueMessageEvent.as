//com.sulake.habbo.communication.messages.incoming.room.furniture.DiceValueMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.DiceValueMessageParser;

    [SecureSWF(rename="true")]
    public class DiceValueMessageEvent extends MessageEvent implements IMessageEvent {

        public function DiceValueMessageEvent(k:Function);

        public function getParser():DiceValueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

