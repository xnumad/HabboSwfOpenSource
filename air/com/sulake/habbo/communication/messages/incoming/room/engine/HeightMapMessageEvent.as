//com.sulake.habbo.communication.messages.incoming.room.engine.HeightMapMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapMessageParser;

    [SecureSWF(rename="true")]
    public class HeightMapMessageEvent extends MessageEvent {

        public function HeightMapMessageEvent(k:Function);

        public function getParser():HeightMapMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

