package com.sulake.habbo.avatar.animation
{
    public class DirectionDataContainer 
    {
        private var _offset:int;

        public function DirectionDataContainer(k:XML)
        {
            this._offset = parseInt(k.@offset);
        }

        public function get offset():int
        {
            return this._offset;
        }
    }
}
