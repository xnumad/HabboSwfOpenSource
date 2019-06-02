//com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListInvalidateParser

package com.sulake.habbo.communication.messages.parser.inventory.furni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurniListInvalidateParser implements IMessageParser {

        public function FurniListInvalidateParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.furni

