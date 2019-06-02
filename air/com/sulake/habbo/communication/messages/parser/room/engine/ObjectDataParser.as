//com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.habbo.room.IStuffData;

    public class ObjectDataParser {

        public function ObjectDataParser();

        public static function parseObjectData(k:IMessageDataWrapper):ObjectMessageData;

        public static function parseStuffData(k:IMessageDataWrapper):IStuffData;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

