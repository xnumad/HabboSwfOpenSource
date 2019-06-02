package com.sulake.habbo.room.object.visualization.data
{
    public class LayerData 
    {
        public static const DEFAULT_TAG:String = "";
        public static const DEFAULT_INK:int = 0;
        public static const DEFAULT_ALPHA:int = 0xFF;
        public static const DEFAULT_IGNORE_MOUSE:Boolean = false;
        public static const DEFAULT_X_OFFSET:int = 0;
        public static const DEFAULT_Y_OFFSET:int = 0;
        public static const DEFAULT_Z_OFFSET:int = 0;
        public static const INK_ADD:int = 1;
        public static const INK_SUBTRACT:int = 2;
        public static const INK_DARKEN:int = 3;

        private var _tag:String = "";
        private var _ink:int = 0;
        private var _alpha:int = 0xFF;
        private var _ignoreMouse:Boolean = false;
        private var _xOffset:int = 0;
        private var _yOffset:int = 0;
        private var _zOffset:Number = 0;


        public function set tag(k:String):void
        {
            this._tag = k;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function set ink(k:int):void
        {
            this._ink = k;
        }

        public function get ink():int
        {
            return this._ink;
        }

        public function set alpha(k:int):void
        {
            this._alpha = k;
        }

        public function get alpha():int
        {
            return this._alpha;
        }

        public function set ignoreMouse(k:Boolean):void
        {
            this._ignoreMouse = k;
        }

        public function get ignoreMouse():Boolean
        {
            return this._ignoreMouse;
        }

        public function set _Str_11051(k:int):void
        {
            this._xOffset = k;
        }

        public function get _Str_11051():int
        {
            return this._xOffset;
        }

        public function set _Str_10285(k:int):void
        {
            this._yOffset = k;
        }

        public function get _Str_10285():int
        {
            return this._yOffset;
        }

        public function set _Str_12320(k:Number):void
        {
            this._zOffset = k;
        }

        public function get _Str_12320():Number
        {
            return this._zOffset;
        }

        public function _Str_17122(k:LayerData):void
        {
            if (k != null)
            {
                this.tag = k.tag;
                this.ink = k.ink;
                this.alpha = k.alpha;
                this.ignoreMouse = k.ignoreMouse;
                this._Str_11051 = k._Str_11051;
                this._Str_10285 = k._Str_10285;
                this._Str_12320 = k._Str_12320;
            }
        }
    }
}
