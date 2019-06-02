//com.sulake.habbo.communication.messages.incoming.room.engine.HeightMapUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class HeightMapUpdateMessageEvent extends MessageEvent {

        public function HeightMapUpdateMessageEvent(k:Function);

        public function getParser():HeightMapUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

