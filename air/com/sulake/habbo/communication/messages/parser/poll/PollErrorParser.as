//com.sulake.habbo.communication.messages.parser.poll.PollErrorParser

package com.sulake.habbo.communication.messages.parser.poll{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PollErrorParser implements IMessageParser {

        public function PollErrorParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.poll

