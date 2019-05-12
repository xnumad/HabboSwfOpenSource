package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class CalendarBackgroundRenderer implements IDisposable 
    {
        private var _images:Vector.<BitmapData>;
        private var _disposed:Boolean;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._images = null;
            }
        }

        public function _Str_17621(k:Vector.<BitmapData>):void
        {
            this._images = k;
        }

        public function _Str_16235(k:int, _arg_2:int):BitmapData
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:BitmapData;
            var _local_8:int;
            if ((((this._disposed) || (this._images == null)) || (this._images.length == 0)))
            {
                return new BitmapData(1, 1);
            }
            var _local_3:BitmapData = new BitmapData(_arg_2, this._images[0].height, false, 0);
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_5 = (k + _local_4);
                _local_6 = this._Str_17008(_local_5);
                if (_local_6 < 0)
                {
                    _local_4 = (_local_4 + -(k));
                    if (k >= 0)
                    {
                        return new BitmapData(1, 1);
                    }
                }
                else
                {
                    _local_7 = this._images[_local_6];
                    _local_8 = this._Str_25779(_local_5);
                    if (_local_7.width > ((_local_8 + _arg_2) - _local_4))
                    {
                        _local_3.copyPixels(_local_7, new Rectangle(_local_8, 0, (_arg_2 - _local_4), _local_7.height), new Point(_local_4, 0));
                        _local_4 = (_local_4 + (_arg_2 - _local_4));
                    }
                    else
                    {
                        _local_3.copyPixels(_local_7, new Rectangle(_local_8, 0, (_local_7.width - _local_8), _local_7.height), new Point(_local_4, 0));
                        _local_4 = (_local_4 + (_local_7.width - _local_8));
                    }
                }
            }
            return _local_3;
        }

        public function _Str_17008(k:int):int
        {
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < this._images.length)
            {
                if (((_local_2 <= k) && (k < (_local_2 + this._images[_local_3].width))))
                {
                    return _local_3;
                }
                _local_2 = (_local_2 + this._images[_local_3].width);
                _local_3++;
            }
            return -1;
        }

        private function _Str_25779(k:int):int
        {
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < this._images.length)
            {
                if (((_local_2 <= k) && (k < (_local_2 + this._images[_local_3].width))))
                {
                    return k - _local_2;
                }
                _local_2 = (_local_2 + this._images[_local_3].width);
                _local_3++;
            }
            return -1;
        }
    }
}
