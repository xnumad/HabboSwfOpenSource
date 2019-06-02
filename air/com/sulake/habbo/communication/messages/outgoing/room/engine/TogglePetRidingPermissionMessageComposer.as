//com.sulake.habbo.communication.messages.outgoing.room.engine.TogglePetRidingPermissionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class TogglePetRidingPermissionMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function TogglePetRidingPermissionMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

