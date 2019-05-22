package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetMultiColoursEvent extends Event 
    {
        private var _colours:Array;
        private var _backgroundAssetName:String;
        private var _colourAssetName:String;
        private var _chosenColourAssetName:String;

        public function CatalogWidgetMultiColoursEvent(k:Array, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(CatalogWidgetEvent.MULTI_COLOUR_ARRAY, _arg_5, _arg_6);
            this._colours = k;
            this._backgroundAssetName = _arg_2;
            this._colourAssetName = _arg_3;
            this._chosenColourAssetName = _arg_4;
        }

        public function get colours():Array
        {
            return this._colours;
        }

        public function get _Str_17113():String
        {
            return this._backgroundAssetName;
        }

        public function get _Str_17801():String
        {
            return this._colourAssetName;
        }

        public function get _Str_17175():String
        {
            return this._chosenColourAssetName;
        }
    }
}
