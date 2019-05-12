package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class _Str_4201 extends Event 
    {
        private var _Str_11471:String;
        private var _enabled:Boolean;

        public function _Str_4201(k:String, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(CatalogWidgetEvent.TOGGLE, _arg_3, _arg_4);
            this._Str_11471 = k;
            this._enabled = _arg_2;
        }

        public function get _Str_25555():String
        {
            return this._Str_11471;
        }

        public function get enabled():Boolean
        {
            return this._enabled;
        }
    }
}
