//com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetInventoryMessageParser implements IMessageParser {

        protected var _totalFragments:int;
        protected var _fragmentNo:int;
        private var _petListFragment:Map;

        public function PetInventoryMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get petListFragment():Map;

        public function get totalFragments():int;

        public function get fragmentNo():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

