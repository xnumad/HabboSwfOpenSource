//com.sulake.habbo.communication.messages.parser.room.engine.ItemUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ItemUpdateMessageParser implements IMessageParser {

        private var _item:ItemMessageData;

        public function ItemUpdateMessageParser();

        public function flush():Boolean;

        public function get data():ItemMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

