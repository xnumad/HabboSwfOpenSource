package com.sulake.habbo.communication.messages.incoming.catalog
{
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class TargetedOfferData 
    {
        protected var _id:int;
        protected var _Str_679:String;
        protected var _type:int;
        protected var _Str_2495:String;
        protected var _Str_1858:String;
        protected var _Str_2991:String;
        protected var _Str_18782:String;
        protected var _Str_2570:String;
        protected var _Str_9772:int;
        protected var _Str_4678:uint;
        protected var _Str_3594:int;
        protected var _Str_3539:int;
        protected var _Str_2956:int;
        protected var _Str_11962:Vector.<String>;
        protected var _Str_9163:int;

        public function TargetedOfferData(k:TargetedOfferData=null)
        {
            if (k != null)
            {
                this._id = k.id;
                this._Str_679 = k.identifier;
                this._type = k.type;
                this._Str_2495 = k.title;
                this._Str_1858 = k.description;
                this._Str_2991 = k.imageUrl;
                this._Str_18782 = k._Str_13452;
                this._Str_2570 = k.productCode;
                this._Str_9772 = k.purchaseLimit;
                this._Str_4678 = k.expirationTime;
                this._Str_3594 = k.priceInCredits;
                this._Str_3539 = k.priceInActivityPoints;
                this._Str_2956 = k.activityPointType;
                this._Str_11962 = k._Str_24978;
                this._Str_9163 = k._Str_11180;
            }
        }

        public function parse(k:IMessageDataWrapper):TargetedOfferData
        {
            this._Str_9163 = k.readInteger();
            this._id = k.readInteger();
            this._Str_679 = k.readString();
            this._Str_2570 = k.readString();
            this._Str_3594 = k.readInteger();
            this._Str_3539 = k.readInteger();
            this._Str_2956 = k.readInteger();
            this._Str_9772 = k.readInteger();
            var _local_2:int = k.readInteger();
            this._Str_4678 = ((_local_2 > 0) ? ((_local_2 * 1000) + getTimer()) : 0);
            this._Str_2495 = k.readString();
            this._Str_1858 = k.readString();
            this._Str_2991 = k.readString();
            this._Str_18782 = k.readString();
            this._type = k.readInteger();
            this._Str_11962 = new Vector.<String>(0);
            var _local_3:int = k.readInteger();
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                this._Str_11962.push(k.readString());
                _local_4++;
            }
            return this;
        }

        public function _Str_24338(k:int):void
        {
            this._Str_9772 = (this._Str_9772 - k);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get identifier():String
        {
            return this._Str_679;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function get description():String
        {
            return this._Str_1858;
        }

        public function get imageUrl():String
        {
            return this._Str_2991;
        }

        public function get _Str_13452():String
        {
            return this._Str_18782;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get purchaseLimit():int
        {
            return this._Str_9772;
        }

        public function get expirationTime():int
        {
            return this._Str_4678;
        }

        public function get priceInCredits():int
        {
            return this._Str_3594;
        }

        public function get priceInActivityPoints():int
        {
            return this._Str_3539;
        }

        public function get activityPointType():int
        {
            return this._Str_2956;
        }

        public function get _Str_24978():Vector.<String>
        {
            return this._Str_11962;
        }

        public function get _Str_11180():int
        {
            return this._Str_9163;
        }
    }
}
