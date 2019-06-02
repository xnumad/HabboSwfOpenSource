//com.sulake.habbo.communication.messages.parser.room.session.OpenConnectionMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OpenConnectionMessageParser implements IMessageParser {

        public function OpenConnectionMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

