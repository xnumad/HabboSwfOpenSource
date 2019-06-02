//com.sulake.habbo.communication.messages.incoming.room.action.DanceMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.DanceMessageParser;

    [SecureSWF(rename="true")]
    public class DanceMessageEvent extends MessageEvent {

        public function DanceMessageEvent(k:Function);

        public function getParser():DanceMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

