//com.sulake.habbo.communication.messages.parser.room.session.YouAreSpectatorMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class YouAreSpectatorMessageParser implements IMessageParser {

        public function YouAreSpectatorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

