//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectRemoveMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectRemoveMessageParser;

    [SecureSWF(rename="true")]
    public class ObjectRemoveMessageEvent extends MessageEvent {

        public function ObjectRemoveMessageEvent(k:Function);

        public function getParser():ObjectRemoveMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

