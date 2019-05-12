package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetSpinnerEvent extends Event 
    {
        public static const CWSE_VALUE_CHANGED:String = "CWSE_VALUE_CHANGED";
        public static const CWSE_RESET:String = "CWSE_RESET";
        public static const CWSE_SHOW:String = "CWSE_SHOW";
        public static const CWSE_HIDE:String = "CWSE_HIDE";
        public static const CWSE_SET_MAX:String = "CWSE_SET_MAX";
        public static const CWSE_SET_MIN:String = "CWSE_SET_MIN";

        private var _value:int;
        private var _skipSteps:Array;

        public function CatalogWidgetSpinnerEvent(k:String, _arg_2:int=1, _arg_3:Array=null)
        {
            super(k);
            this._value = _arg_2;
            this._skipSteps = _arg_3;
        }

        public function get value():int
        {
            return this._value;
        }

        public function get _Str_21173():Array
        {
            return this._skipSteps;
        }
    }
}
