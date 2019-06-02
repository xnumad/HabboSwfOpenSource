//com.sulake.habbo.communication.messages.parser.mysterybox.CancelMysteryBoxWaitMessageParser

package com.sulake.habbo.communication.messages.parser.mysterybox{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CancelMysteryBoxWaitMessageParser implements IMessageParser {

        public function CancelMysteryBoxWaitMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.mysterybox

