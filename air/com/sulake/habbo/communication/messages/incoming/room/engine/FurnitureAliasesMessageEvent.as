//com.sulake.habbo.communication.messages.incoming.room.engine.FurnitureAliasesMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FurnitureAliasesMessageParser;

    [SecureSWF(rename="true")]
    public class FurnitureAliasesMessageEvent extends MessageEvent {

        public function FurnitureAliasesMessageEvent(k:Function);

        public function getParser():FurnitureAliasesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

