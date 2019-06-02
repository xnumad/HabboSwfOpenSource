//com.sulake.habbo.communication.messages.outgoing.room.furniture.RentableSpaceRentMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RentableSpaceRentMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function RentableSpaceRentMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

