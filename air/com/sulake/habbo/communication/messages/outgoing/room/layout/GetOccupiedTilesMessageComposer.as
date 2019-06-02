//com.sulake.habbo.communication.messages.outgoing.room.layout.GetOccupiedTilesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.layout{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetOccupiedTilesMessageComposer implements IMessageComposer {

        public function GetOccupiedTilesMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.layout

