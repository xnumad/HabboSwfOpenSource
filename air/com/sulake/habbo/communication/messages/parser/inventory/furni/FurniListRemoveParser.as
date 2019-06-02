//com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListRemoveParser

package com.sulake.habbo.communication.messages.parser.inventory.furni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurniListRemoveParser implements IMessageParser {

        private var _itemId:int;

        public function FurniListRemoveParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get stripId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.furni

