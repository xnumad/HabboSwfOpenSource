package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWCCUE_SHOW_GENDER_SELECTION:String = "RWCCUE_SHOW_GENDER_SELECTION";
        public static const RWCCUE_SHOW_CLOTHING_EDITOR:String = "RWCCUE_SHOW_CLOTHING_EDITOR";

        private var _objectId:int = -1;
        private var _objectCategory:int = -1;
        private var _roomId:int = -1;

        public function RoomWidgetClothingChangeUpdateEvent(k:String, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._objectId = _arg_2;
            this._objectCategory = _arg_3;
            this._roomId = _arg_4;
        }

        public function get objectId():int
        {
            return this._objectId;
        }

        public function get objectCategory():int
        {
            return this._objectCategory;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
