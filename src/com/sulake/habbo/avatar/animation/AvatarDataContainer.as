package com.sulake.habbo.avatar.animation
{
    import flash.geom.ColorTransform;
    import com.sulake.core.utils.Map;

    public class AvatarDataContainer implements IAvatarDataContainer 
    {
        private var _ink:int;
        private var _foreGround:uint;
        private var _backGround:uint;
        private var _colorTransform:ColorTransform;
        private var _rgb:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _redMultiplier:Number = 1;
        private var _greenMultiplier:Number = 1;
        private var _blueMultiplier:Number = 1;
        private var _alphaMultiplier:Number = 1;
        private var _colorMap:Map;
        private var _paletteIsGrayscale:Boolean = true;

        public function AvatarDataContainer(k:XML)
        {
            this._ink = parseInt(k.@ink);
            var _local_2:String = String(k.@foreground);
            _local_2 = _local_2.replace("#", "");
            var _local_3:String = String(k.@background);
            _local_3 = _local_3.replace("#", "");
            this._foreGround = parseInt(_local_2, 16);
            this._backGround = parseInt(_local_3, 16);
            this._rgb = parseInt(_local_2, 16);
            this._r = ((this._rgb >> 16) & 0xFF);
            this._g = ((this._rgb >> 8) & 0xFF);
            this._b = ((this._rgb >> 0) & 0xFF);
            this._redMultiplier = ((this._r / 0xFF) * 1);
            this._greenMultiplier = ((this._g / 0xFF) * 1);
            this._blueMultiplier = ((this._b / 0xFF) * 1);
            if (this._ink == 37)
            {
                this._alphaMultiplier = 0.5;
                this._paletteIsGrayscale = false;
            }
            this._colorTransform = new ColorTransform(this._redMultiplier, this._greenMultiplier, this._blueMultiplier, this._alphaMultiplier);
            this._colorMap = this.generatePaletteMapForGrayscale(this._backGround, this._foreGround);
        }

        public function get ink():int
        {
            return this._ink;
        }

        public function get colorTransform():ColorTransform
        {
            return this._colorTransform;
        }

        public function get reds():Array
        {
            return this._colorMap.getValue("reds") as Array;
        }

        public function get greens():Array
        {
            return this._colorMap.getValue("greens") as Array;
        }

        public function get blues():Array
        {
            return this._colorMap.getValue("blues") as Array;
        }

        public function get alphas():Array
        {
            return this._colorMap.getValue("alphas") as Array;
        }

        public function get paletteIsGrayscale():Boolean
        {
            return this._paletteIsGrayscale;
        }

        private function generatePaletteMapForGrayscale(k:uint, _arg_2:uint):Map
        {
            var _local_3:* = ((k >> 24) & 0xFF);
            var _local_4:* = ((k >> 16) & 0xFF);
            var _local_5:* = ((k >> 8) & 0xFF);
            var _local_6:* = ((k >> 0) & 0xFF);
            var _local_7:* = ((_arg_2 >> 24) & 0xFF);
            var _local_8:* = ((_arg_2 >> 16) & 0xFF);
            var _local_9:* = ((_arg_2 >> 8) & 0xFF);
            var _local_10:* = ((_arg_2 >> 0) & 0xFF);
            var _local_11:Number = ((_local_7 - _local_3) / 0xFF);
            var _local_12:Number = ((_local_8 - _local_4) / 0xFF);
            var _local_13:Number = ((_local_9 - _local_5) / 0xFF);
            var _local_14:Number = ((_local_10 - _local_6) / 0xFF);
            var _local_15:Map = new Map();
            var _local_16:Array = [];
            var _local_17:Array = [];
            var _local_18:Array = [];
            var _local_19:Array = [];
            var _local_20:Number = _local_3;
            var _local_21:Number = _local_4;
            var _local_22:Number = _local_5;
            var _local_23:Number = _local_6;
            var _local_24:int;
            while (_local_24 < 0x0100)
            {
                if ((((_local_21 == _local_4) && (_local_22 == _local_5)) && (_local_23 == _local_6)))
                {
                    _local_20 = 0;
                }
                _local_20 = (_local_20 + _local_11);
                _local_21 = (_local_21 + _local_12);
                _local_22 = (_local_22 + _local_13);
                _local_23 = (_local_23 + _local_14);
                _local_19.push((_local_20 << 24));
                _local_16.push(((((_local_20 << 24) | (_local_21 << 16)) | (_local_22 << 8)) | _local_23));
                _local_17.push(((((_local_20 << 24) | (_local_21 << 16)) | (_local_22 << 8)) | _local_23));
                _local_18.push(((((_local_20 << 24) | (_local_21 << 16)) | (_local_22 << 8)) | _local_23));
                _local_24++;
            }
            _local_15.add("alphas", _local_16);
            _local_15.add("reds", _local_16);
            _local_15.add("greens", _local_17);
            _local_15.add("blues", _local_18);
            return _local_15;
        }
    }
}
