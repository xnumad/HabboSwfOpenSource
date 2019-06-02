//com.sulake.habbo.communication.messages.parser.poll.PollOfferParser

package com.sulake.habbo.communication.messages.parser.poll{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PollOfferParser implements IMessageParser {

        private var _id:int;
        private var _summary:String;

        public function PollOfferParser();

        public function get id():int;

        public function get summary():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.poll

