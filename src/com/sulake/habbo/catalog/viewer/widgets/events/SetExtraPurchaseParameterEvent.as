package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class SetExtraPurchaseParameterEvent extends Event 
    {
        private var _parameter:String;

        public function SetExtraPurchaseParameterEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.SET_EXTRA_PARM, _arg_2, _arg_3);
            this._parameter = k;
        }

        public function get parameter():String
        {
            return this._parameter;
        }
    }
}
