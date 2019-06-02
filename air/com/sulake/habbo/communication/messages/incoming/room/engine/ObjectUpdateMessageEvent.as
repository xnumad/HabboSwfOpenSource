//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectUpdateMessageEvent extends MessageEvent {

        public function ObjectUpdateMessageEvent(k:Function);

        public function getParser():ObjectUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

