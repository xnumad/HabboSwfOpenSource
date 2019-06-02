//com.sulake.habbo.communication.messages.incoming.help.QuizDataMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.QuizDataMessageParser;

    [SecureSWF(rename="true")]
    public class QuizDataMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuizDataMessageEvent(k:Function);

        public function getParser():QuizDataMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

