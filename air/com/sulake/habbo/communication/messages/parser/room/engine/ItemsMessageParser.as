//com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ItemsMessageParser implements IMessageParser {

        private var _items:Array;

        public function ItemsMessageParser();

        public function flush():Boolean;

        public function getItemCount():int;

        public function getItem(k:int):ItemMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

