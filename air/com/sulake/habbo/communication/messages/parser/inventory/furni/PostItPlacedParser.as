//com.sulake.habbo.communication.messages.parser.inventory.furni.PostItPlacedParser

package com.sulake.habbo.communication.messages.parser.inventory.furni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PostItPlacedParser implements IMessageParser {

        private var _id:int;
        private var _itemsLeft:int;

        public function PostItPlacedParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get id():int;

        public function get itemsLeft():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.furni

