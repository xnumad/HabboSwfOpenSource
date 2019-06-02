//com.sulake.habbo.communication.messages.incoming.room.engine.ItemsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser;

    [SecureSWF(rename="true")]
    public class ItemsMessageEvent extends MessageEvent {

        public function ItemsMessageEvent(k:Function);

        public function getParser():ItemsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

