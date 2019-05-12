package com.sulake.habbo.groups.badge
{
    public class BadgeLayerOptions 
    {
        private var _layerIndex:int = -1;
        private var _partIndex:int = -1;
        private var _colorIndex:int = -1;
        private var _gridX:int = -1;
        private var _gridY:int = -1;


        public function _Str_25730(k:int):void
        {
            this._gridX = Math.floor((k % 3));
            this._gridY = Math.floor((k / 3));
        }

        public function clone():BadgeLayerOptions
        {
            var k:BadgeLayerOptions = new BadgeLayerOptions();
            k._layerIndex = this._layerIndex;
            k._partIndex = this._partIndex;
            k._colorIndex = this._colorIndex;
            k._gridX = this._gridX;
            k._gridY = this._gridY;
            return k;
        }

        public function _Str_23286(k:BadgeLayerOptions):Boolean
        {
            if (((((k == null) || (!(this._gridX == k._Str_7460))) || (!(this._gridY == k._Str_8051))) || (!(this._colorIndex == k.colorIndex))))
            {
                return false;
            }
            if ((((this._layerIndex == 0) && (!(k._Str_3617 == 0))) || ((!(this._layerIndex == 0)) && (k._Str_3617 == 0))))
            {
                return false;
            }
            return true;
        }

        public function _Str_22335(k:BadgeLayerOptions):Boolean
        {
            if (((k._Str_7460 == this._gridX) && (k._Str_8051 == this._gridY)))
            {
                return true;
            }
            return false;
        }

        public function get _Str_3617():int
        {
            return this._layerIndex;
        }

        public function set _Str_3617(k:int):void
        {
            this._layerIndex = k;
        }

        public function get _Str_3324():int
        {
            return this._partIndex;
        }

        public function set _Str_3324(k:int):void
        {
            this._partIndex = k;
        }

        public function get colorIndex():int
        {
            return this._colorIndex;
        }

        public function set colorIndex(k:int):void
        {
            this._colorIndex = k;
        }

        public function get _Str_7460():int
        {
            return this._gridX;
        }

        public function set _Str_7460(k:int):void
        {
            this._gridX = k;
        }

        public function get _Str_8051():int
        {
            return this._gridY;
        }

        public function set _Str_8051(k:int):void
        {
            this._gridY = k;
        }

        public function get position():int
        {
            return (this._Str_8051 * 3) + this._Str_7460;
        }
    }
}
