//com.sulake.habbo.communication.messages.parser.room.engine.ItemDataUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ItemDataUpdateMessageParser implements IMessageParser {

        private var _id:int;
        private var _itemData:String;

        public function ItemDataUpdateMessageParser();

        public function get id():int;

        public function get itemData():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

