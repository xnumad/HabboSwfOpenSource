//com.sulake.habbo.communication.messages.incoming.room.engine.ItemAddMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemAddMessageParser;

    [SecureSWF(rename="true")]
    public class ItemAddMessageEvent extends MessageEvent {

        public function ItemAddMessageEvent(k:Function);

        public function getParser():ItemAddMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

