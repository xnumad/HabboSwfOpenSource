//com.sulake.habbo.room.utils.SelectedRoomObjectData

package com.sulake.habbo.room.utils{
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    public class SelectedRoomObjectData implements ISelectedRoomObjectData {

        private var _id:int;
        private var _category:int;
        private var _operation:String;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _typeId:int;
        private var _instanceData:String;
        private var _stuffData:IStuffData;
        private var _state:int;
        private var _animFrame:int;
        private var _posture:String;

        public function SelectedRoomObjectData(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, k0:int=-1, k1:String=null);

        public function get id():int;

        public function get category():int;

        public function get operation():String;

        public function get loc():Vector3d;

        public function get dir():Vector3d;

        public function set dir(k:Vector3d):void;

        public function get typeId():int;

        public function get instanceData():String;

        public function get stuffData():IStuffData;

        public function get state():int;

        public function get animFrame():int;

        public function get posture():String;

        public function dispose():void;


    }
}//package com.sulake.habbo.room.utils

