package com.sulake.habbo.room.object.visualization.data
{
    public class ColorData 
    {
        public static const _Str_2531:uint = 0xFFFFFF;

        private var _colors:Array;

        public function ColorData(k:int)
        {
            this._colors = [];
            super();
            var _local_2:int;
            while (_local_2 < k)
            {
                this._colors.push(_Str_2531);
                _local_2++;
            }
        }

        public function dispose():void
        {
            this._colors = null;
        }

        public function _Str_1685(k:uint, _arg_2:int):void
        {
            if (((_arg_2 < 0) || (_arg_2 >= this._colors.length)))
            {
                return;
            }
            this._colors[_arg_2] = k;
        }

        public function _Str_751(k:int):uint
        {
            if (((k < 0) || (k >= this._colors.length)))
            {
                return _Str_2531;
            }
            return this._colors[k];
        }
    }
}
