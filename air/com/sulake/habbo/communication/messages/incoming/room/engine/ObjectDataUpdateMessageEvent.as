//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectDataUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectDataUpdateMessageEvent extends MessageEvent {

        public function ObjectDataUpdateMessageEvent(k:Function);

        public function getParser():ObjectDataUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

