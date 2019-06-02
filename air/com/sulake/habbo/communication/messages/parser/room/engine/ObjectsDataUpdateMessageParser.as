//com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ObjectsDataUpdateMessageParser implements IMessageParser {

        private var _objects:Array;

        public function ObjectsDataUpdateMessageParser();

        public function get objectCount():int;

        public function getObjectData(k:int):ObjectData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

