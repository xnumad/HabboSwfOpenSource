package com.sulake.habbo.notifications.feed.data
{
    import flash.display.BitmapData;

    public class GenericNotificationItemData 
    {
        private var _title:String;
        private var _timeStamp:int;
        private var _description:String;
        private var _decorationImage:BitmapData;
        private var _iconImage:BitmapData;
        private var _buttonAction:String;
        private var _buttonCaption:String;


        public function get title():String
        {
            return this._title;
        }

        public function get timeStamp():int
        {
            return this._timeStamp;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get _Str_22203():BitmapData
        {
            return this._decorationImage;
        }

        public function get _Str_3093():BitmapData
        {
            return this._iconImage;
        }

        public function get _Str_15192():String
        {
            return this._buttonAction;
        }

        public function get _Str_5167():String
        {
            return this._buttonCaption;
        }

        public function set title(k:String):void
        {
            this._title = k;
        }

        public function set timeStamp(k:int):void
        {
            this._timeStamp = k;
        }

        public function set description(k:String):void
        {
            this._description = k;
        }

        public function set _Str_22203(k:BitmapData):void
        {
            this._decorationImage = k;
        }

        public function set _Str_3093(k:BitmapData):void
        {
            this._iconImage = k;
        }

        public function set _Str_15192(k:String):void
        {
            this._buttonAction = k;
        }

        public function set _Str_5167(k:String):void
        {
            this._buttonCaption = k;
        }
    }
}
