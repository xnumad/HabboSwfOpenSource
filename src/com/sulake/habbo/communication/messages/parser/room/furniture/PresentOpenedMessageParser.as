package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PresentOpenedMessageParser implements IMessageParser
    {
        private var _itemType:String;
        private var _classId:int;
        private var _productCode:String;
        private var _placedItemId:int;
        private var _placedItemType:String;
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;


        public function get itemType():String
        {
            return this._itemType;
        }

        public function get classId():int
        {
            return this._classId;
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get placedItemId():int
        {
            return this._placedItemId;
        }

        public function get placedItemType():String
        {
            return this._placedItemType;
        }

        public function get _Str_4057():Boolean
        {
            return this._placedInRoom;
        }

        public function get petFigureString():String
        {
            return this._petFigureString;
        }

        public function flush():Boolean
        {
            this._itemType = "";
            this._classId = 0;
            this._productCode = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._itemType = k.readString();
            this._classId = k.readInteger();
            this._productCode = k.readString();
            this._placedItemId = k.readInteger();
            this._placedItemType = k.readString();
            this._placedInRoom = k.readBoolean();
            this._petFigureString = k.readString();
            return true;
        }
    }
}
