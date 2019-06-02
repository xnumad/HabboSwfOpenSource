//com.sulake.habbo.communication.messages.outgoing.room.furniture.EnterOneWayDoorMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class EnterOneWayDoorMessageComposer implements IMessageComposer {

        private var _objectId:int;

        public function EnterOneWayDoorMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

