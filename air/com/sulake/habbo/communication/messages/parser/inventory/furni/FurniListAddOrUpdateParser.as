//com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListAddOrUpdateParser

package com.sulake.habbo.communication.messages.parser.inventory.furni{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurniListAddOrUpdateParser implements IMessageParser {

        protected var _furniList:Vector.<FurniData>;

        public function FurniListAddOrUpdateParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function getFurni():Vector.<FurniData>;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.furni

