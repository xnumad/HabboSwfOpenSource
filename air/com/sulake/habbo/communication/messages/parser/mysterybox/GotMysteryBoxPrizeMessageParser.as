//com.sulake.habbo.communication.messages.parser.mysterybox.GotMysteryBoxPrizeMessageParser

package com.sulake.habbo.communication.messages.parser.mysterybox{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GotMysteryBoxPrizeMessageParser implements IMessageParser {

        private var _contentType:String;
        private var _classId:int;

        public function GotMysteryBoxPrizeMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get contentType():String;

        public function get classId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.mysterybox

