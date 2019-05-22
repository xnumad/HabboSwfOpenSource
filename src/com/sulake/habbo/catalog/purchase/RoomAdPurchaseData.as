package com.sulake.habbo.catalog.purchase
{
    public class RoomAdPurchaseData 
    {
        private var _name:String;
        private var _description:String = "";
        private var _flatId:int;
        private var _offerId:int;
        private var _extended:Boolean;
        private var _extendedFlatId:int;
        private var _roomName:String;
        private var _expirationTime:Date;
        private var _categoryId:int = -1;


        public function clear():void
        {
            this._name = null;
            this._description = "";
            this._flatId = 0;
            this._extended = false;
            this._roomName = null;
            this._extendedFlatId = -1;
            this._categoryId = -1;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get description():String
        {
            return this._description;
        }

        public function set description(k:String):void
        {
            this._description = k;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function set flatId(k:int):void
        {
            this._flatId = k;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function set offerId(k:int):void
        {
            this._offerId = k;
        }

        public function get _Str_8314():Boolean
        {
            return this._extended;
        }

        public function get _Str_16649():int
        {
            return this._extendedFlatId;
        }

        public function set _Str_16649(k:int):void
        {
            this._extendedFlatId = k;
        }

        public function set _Str_8314(k:Boolean):void
        {
            this._extended = k;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function set roomName(k:String):void
        {
            this._roomName = k;
        }

        public function get expirationTime():Date
        {
            return this._expirationTime;
        }

        public function set expirationTime(k:Date):void
        {
            this._expirationTime = k;
        }

        public function get _Str_2712():int
        {
            return this._categoryId;
        }

        public function set _Str_2712(k:int):void
        {
            this._categoryId = k;
        }
    }
}
