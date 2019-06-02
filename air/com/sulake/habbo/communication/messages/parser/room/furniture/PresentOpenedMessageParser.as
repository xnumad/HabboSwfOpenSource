//com.sulake.habbo.communication.messages.parser.room.furniture.PresentOpenedMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PresentOpenedMessageParser implements IMessageParser {

        private var _itemType:String;
        private var _classId:int;
        private var _productCode:String;
        private var _placedItemId:int;
        private var _placedItemType:String;
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;

        public function PresentOpenedMessageParser();

        public function get itemType():String;

        public function get classId():int;

        public function get productCode():String;

        public function get placedItemId():int;

        public function get placedItemType():String;

        public function get placedInRoom():Boolean;

        public function get petFigureString():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

