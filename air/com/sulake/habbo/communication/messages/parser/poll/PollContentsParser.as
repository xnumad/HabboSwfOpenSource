//com.sulake.habbo.communication.messages.parser.poll.PollContentsParser

package com.sulake.habbo.communication.messages.parser.poll{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PollContentsParser implements IMessageParser {

        private var _id:int;
        private var _startMessage:String;
        private var _endMessage:String;
        private var _numQuestions:int;
        private var _questionArray:Array;

        public function PollContentsParser();

        public function get id():int;

        public function get startMessage():String;

        public function get endMessage():String;

        public function get numQuestions():int;

        public function get questionArray():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.poll

