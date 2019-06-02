//com.sulake.habbo.communication.messages.outgoing.room.engine.PlaceObjectMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PlaceObjectMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _objectCategory:int;
        private var _wallLocation:String;
        private var _x:int;
        private var _y:int;
        private var _dir:int;

        public function PlaceObjectMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

