//com.sulake.habbo.communication.messages.incoming.room.action.SleepMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.SleepMessageParser;

    [SecureSWF(rename="true")]
    public class SleepMessageEvent extends MessageEvent {

        public function SleepMessageEvent(k:Function);

        public function getParser():SleepMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

