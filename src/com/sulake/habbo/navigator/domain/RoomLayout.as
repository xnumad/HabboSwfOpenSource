package com.sulake.habbo.navigator.domain
{
    import com.sulake.core.window.IWindowContainer;

    public class RoomLayout 
    {
        private var _level:int;
        private var _tileSize:int;
        private var _name:String;
        private var _view:IWindowContainer;

        public function RoomLayout(_level:int, _tileSize:int, _name:String)
        {
            this._level = _level;
            this._tileSize = _tileSize;
            this._name = _name;
        }

        public function get requiredClubLevel():int
        {
            return this._level;
        }

        public function get tileSize():int
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
