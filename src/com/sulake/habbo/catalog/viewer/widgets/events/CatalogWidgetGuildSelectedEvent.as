package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetGuildSelectedEvent extends Event 
    {
        public static const _Str_15457:int = -1;

        private var _Str_2994:int;
        private var _color1:String;
        private var _color2:String;
        private var _Str_2722:String;

        public function CatalogWidgetGuildSelectedEvent(k:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            this._Str_2994 = k;
            this._color1 = _arg_2;
            this._color2 = _arg_3;
            this._Str_2722 = _arg_4;
            super(CatalogWidgetEvent.GUILD_SELECTED);
        }

        public function get _Str_3916():int
        {
            return this._Str_2994;
        }

        public function get color1():String
        {
            return this._color1;
        }

        public function get color2():String
        {
            return this._color2;
        }

        public function get badgeCode():String
        {
            return this._Str_2722;
        }
    }
}
