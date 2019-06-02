//com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ObjectDataUpdateMessageParser implements IMessageParser {

        private var _id:int;
        private var _state:int;
        private var _data:IStuffData;

        public function ObjectDataUpdateMessageParser();

        public function get id():int;

        public function get state():int;

        public function get data():IStuffData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

