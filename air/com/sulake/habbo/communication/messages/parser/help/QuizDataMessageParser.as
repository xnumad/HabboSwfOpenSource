//com.sulake.habbo.communication.messages.parser.help.QuizDataMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuizDataMessageParser implements IMessageParser {

        private var _quizCode:String;
        private var _questionIds:Array;

        public function QuizDataMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quizCode():String;

        public function get questionIds():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.help

