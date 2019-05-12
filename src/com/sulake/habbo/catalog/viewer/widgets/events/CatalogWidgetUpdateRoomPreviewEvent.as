package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetUpdateRoomPreviewEvent extends Event 
    {
        private var _wallType:String = "default";
        private var _floorType:String = "default";
        private var _landscapeType:String = "1.1";
        private var _tileSize:int = 64;

        public function CatalogWidgetUpdateRoomPreviewEvent(k:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(CatalogWidgetEvent.UPDATE_ROOM_PREVIEW, _arg_5, _arg_6);
            this._floorType = k;
            this._wallType = _arg_2;
            this._landscapeType = _arg_3;
            this._tileSize = _arg_4;
        }

        public function get _Str_5259():String
        {
            return this._wallType;
        }

        public function get _Str_5207():String
        {
            return this._floorType;
        }

        public function get _Str_5109():String
        {
            return this._landscapeType;
        }

        public function get _Str_15099():int
        {
            return this._tileSize;
        }
    }
}
