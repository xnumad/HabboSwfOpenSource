//com.sulake.habbo.communication.messages.parser.room.furniture.CustomStackingHeightUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CustomStackingHeightUpdateMessageParser implements IMessageParser {

        private var _furniId:int;
        private var _height:Number;

        public function CustomStackingHeightUpdateMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get height():Number;

        public function get furniId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

