//com.sulake.habbo.communication.messages.incoming.room.engine.ItemRemoveMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemRemoveMessageParser;

    [SecureSWF(rename="true")]
    public class ItemRemoveMessageEvent extends MessageEvent {

        public function ItemRemoveMessageEvent(k:Function);

        public function getParser():ItemRemoveMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

