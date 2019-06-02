//com.sulake.habbo.communication.messages.parser.mysterybox.ShowMysteryBoxWaitMessageParser

package com.sulake.habbo.communication.messages.parser.mysterybox{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ShowMysteryBoxWaitMessageParser implements IMessageParser {

        public function ShowMysteryBoxWaitMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.mysterybox

