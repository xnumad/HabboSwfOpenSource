//com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.room.utils.Vector3d;

    public class SlideObjectMessageData {

        public static const MOVE_TYPE_MOVE:String;
        public static const MOVE_TYPE_SLIDE:String;

        private var _id:int;
        private var _loc:Vector3d;
        private var _target:Vector3d;
        private var _moveType:String;
        private var _isReadOnly:Boolean;

        public function SlideObjectMessageData(k:int, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:String=null);

        public function setReadOnly():void;

        public function get id():int;

        public function get loc():Vector3d;

        public function set loc(k:Vector3d):void;

        public function get target():Vector3d;

        public function set target(k:Vector3d):void;

        public function get moveType():String;

        public function set moveType(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

