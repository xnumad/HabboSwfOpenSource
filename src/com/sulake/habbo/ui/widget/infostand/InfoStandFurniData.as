package com.sulake.habbo.ui.widget.infostand
{
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;

    public class InfoStandFurniData 
    {
        private var _id:int = 0;
        private var _category:int = 0;
        private var _name:String = "";
        private var _description:String = "";
        private var _image:BitmapData;
        private var _purchaseOfferId:int = -1;
        private var _extraParam:String = "";
        private var _stuffData:IStuffData = null;
        private var _groupId:int;
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _rentOfferId:int = -1;
        private var _availableForBuildersClub:Boolean = false;


        public function set id(k:int):void
        {
            this._id = k;
        }

        public function set category(k:int):void
        {
            this._category = k;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function set description(k:String):void
        {
            this._description = k;
        }

        public function set image(k:BitmapData):void
        {
            this._image = k;
        }

        public function set purchaseOfferId(k:int):void
        {
            this._purchaseOfferId = k;
        }

        public function set extraParam(k:String):void
        {
            this._extraParam = k;
        }

        public function set stuffData(k:IStuffData):void
        {
            this._stuffData = k;
        }

        public function set groupId(k:int):void
        {
            this._groupId = k;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get purchaseOfferId():int
        {
            return this._purchaseOfferId;
        }

        public function get extraParam():String
        {
            return this._extraParam;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get rentOfferId():int
        {
            return this._rentOfferId;
        }

        public function set rentOfferId(k:int):void
        {
            this._rentOfferId = k;
        }

        public function get availableForBuildersClub():Boolean
        {
            return this._availableForBuildersClub;
        }

        public function _Str_5479(k:RoomWidgetFurniInfostandUpdateEvent):void
        {
            this.id = k.id;
            this.category = k.category;
            this.name = k.name;
            this.description = k.description;
            this.image = k.image;
            this.purchaseOfferId = k.purchaseOfferId;
            this.extraParam = k.extraParam;
            this.stuffData = k.stuffData;
            this.groupId = k.groupId;
            this.ownerName = k.ownerName;
            this.ownerId = k.ownerId;
            this.rentOfferId = k.rentOfferId;
            this._availableForBuildersClub = k.availableForBuildersClub;
        }
    }
}
