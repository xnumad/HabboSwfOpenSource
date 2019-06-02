//com.sulake.habbo.communication.messages.parser.competition.NoOwnedRoomsAlertMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NoOwnedRoomsAlertMessageParser implements IMessageParser {

        public function NoOwnedRoomsAlertMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

