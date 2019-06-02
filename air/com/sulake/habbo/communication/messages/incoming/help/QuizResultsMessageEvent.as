//com.sulake.habbo.communication.messages.incoming.help.QuizResultsMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.QuizResultsMessageParser;

    [SecureSWF(rename="true")]
    public class QuizResultsMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuizResultsMessageEvent(k:Function);

        public function getParser():QuizResultsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

