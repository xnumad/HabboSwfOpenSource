//com.sulake.habbo.communication.messages.parser.room.engine.ObjectRemoveMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ObjectRemoveMessageParser implements IMessageParser {

        private var _id:int;
        private var _isExpired:Boolean;
        private var _pickerId:int;
        private var _delay:int;

        public function ObjectRemoveMessageParser();

        public function get id():int;

        public function get isExpired():Boolean;

        public function get pickerId():int;

        public function get delay():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

