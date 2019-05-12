package com.sulake.habbo.ui.widget.camera
{
    import flash.display.BitmapData;

    public class CameraSlotData 
    {
        public var image:BitmapData;
        private var _date:Date;
        public var isEmpty:Boolean;


        public function _Str_16123(k:Date):void
        {
            this._date = k;
        }

        public function get _Str_26241():String
        {
            var k:String = ((((((((this._date.date + "/") + (this._date.month + 1)) + "/") + this._date.getFullYear()) + " ") + this._date.getHours()) + ":") + this._Str_23907(this._date.getMinutes()));
            return k;
        }

        private function _Str_23907(k:int):String
        {
            var _local_2:String = k.toString();
            if (_local_2.length == 1)
            {
                _local_2 = ("0" + _local_2);
            }
            return _local_2;
        }

        public function _Str_26320():int
        {
            return this._date.time;
        }
    }
}
