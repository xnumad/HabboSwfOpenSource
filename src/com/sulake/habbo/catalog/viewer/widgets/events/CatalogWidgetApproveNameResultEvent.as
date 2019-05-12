package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetApproveNameResultEvent extends Event 
    {
        private var _result:int;
        private var _nameValidationInfo:String;

        public function CatalogWidgetApproveNameResultEvent(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(CatalogWidgetEvent.APPROVE_RESULT, _arg_3, _arg_4);
            this._result = k;
            this._nameValidationInfo = _arg_2;
        }

        public function get result():int
        {
            return this._result;
        }

        public function get nameValidationInfo():String
        {
            return this._nameValidationInfo;
        }
    }
}
