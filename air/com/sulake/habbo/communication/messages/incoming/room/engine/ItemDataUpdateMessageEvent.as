//com.sulake.habbo.communication.messages.incoming.room.engine.ItemDataUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemDataUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class ItemDataUpdateMessageEvent extends MessageEvent {

        public function ItemDataUpdateMessageEvent(k:Function);

        public function getParser():ItemDataUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

