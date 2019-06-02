//com.sulake.habbo.communication.messages.outgoing.room.furniture.RentableSpaceStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RentableSpaceStatusMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function RentableSpaceStatusMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

