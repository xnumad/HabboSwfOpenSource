//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectsMessageEvent extends MessageEvent {

        public function ObjectsMessageEvent(k:Function);

        public function getParser():ObjectsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

