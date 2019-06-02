//com.sulake.habbo.tablet.catalog.purchase.RoomAdPurchaseData

package com.sulake.habbo.tablet.catalog.purchase{
    public class RoomAdPurchaseData {

        private var _name:String;
        private var _description:String;
        private var _flatId:int;
        private var _offerId:int;
        private var _extended:Boolean;
        private var _extendedFlatId:int;
        private var _roomName:String;
        private var _expirationTime:Date;

        public function RoomAdPurchaseData();

        public function clear():void;

        public function get name():String;

        public function set name(k:String):void;

        public function get description():String;

        public function set description(k:String):void;

        public function get flatId():int;

        public function set flatId(k:int):void;

        public function get offerId():int;

        public function set offerId(k:int):void;

        public function get extended():Boolean;

        public function get extendedFlatId():int;

        public function set extendedFlatId(k:int):void;

        public function set extended(k:Boolean):void;

        public function get roomName():String;

        public function set roomName(k:String):void;

        public function get expirationTime():Date;

        public function set expirationTime(k:Date):void;


    }
}//package com.sulake.habbo.tablet.catalog.purchase

