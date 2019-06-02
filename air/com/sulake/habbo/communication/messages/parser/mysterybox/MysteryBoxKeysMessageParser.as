//com.sulake.habbo.communication.messages.parser.mysterybox.MysteryBoxKeysMessageParser

package com.sulake.habbo.communication.messages.parser.mysterybox{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MysteryBoxKeysMessageParser implements IMessageParser {

        private var _boxColor:String;
        private var _keyColor:String;

        public function MysteryBoxKeysMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get boxColor():String;

        public function get keyColor():String;


    }
}//package com.sulake.habbo.communication.messages.parser.mysterybox

