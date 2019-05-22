package com.sulake.habbo.session.furniture
{
    public class FurnitureData implements IFurnitureData 
    {
        public static const I:String = "i";
        public static const S:String = "s";

        private var _type:String;
        private var _id:int;
        private var _className:String;
        private var _hasIndexedColor:Boolean;
        private var _colourIndex:int;
        private var _revision:int;
        private var _tileSizeX:int;
        private var _tileSizeY:int;
        private var _tileSizeZ:int;
        private var _colours:Array;
        private var _localizedName:String;
        private var _description:String;
        private var _adUrl:String;
        private var _purchaseOfferId:int;
        private var _rentOfferId:int;
        private var _customParams:String;
        private var _category:int;
        private var _purchaseCouldBeUsedForBuyout:Boolean;
        private var _rentCouldBeUsedForBuyout:Boolean;
        private var _availableForBuildersClub:Boolean;
        private var _fullName:String;
        private var _canStandOn:Boolean;
        private var _canSitOn:Boolean;
        private var _canLayOn:Boolean;
        private var _excludedFromDynamic:Boolean;
        private var _furniLine:String;

        public function FurnitureData(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:Array, _arg_12:Boolean, _arg_13:int, _arg_14:String, _arg_15:int, _arg_16:Boolean, _arg_17:int, _arg_18:Boolean, _arg_19:Boolean, _arg_20:String, _arg_21:int, _arg_22:Boolean, _arg_23:Boolean, _arg_24:Boolean, _arg_25:Boolean, _arg_26:String)
        {
            this._type = k;
            this._id = _arg_2;
            this._fullName = _arg_3;
            this._className = _arg_4;
            this._revision = _arg_7;
            this._tileSizeX = _arg_8;
            this._tileSizeY = _arg_9;
            this._tileSizeZ = _arg_10;
            this._colours = _arg_11;
            this._hasIndexedColor = _arg_12;
            this._colourIndex = _arg_13;
            this._localizedName = _arg_5;
            this._description = _arg_6;
            this._adUrl = _arg_14;
            this._purchaseOfferId = _arg_15;
            this._purchaseCouldBeUsedForBuyout = _arg_16;
            this._rentOfferId = _arg_17;
            this._rentCouldBeUsedForBuyout = _arg_18;
            this._customParams = _arg_20;
            this._category = _arg_21;
            this._availableForBuildersClub = _arg_19;
            this._canStandOn = _arg_22;
            this._canSitOn = _arg_23;
            this._canLayOn = _arg_24;
            this._excludedFromDynamic = _arg_25;
            this._furniLine = _arg_26;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get className():String
        {
            return this._className;
        }

        public function get fullName():String
        {
            return this._fullName;
        }

        public function get hasIndexedColor():Boolean
        {
            return this._hasIndexedColor;
        }

        public function get colourIndex():int
        {
            return this._colourIndex;
        }

        public function get revision():int
        {
            return this._revision;
        }

        public function get tileSizeX():int
        {
            return this._tileSizeX;
        }

        public function get tileSizeY():int
        {
            return this._tileSizeY;
        }

        public function get tileSizeZ():int
        {
            return this._tileSizeZ;
        }

        public function get colours():Array
        {
            return this._colours;
        }

        public function get localizedName():String
        {
            return this._localizedName;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get adUrl():String
        {
            return this._adUrl;
        }

        public function get purchaseOfferId():int
        {
            return this._purchaseOfferId;
        }

        public function get customParams():String
        {
            return this._customParams;
        }

        public function get category():int
        {
            return this._category;
        }

        public function set className(k:String):void
        {
            this._className = k;
        }

        public function get rentOfferId():int
        {
            return this._rentOfferId;
        }

        public function get purchaseCouldBeUsedForBuyout():Boolean
        {
            return this._purchaseCouldBeUsedForBuyout;
        }

        public function get rentCouldBeUsedForBuyout():Boolean
        {
            return this._rentCouldBeUsedForBuyout;
        }

        public function get availableForBuildersClub():Boolean
        {
            return this._availableForBuildersClub;
        }

        public function get canStandOn():Boolean
        {
            return this._canStandOn;
        }

        public function get canSitOn():Boolean
        {
            return this._canSitOn;
        }

        public function get canLayOn():Boolean
        {
            return this._canLayOn;
        }

        public function get isExternalImageType():Boolean
        {
            return !(this._className.indexOf("external_image") == -1);
        }

        public function get excludedFromDynamic():Boolean
        {
            return this._excludedFromDynamic;
        }

        public function get furniLine():String
        {
            return this._furniLine;
        }
    }
}
