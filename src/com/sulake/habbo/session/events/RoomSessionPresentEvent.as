package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPresentEvent extends RoomSessionEvent 
    {
        public static const RSPE_PRESENT_OPENED:String = "RSPE_PRESENT_OPENED";

        private var _classId:int = 0;
        private var _itemType:String = "";
        private var _productCode:String;
        private var _placedItemId:int = 0;
        private var _placedItemType:String = "";
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;

        public function RoomSessionPresentEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:String, _arg_8:Boolean, _arg_9:String, _arg_10:Boolean=false, _arg_11:Boolean=false)
        {
            super(k, _arg_2, _arg_10, _arg_11);
            this._classId = _arg_3;
            this._itemType = _arg_4;
            this._productCode = _arg_5;
            this._placedItemId = _arg_6;
            this._placedItemType = _arg_7;
            this._placedInRoom = _arg_8;
            this._petFigureString = _arg_9;
        }

        public function get classId():int
        {
            return this._classId;
        }

        public function get _Str_2887():String
        {
            return this._itemType;
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get placedItemId():int
        {
            return this._placedItemId;
        }

        public function get _Str_4057():Boolean
        {
            return this._placedInRoom;
        }

        public function get placedItemType():String
        {
            return this._placedItemType;
        }

        public function get petFigureString():String
        {
            return this._petFigureString;
        }
    }
}
