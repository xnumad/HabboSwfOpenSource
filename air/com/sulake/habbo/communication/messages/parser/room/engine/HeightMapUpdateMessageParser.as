//com.sulake.habbo.communication.messages.parser.room.engine.HeightMapUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HeightMapUpdateMessageParser implements IMessageParser {

        private var _data:IMessageDataWrapper;
        private var _count:int;
        private var _x:int;
        private var _y:int;
        private var _value:int;

        public function HeightMapUpdateMessageParser();

        public function next():Boolean;

        public function get x():int;

        public function get y():int;

        public function get tileHeight():Number;

        public function get isStackingBlocked():Boolean;

        public function get isRoomTile():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

