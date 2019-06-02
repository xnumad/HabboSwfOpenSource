//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectsDataUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectsDataUpdateMessageEvent extends MessageEvent {

        public function ObjectsDataUpdateMessageEvent(k:Function);

        public function getParser():ObjectsDataUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

