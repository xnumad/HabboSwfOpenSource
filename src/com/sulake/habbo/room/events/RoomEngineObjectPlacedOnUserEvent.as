package com.sulake.habbo.room.events
{
    public class RoomEngineObjectPlacedOnUserEvent extends RoomEngineObjectEvent 
    {
        private var _droppedObjectId:int;
        private var _droppedObjectCategory:int;

        public function RoomEngineObjectPlacedOnUserEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8);
            this._droppedObjectId = this._Str_22728;
            this._droppedObjectCategory = _arg_6;
        }

        public function get _Str_22728():int
        {
            return this._droppedObjectId;
        }

        public function get _Str_26295():int
        {
            return this._droppedObjectCategory;
        }
    }
}
