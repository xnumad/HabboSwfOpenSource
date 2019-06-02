package com.sulake.habbo.advertisement
{
    public class AdImageRequest 
    {
        private var _roomId:int;
        private var _objectId:int;
        private var _objectCategory:int;
        private var _imageURL:String;
        private var _clickURL:String;

        public function AdImageRequest(k:int, _arg_2:String=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:int=-1)
        {
            this._roomId = k;
            this._objectId = _arg_4;
            this._objectCategory = _arg_5;
            this._imageURL = _arg_2;
            this._clickURL = _arg_3;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get objectCategory():int
        {
            return this._objectCategory;
        }

        public function get imageURL():String
        {
            return this._imageURL;
        }

        public function get clickURL():String
        {
            return this._clickURL;
        }
    }
}
