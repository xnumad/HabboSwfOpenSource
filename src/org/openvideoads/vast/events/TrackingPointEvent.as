package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.tracking._Str_2460;

    public class TrackingPointEvent extends Event 
    {
        public static const _Str_17334:String = "tp-set";
        public static const _Str_7314:String = "tp-fired";
        public static const BA:String = "BA";
        public static const EA:String = "EA";
        public static const LINEAR_AD_Q1:String = "Q1";
        public static const HW:String = "HW";
        public static const LINEAR_AD_Q3:String = "Q3";
        public static const BS:String = "BS";
        public static const ES:String = "ES";

        protected var _data:Object = null;

        public function TrackingPointEvent(k:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            if (_arg_2 != null)
            {
                this._data = _arg_2;
            }
        }

        public function get eventType():String
        {
            if (this._Str_24608())
            {
                return this.trackingPoint.type;
            }
            return null;
        }

        public function _Str_26012():Boolean
        {
            return this.eventType == BA;
        }

        public function _Str_25943():Boolean
        {
            return this.eventType == EA;
        }

        public function _Str_13568():Boolean
        {
            return !(this._data == null);
        }

        public function set data(k:Object):void
        {
            this._data = k;
        }

        public function get data():Object
        {
            return this._data;
        }

        public function _Str_24608():Boolean
        {
            return (!(this._data == null)) && (this.data is _Str_2460);
        }

        public function get trackingPoint():_Str_2460
        {
            return this._data as _Str_2460;
        }

        override public function clone():Event
        {
            return new TrackingPointEvent(type, this._data, bubbles, cancelable);
        }

        override public function toString():String
        {
            return this._data.toString();
        }
    }
}
