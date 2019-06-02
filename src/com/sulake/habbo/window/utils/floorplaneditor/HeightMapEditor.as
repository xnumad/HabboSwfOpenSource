package com.sulake.habbo.window.utils.floorplaneditor
{
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import flash.display.Bitmap;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.geom.ColorTransform;
    import __AS3__.vec.*;
    import com.sulake.habbo.window.utils.floorplaneditor.images.*;

    public class HeightMapEditor 
    {
        public static var _Str_9308:Class = HeightMapEditor__Str_9308;
        public static var _Str_8636:Class = HeightMapEditor__Str_8636;
        public static var _Str_14896:Class = HeightMapEditor__Str_14896;
        public static var _Str_14803:Class = HeightMapEditor__Str_14803;
        public static const _Str_7283:int = 30;

        private var _Str_2594:BCFloorPlanEditor;
        private var _Str_4263:Boolean = false;
        private var _Str_12032:int = 0;
        private var _Str_12507:BitmapData;
        private var _Str_14705:BitmapData;
        private var _Str_14480:Vector.<Array>;
        private var _Str_18797:Vector.<Array>;
        private var _Str_23079:IBitmapWrapperWindow;
        private var _Str_4248:Point;
        private var _Str_3390:FloorPlanCache;
        private var _Str_17828:Boolean = false;
        private var _Str_9022:int = 1;
        private var _Str_14057:Boolean = false;

        public function HeightMapEditor(k:BCFloorPlanEditor)
        {
            var _local_3:Number;
            this._Str_4248 = new Point(-1000, -1000);
            super();
            this._Str_2594 = k;
            this._Str_2594._Str_4964.procedure = this._Str_16600;
            this._Str_3390 = k._Str_4134;
            this._Str_12507 = Bitmap(new _Str_9308()).bitmapData;
            this._Str_14705 = Bitmap(new _Str_8636()).bitmapData;
            this._Str_14480 = new Vector.<Array>();
            this._Str_18797 = new Vector.<Array>();
            var _local_2:int;
            while (_local_2 < _Str_7283)
            {
                _local_3 = (0.6 - ((_local_2 / Number(_Str_7283)) * 0.85));
                if (_local_3 < 0)
                {
                    _local_3 = (1 + _local_3);
                }
                this._Str_14480.push(_Str_14174(_local_3, 1, 0.5));
                this._Str_18797.push(_Str_14174(_local_3, 0.33, 0.4));
                _local_2++;
            }
        }

        public static function _Str_14174(h:Number, s:Number, l:Number):Array
        {
            var r:Number;
            var g:Number;
            var b:Number;
            var q:Number;
            var p:Number;
            if (s == 0)
            {
                r = (g = (b = l));
            }
            else
            {
                var hue2rgb:Function = function (k:Number, _arg_2:Number, _arg_3:Number):Number
                {
                    if (_arg_3 < 0)
                    {
                        _arg_3 = (_arg_3 + 1);
                    }
                    if (_arg_3 > 1)
                    {
                        _arg_3--;
                    }
                    if (_arg_3 < (1 / 6))
                    {
                        return k + (((_arg_2 - k) * 6) * _arg_3);
                    }
                    if (_arg_3 < (1 / 2))
                    {
                        return _arg_2;
                    }
                    if (_arg_3 < (2 / 3))
                    {
                        return k + (((_arg_2 - k) * ((2 / 3) - _arg_3)) * 6);
                    }
                    return k;
                }
                q = ((l < 0.5) ? (l * (1 + s)) : ((l + s) - (l * s)));
                p = ((2 * l) - q);
                r = hue2rgb(p, q, (h + (1 / 3)));
                g = hue2rgb(p, q, h);
                b = hue2rgb(p, q, (h - (1 / 3)));
            }
            return [r, g, b];
        }


        public function get _Str_17977():Vector.<Array>
        {
            return this._Str_14480;
        }

        public function set _Str_9167(k:int):void
        {
            this._Str_12032 = Math.min(_Str_7283, Math.max(0, k));
        }

        public function get _Str_9167():int
        {
            return this._Str_12032;
        }

        public function set _Str_22137(k:Boolean):void
        {
            this._Str_4263 = k;
        }

        public function _Str_9032():void
        {
            this._Str_23079 = this._Str_2594._Str_4964;
            this._Str_4248 = new Point(-1000, -1000);
            this._Str_2491();
        }

        private function _Str_16600(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Point;
            var _local_6:Object;
            if (this._Str_17828)
            {
                if (k.type == WindowMouseEvent.CLICK)
                {
                    _local_3 = ((this._Str_2594._Str_4964.width / 2) - (this._Str_2594._Str_4964.bitmap.width / 2));
                    _local_4 = ((this._Str_2594._Str_4964.height / 2) - (this._Str_2594._Str_4964.bitmap.height / 2));
                    _local_5 = this._Str_21037((WindowMouseEvent(k).localX - _local_3), (WindowMouseEvent(k).localY - _local_4));
                    this._Str_12032 = this._Str_2594._Str_4134._Str_4203(_local_5.x, _local_5.y);
                    this._Str_2594._Str_19677(this._Str_12032);
                }
            }
            else
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    this._Str_4263 = false;
                }
                if (k.type == WindowMouseEvent.DOWN)
                {
                    this._Str_4263 = true;
                    this._Str_14057 = true;
                    this._Str_4248 = new Point(-1000, -1000);
                }
                if (((k.type == WindowMouseEvent.CLICK) || ((this._Str_4263) && (k.type == WindowMouseEvent.MOVE))))
                {
                    _local_3 = ((this._Str_2594._Str_4964.width / 2) - (this._Str_2594._Str_4964.bitmap.width / 2));
                    _local_4 = ((this._Str_2594._Str_4964.height / 2) - (this._Str_2594._Str_4964.bitmap.height / 2));
                    _local_5 = this._Str_21037((WindowMouseEvent(k).localX - _local_3), (WindowMouseEvent(k).localY - _local_4));
                    if (k.type == WindowMouseEvent.MOVE)
                    {
                        if ((((this._Str_14057) || (!(this._Str_4248.x == _local_5.x))) || (!(this._Str_4248.y == _local_5.y))))
                        {
                            this._Str_14762(_local_5.x, _local_5.y);
                        }
                        _local_6 = this._Str_23087(_local_5);
                        if ((((this._Str_14057) || (Math.abs(_local_6.x) > 0)) || (Math.abs(_local_6.y) > 0)))
                        {
                            this._Str_2491();
                        }
                        this._Str_14057 = false;
                    }
                    else
                    {
                        this._Str_14762(_local_5.x, _local_5.y);
                        this._Str_2491();
                    }
                    this._Str_4248 = _local_5;
                }
            }
        }

        private function _Str_23087(k:Point):Object
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (((this._Str_4248.x == -1000) && (this._Str_4248.y == -1000)))
            {
                this._Str_4248.x = k.x;
                this._Str_4248.y = k.y;
            }
            var _local_2:int = (k.x - this._Str_4248.x);
            var _local_3:int = (k.y - this._Str_4248.y);
            _local_4 = 0;
            _local_5 = this._Str_4248.x;
            while (_local_5 != k.x)
            {
                if (((_local_4 > 0) && (_local_4 < Math.abs(_local_2))))
                {
                    this._Str_14762(_local_5, k.y);
                }
                _local_5 = (_local_5 + ((_local_2 > 0) ? 1 : -1));
                _local_4++;
            }
            _local_4 = 0;
            _local_6 = this._Str_4248.y;
            while (_local_6 != k.y)
            {
                if (((_local_4 > 0) && (_local_4 < Math.abs(_local_3))))
                {
                    this._Str_14762(k.x, _local_6);
                }
                _local_6 = (_local_6 + ((_local_3 > 0) ? 1 : -1));
                _local_4++;
            }
            return ({
                "x":_local_2,
                "y":_local_3
            });
        }

        private function _Str_14762(k:int, _arg_2:int):void
        {
            var _local_3:int;
            switch (this._Str_2594._Str_25243)
            {
                case this._Str_2594._Str_11016[0]:
                    this._Str_2594._Str_4134._Str_13296(k, _arg_2, this._Str_12032);
                    return;
                case this._Str_2594._Str_11016[1]:
                    this._Str_2594._Str_4134._Str_13296(k, _arg_2, -1);
                    return;
                case this._Str_2594._Str_11016[2]:
                    _local_3 = this._Str_2594._Str_4134._Str_4203(k, _arg_2);
                    if (_local_3 >= 0)
                    {
                        this._Str_2594._Str_4134._Str_13296(k, _arg_2, Math.min((_Str_7283 - 1), (_local_3 + 1)));
                    }
                    return;
                case this._Str_2594._Str_11016[3]:
                    _local_3 = this._Str_2594._Str_4134._Str_4203(k, _arg_2);
                    if (_local_3 >= 0)
                    {
                        this._Str_2594._Str_4134._Str_13296(k, _arg_2, Math.max(0, (_local_3 - 1)));
                    }
                    return;
                case this._Str_2594._Str_11016[4]:
                    _local_3 = this._Str_2594._Str_4134._Str_4203(k, _arg_2);
                    if (_local_3 >= 0)
                    {
                        this._Str_2594._Str_4134._Str_7642 = new Point(k, _arg_2);
                    }
                    return;
            }
        }

        private function _Str_2491():void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:BitmapData;
            var _local_12:Object;
            var _local_13:Point;
            var _local_14:int;
            var k:Array = [];
            var _local_2:int = int.MAX_VALUE;
            var _local_3:int = int.MAX_VALUE;
            var _local_4:int = int.MIN_VALUE;
            var _local_5:int = int.MIN_VALUE;
            _local_7 = 0;
            while (_local_7 < this._Str_3390.floorHeight)
            {
                _local_6 = 0;
                while (_local_6 < this._Str_3390._Str_17437)
                {
                    _local_13 = this._Str_24652(_local_6, _local_7);
                    _local_2 = Math.min(_local_2, _local_13.x);
                    _local_3 = Math.min(_local_3, _local_13.y);
                    _local_4 = Math.max(_local_4, _local_13.x);
                    _local_5 = Math.max(_local_5, _local_13.y);
                    if (this._Str_3390._Str_21855(_local_6, _local_7))
                    {
                        _local_9 = this._Str_14705.clone();
                        k.push({
                            "point":_local_13,
                            "image":_local_9
                        });
                    }
                    else
                    {
                        _local_14 = Math.min(this._Str_3390._Str_4203(_local_6, _local_7), (_Str_7283 - 1));
                        if (_local_14 >= 0)
                        {
                            _local_8 = ((this._Str_3390._Str_19261(_local_6, _local_7)) ? this._Str_18797[_local_14] : this._Str_14480[_local_14]);
                            _local_9 = this._Str_12507.clone();
                            _local_9.colorTransform(this._Str_12507.rect, new ColorTransform(_local_8[0], _local_8[1], _local_8[2]));
                            k.push({
                                "point":_local_13,
                                "image":_local_9
                            });
                        }
                    }
                    _local_6++;
                }
                _local_7++;
            }
            var _local_10:BitmapData = new BitmapData(((_local_4 - _local_2) + 18), ((_local_5 - _local_3) + 9), false, 0);
            var _local_11:Point = new Point(-(_local_2), -(_local_3));
            for each (_local_12 in k)
            {
                _local_10.copyPixels(_local_12.image, _local_12.image.rect, _local_12.point.add(_local_11));
            }
            this._Str_2594._Str_4964.bitmap = _local_10;
        }

        private function _Str_21037(k:int, _arg_2:int):Point
        {
            var _local_3:Number = ((k / 16) / this._Str_9022);
            var _local_4:Number = ((_arg_2 / 8) / this._Str_9022);
            var _local_5:Number = this._Str_3390.floorHeight;
            var _local_6:int = (_local_4 + (_local_3 - (_local_5 / 2)));
            var _local_7:int = (_local_4 - (_local_3 - (_local_5 / 2)));
            return new Point(_local_6, _local_7);
        }

        private function _Str_24652(k:int, _arg_2:int):Point
        {
            return new Point(((this._Str_9022 * 8) * (k - _arg_2)), ((this._Str_9022 * 4) * (k + _arg_2)));
        }

        public function get _Str_12874():Boolean
        {
            return this._Str_17828;
        }

        public function set _Str_12874(k:Boolean):void
        {
            this._Str_17828 = k;
        }

        public function get _Str_6594():int
        {
            return this._Str_9022;
        }

        public function set _Str_6594(k:int):void
        {
            if (((k < 1) || (k > 2)))
            {
                return;
            }
            switch (k)
            {
                case 1:
                    this._Str_12507 = Bitmap(new _Str_9308()).bitmapData;
                    this._Str_14705 = Bitmap(new _Str_8636()).bitmapData;
                    break;
                case 2:
                    this._Str_12507 = Bitmap(new _Str_14896()).bitmapData;
                    this._Str_14705 = Bitmap(new _Str_14803()).bitmapData;
                    break;
            }
            this._Str_9022 = k;
        }
    }
}
