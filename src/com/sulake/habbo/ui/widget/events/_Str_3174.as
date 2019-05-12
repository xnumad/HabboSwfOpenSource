package com.sulake.habbo.ui.widget.events
{
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class _Str_3174 extends RoomWidgetUpdateEvent 
    {
        public static const RWULUE_USER_LOCATION_UPDATE:String = "RWULUE_USER_LOCATION_UPDATE";

        private var _userId:int;
        private var _rectangle:Rectangle;
        private var _Str_20775:Point;

        public function _Str_3174(k:int, _arg_2:Rectangle, _arg_3:Point, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RWULUE_USER_LOCATION_UPDATE, _arg_4, _arg_5);
            this._userId = k;
            this._rectangle = _arg_2;
            this._Str_20775 = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get rectangle():Rectangle
        {
            return this._rectangle;
        }

        public function get _Str_9337():Point
        {
            return this._Str_20775;
        }
    }
}
