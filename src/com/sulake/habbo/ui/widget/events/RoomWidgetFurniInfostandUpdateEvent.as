package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IStuffData;

    public class RoomWidgetFurniInfostandUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const FURNI:String = "RWFIUE_FURNI";

        private var _id:int = 0;
        private var _category:int = 0;
        private var _name:String = "";
        private var _description:String = "";
        private var _image:BitmapData = null;
        private var _Str_4167:Boolean = false;
        private var _Str_21073:Boolean = false;
        private var _Str_7750:Boolean = false;
        private var _roomControllerLevel:int = 0;
        private var _Str_10043:Boolean = false;
        private var _expiration:int = -1;
        private var _Str_25890:int = -1;
        private var _Str_6693:int = -1;
        private var _Str_3194:String = "";
        private var _Str_4514:Boolean = false;
        private var _stuffData:IStuffData = null;
        private var _groupId:int = 0;
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _Str_5135:int = 0;
        private var _Str_26155:int = -1;
        private var _Str_6586:int = -1;
        private var _Str_9981:Boolean;
        private var _Str_11465:Boolean;
        private var _Str_6871:Boolean;

        public function RoomWidgetFurniInfostandUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function set category(k:int):void
        {
            this._category = k;
        }

        public function get category():int
        {
            return this._category;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set description(k:String):void
        {
            this._description = k;
        }

        public function get description():String
        {
            return this._description;
        }

        public function set image(k:BitmapData):void
        {
            this._image = k;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function set _Str_2770(k:Boolean):void
        {
            this._Str_4167 = k;
        }

        public function get _Str_2770():Boolean
        {
            return this._Str_4167;
        }

        public function set _Str_17541(k:Boolean):void
        {
            this._Str_21073 = k;
        }

        public function get _Str_17541():Boolean
        {
            return this._Str_21073;
        }

        public function set isRoomController(k:Boolean):void
        {
            this._Str_7750 = k;
        }

        public function get isRoomController():Boolean
        {
            return this._Str_7750;
        }

        public function set roomControllerLevel(k:int):void
        {
            this._roomControllerLevel = k;
        }

        public function get roomControllerLevel():int
        {
            return this._roomControllerLevel;
        }

        public function set isGodMode(k:Boolean):void
        {
            this._Str_10043 = k;
        }

        public function get isGodMode():Boolean
        {
            return this._Str_10043;
        }

        public function set expiration(k:int):void
        {
            this._expiration = k;
        }

        public function get expiration():int
        {
            return this._expiration;
        }

        public function set purchaseOfferId(k:int):void
        {
            this._Str_6693 = k;
        }

        public function get purchaseOfferId():int
        {
            return this._Str_6693;
        }

        public function set extraParam(k:String):void
        {
            this._Str_3194 = k;
        }

        public function get extraParam():String
        {
            return this._Str_3194;
        }

        public function set _Str_3233(k:Boolean):void
        {
            this._Str_4514 = k;
        }

        public function get _Str_3233():Boolean
        {
            return this._Str_4514;
        }

        public function set stuffData(k:IStuffData):void
        {
            this._stuffData = k;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function set groupId(k:int):void
        {
            this._groupId = k;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set usagePolicy(k:int):void
        {
            this._Str_5135 = k;
        }

        public function get usagePolicy():int
        {
            return this._Str_5135;
        }

        public function set rentOfferId(k:int):void
        {
            this._Str_6586 = k;
        }

        public function get rentOfferId():int
        {
            return this._Str_6586;
        }

        public function get purchaseCouldBeUsedForBuyout():Boolean
        {
            return this._Str_9981;
        }

        public function set purchaseCouldBeUsedForBuyout(k:Boolean):void
        {
            this._Str_9981 = k;
        }

        public function get rentCouldBeUsedForBuyout():Boolean
        {
            return this._Str_11465;
        }

        public function set rentCouldBeUsedForBuyout(k:Boolean):void
        {
            this._Str_11465 = k;
        }

        public function get availableForBuildersClub():Boolean
        {
            return this._Str_6871;
        }

        public function set availableForBuildersClub(k:Boolean):void
        {
            this._Str_6871 = k;
        }
    }
}
