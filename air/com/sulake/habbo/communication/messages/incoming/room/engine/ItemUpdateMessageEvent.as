//com.sulake.habbo.communication.messages.incoming.room.engine.ItemUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class ItemUpdateMessageEvent extends MessageEvent {

        public function ItemUpdateMessageEvent(k:Function);

        public function getParser():ItemUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

