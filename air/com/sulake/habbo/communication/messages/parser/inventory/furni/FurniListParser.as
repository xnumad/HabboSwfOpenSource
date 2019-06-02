//com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListParser

package com.sulake.habbo.communication.messages.parser.inventory.furni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurniListParser implements IMessageParser {

        protected var _totalFragments:int;
        protected var _fragmentNo:int;
        private var _furniFragment:Map;

        public function FurniListParser();

        public function get totalFragments():int;

        public function get fragmentNo():int;

        public function get furniFragment():Map;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.furni

