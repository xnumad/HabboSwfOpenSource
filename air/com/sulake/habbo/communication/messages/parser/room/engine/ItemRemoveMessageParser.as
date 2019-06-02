//com.sulake.habbo.communication.messages.parser.room.engine.ItemRemoveMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ItemRemoveMessageParser implements IMessageParser {

        private var _itemId:int;
        private var _pickerId:int;

        public function ItemRemoveMessageParser();

        public function get itemId():int;

        public function get pickerId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

