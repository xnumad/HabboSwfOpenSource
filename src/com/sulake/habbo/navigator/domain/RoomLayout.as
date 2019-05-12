package com.sulake.habbo.navigator.domain
{
    import com.sulake.core.window.IWindowContainer;

    public class RoomLayout 
    {
        private var _level:int;
        private var _tileSize:int;
        private var _name:String;
        private var _view:IWindowContainer;

        public function RoomLayout(k:int, _arg_2:int, _arg_3:String)
        {
            this._level = k;
            this._tileSize = _arg_2;
            this._name = _arg_3;
        }

        public function get _Str_17446():int
        {
            return this._level;
        }

        public function get _Str_15099():int
        {
            return this._tileSize;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function set view(k:IWindowContainer):void
        {
            this._view = k;
        }
    }
}
