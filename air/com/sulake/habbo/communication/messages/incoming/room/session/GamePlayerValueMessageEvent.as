//com.sulake.habbo.communication.messages.incoming.room.session.GamePlayerValueMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.GamePlayerValueMessageParser;

    [SecureSWF(rename="true")]
    public class GamePlayerValueMessageEvent extends MessageEvent {

        public function GamePlayerValueMessageEvent(k:Function);

        public function getParser():GamePlayerValueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

