//com.sulake.habbo.communication.messages.parser.help.QuizResultsMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuizResultsMessageParser implements IMessageParser {

        private var _quizCode:String;
        private var _questionIdsForWrongAnswers:Array;

        public function QuizResultsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quizCode():String;

        public function get questionIdsForWrongAnswers():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.help

