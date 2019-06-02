//com.sulake.habbo.communication.messages.parser.room.engine.ObjectUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ObjectUpdateMessageParser implements IMessageParser {

        private var _data:ObjectMessageData;

        public function ObjectUpdateMessageParser();

        public function flush():Boolean;

        public function get data():ObjectMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

