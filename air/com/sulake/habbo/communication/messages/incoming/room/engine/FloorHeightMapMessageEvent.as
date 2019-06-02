//com.sulake.habbo.communication.messages.incoming.room.engine.FloorHeightMapMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FloorHeightMapMessageParser;

    [SecureSWF(rename="true")]
    public class FloorHeightMapMessageEvent extends MessageEvent {

        public function FloorHeightMapMessageEvent(k:Function);

        public function getParser():FloorHeightMapMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

