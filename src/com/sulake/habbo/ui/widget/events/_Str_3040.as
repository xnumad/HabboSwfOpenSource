package com.sulake.habbo.ui.widget.events
{
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class _Str_3040 extends RoomWidgetUpdateEvent 
    {
        public static const RWRVUE_ROOM_VIEW_SIZE_CHANGED:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
        public static const RWRVUE_ROOM_VIEW_SCALE_CHANGED:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
        public static const RWRVUE_ROOM_VIEW_POSITION_CHANGED:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";

        private var _Str_18063:Rectangle;
        private var _Str_17715:Point;
        private var _scale:Number = 0;

        public function _Str_3040(k:String, _arg_2:Rectangle=null, _arg_3:Point=null, _arg_4:Number=0, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_18063 = _arg_2;
            this._Str_17715 = _arg_3;
            this._scale = _arg_4;
        }

        public function get rect():Rectangle
        {
            if (this._Str_18063 != null)
            {
                return this._Str_18063.clone();
            }
            return null;
        }

        public function get _Str_17974():Point
        {
            if (this._Str_17715 != null)
            {
                return this._Str_17715.clone();
            }
            return null;
        }

        public function get scale():Number
        {
            return this._scale;
        }
    }
}
