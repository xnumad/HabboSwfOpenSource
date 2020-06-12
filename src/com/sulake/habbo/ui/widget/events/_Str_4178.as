package com.sulake.habbo.ui.widget.events
{
    public class _Str_4178 extends RoomWidgetUpdateEvent 
    {
        public static const RWCCE_USER_CHOOSER_CONTENT:String = "RWCCE_USER_CHOOSER_CONTENT";
        public static const RWCCE_FURNI_CHOOSER_CONTENT:String = "RWCCE_FURNI_CHOOSER_CONTENT";

        private var _items:Array;
        private var _isAnyRoomController:Boolean;

        public function _Str_4178(k:String, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._items = _arg_2.slice();
            this._isAnyRoomController = _arg_3;
        }

        public function get items():Array
        {
            return this._items;
        }

        public function get isAnyRoomController():Boolean
        {
            return this._isAnyRoomController;
        }
    }
}
