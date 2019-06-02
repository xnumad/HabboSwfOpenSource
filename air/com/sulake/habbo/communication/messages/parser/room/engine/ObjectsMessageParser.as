//com.sulake.habbo.communication.messages.parser.room.engine.ObjectsMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ObjectsMessageParser implements IMessageParser {

        private var _objects:Array;

        public function ObjectsMessageParser();

        public function flush():Boolean;

        public function getObjectCount():int;

        public function getObject(k:int):ObjectMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

