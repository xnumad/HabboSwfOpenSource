//com.sulake.habbo.communication.messages.parser.help.FaqTextMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaqTextMessageParser implements IMessageParser {

        private var _questionId:int;
        private var _answerText:String;

        public function FaqTextMessageParser();

        public function get questionId():int;

        public function get answerText():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

