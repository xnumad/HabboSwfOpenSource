//com.sulake.habbo.communication.messages.outgoing.room.furniture.PlacePostItMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PlacePostItMessageComposer implements IMessageComposer {

        private var _itemId:int;
        private var _location:String;

        public function PlacePostItMessageComposer(k:int, _arg_2:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

