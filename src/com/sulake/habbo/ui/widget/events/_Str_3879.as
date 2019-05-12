package com.sulake.habbo.ui.widget.events
{
    public class _Str_3879 extends RoomWidgetUpdateEvent 
    {
        public static const RWRQUE_VISITOR_QUEUE_STATUS:String = "RWRQUE_VISITOR_QUEUE_STATUS";
        public static const RWRQUE_SPECTATOR_QUEUE_STATUS:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";

        private var _position:int;
        private var _Str_19946:Boolean;
        private var _isActive:Boolean;
        private var _Str_9011:Boolean;

        public function _Str_3879(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(k, _arg_6, _arg_7);
            this._position = _arg_2;
            this._Str_19946 = _arg_3;
            this._isActive = _arg_4;
            this._Str_9011 = _arg_5;
        }

        public function get position():int
        {
            return this._position;
        }

        public function get _Str_25661():Boolean
        {
            return this._Str_19946;
        }

        public function get isActive():Boolean
        {
            return this._isActive;
        }

        public function get _Str_23206():Boolean
        {
            return this._Str_9011;
        }
    }
}
