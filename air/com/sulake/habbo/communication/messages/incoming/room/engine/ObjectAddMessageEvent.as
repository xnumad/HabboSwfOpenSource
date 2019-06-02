//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectAddMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectAddMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectAddMessageEvent extends MessageEvent {

        public function ObjectAddMessageEvent(k:Function);

        public function getParser():ObjectAddMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

