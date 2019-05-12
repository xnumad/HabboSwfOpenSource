package org.openvideoads.regions.events
{
    import flash.events.Event;
    import org.openvideoads.regions.view.RegionView;
    import flash.events.MouseEvent;

    public class _Str_6326 extends Event 
    {
        public static const _Str_18707:String = "region-clicked";

        protected var _Str_16177:RegionView;
        protected var _Str_6489:MouseEvent = null;

        public function _Str_6326(k:String, _arg_2:RegionView, _arg_3:MouseEvent, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._Str_16177 = _arg_2;
            this._Str_6489 = _arg_3;
        }

        public function get _Str_24777():RegionView
        {
            return this._Str_16177;
        }

        public function get regionID():String
        {
            return this._Str_16177.id;
        }

        public function set _Str_13787(k:MouseEvent):void
        {
            this._Str_6489 = k;
        }

        public function get _Str_13787():MouseEvent
        {
            return this._Str_6489;
        }

        override public function clone():Event
        {
            return new _Str_6326(type, this._Str_24777, this._Str_13787, bubbles, cancelable);
        }
    }
}
