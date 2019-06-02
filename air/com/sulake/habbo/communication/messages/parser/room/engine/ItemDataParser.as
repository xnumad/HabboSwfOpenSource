//com.sulake.habbo.communication.messages.parser.room.engine.ItemDataParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;

    public class ItemDataParser {

        public function ItemDataParser();

        public static function parseItemData(k:IMessageDataWrapper):ItemMessageData;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

