package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
    public class ExtraInfoItemData 
    {
        public static const _Str_13400:int = 0;
        public static const _Str_14719:int = 1;
        public static const _Str_14097:int = 2;
        public static const _Str_16957:int = 3;
        public static const _Str_18371:int = 4;
        public static const _Str_17087:int = 5;

        private var _type:int;
        private var _text:String;
        private var _quantity:int;
        private var _activityPointType:int;
        private var _discountPriceCredits:int;
        private var _discountPriceActivityPoints:int;
        private var _priceCredits:int;
        private var _priceActivityPoints:int;
        private var _badgeCode:String;
        private var _achievementCode:String;

        public function ExtraInfoItemData(k:int, _arg_2:String="")
        {
            this._type = k;
            this._text = _arg_2;
        }

        public function set text(k:String):void
        {
            this._text = k;
        }

        public function set quantity(k:int):void
        {
            this._quantity = k;
        }

        public function set activityPointType(k:int):void
        {
            this._activityPointType = k;
        }

        public function set discountPriceCredits(k:int):void
        {
            this._discountPriceCredits = k;
        }

        public function set discountPriceActivityPoints(k:int):void
        {
            this._discountPriceActivityPoints = k;
        }

        public function set priceCredits(k:int):void
        {
            this._priceCredits = k;
        }

        public function set priceActivityPoints(k:int):void
        {
            this._priceActivityPoints = k;
        }

        public function set badgeCode(k:String):void
        {
            this._badgeCode = k;
        }

        public function set _Str_23604(k:String):void
        {
            this._achievementCode = k;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get quantity():int
        {
            return this._quantity;
        }

        public function get priceCredits():int
        {
            return this._priceCredits;
        }

        public function get priceActivityPoints():int
        {
            return this._priceActivityPoints;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get _Str_23604():String
        {
            return this._achievementCode;
        }

        public function get discountPriceCredits():int
        {
            return this._discountPriceCredits;
        }

        public function get discountPriceActivityPoints():int
        {
            return this._discountPriceActivityPoints;
        }
    }
}
