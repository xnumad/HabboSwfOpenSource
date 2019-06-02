//com.sulake.habbo.session.furniture.FurnitureData

package com.sulake.habbo.session.furniture{
    public class FurnitureData implements IFurnitureData {

        public static const FURNITURE_TYPE_ITEM:String;
        public static const FURNITURE_TYPE_STUFF:String;

        private var _type:String;
        private var _id:int;
        private var _className:String;
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

        public function FurnitureData(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:int, _arg_8:int, _arg_9:int, k0:int, k1:Array, k2:int, k3:String, k4:int, k5:Boolean, k6:int, k7:Boolean, k8:Boolean, k9:String, _arg_20:int, _arg_21:Boolean, _arg_22:Boolean, _arg_23:Boolean);

        public function get type():String;

        public function get id():int;

        public function get className():String;

        public function get fullName():String;

        public function get colourIndex():int;

        public function get revision():int;

        public function get tileSizeX():int;

        public function get tileSizeY():int;

        public function get tileSizeZ():int;

        public function get colours():Array;

        public function get localizedName():String;

        public function get description():String;

        public function get adUrl():String;

        public function get purchaseOfferId():int;

        public function get customParams():String;

        public function get category():int;

        public function set className(k:String):void;

        public function get rentOfferId():int;

        public function get purchaseCouldBeUsedForBuyout():Boolean;

        public function get rentCouldBeUsedForBuyout():Boolean;

        public function get availableForBuildersClub():Boolean;

        public function get canStandOn():Boolean;

        public function get canSitOn():Boolean;

        public function get canLayOn():Boolean;

        public function get isExternalImageType():Boolean;


    }
}//package com.sulake.habbo.session.furniture

