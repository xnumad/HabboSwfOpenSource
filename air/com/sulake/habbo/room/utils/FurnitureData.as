//com.sulake.habbo.room.utils.FurnitureData

package com.sulake.habbo.room.utils{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    public class FurnitureData {

        private var _id:int;
        private var _typeId:int;
        private var _type:String;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _state:int;
        private var _data:IStuffData;
        private var _extra:Number;
        private var _expiryTime:int;
        private var _usagePolicy:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _synchronized:Boolean;
        private var _realRoomObject:Boolean;
        private var _sizeZ:Number;

        public function FurnitureData(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, k0:int=0, k1:int=0, k2:String="", k3:Boolean=true, k4:Boolean=true, k5:Number=-1);

        public function get id():int;

        public function get typeId():int;

        public function get type():String;

        public function get loc():IVector3d;

        public function get dir():IVector3d;

        public function get state():int;

        public function get data():IStuffData;

        public function get extra():Number;

        public function get expiryTime():int;

        public function get usagePolicy():int;

        public function get ownerId():int;

        public function get ownerName():String;

        public function get synchronized():Boolean;

        public function get realRoomObject():Boolean;

        public function get sizeZ():Number;


    }
}//package com.sulake.habbo.room.utils

