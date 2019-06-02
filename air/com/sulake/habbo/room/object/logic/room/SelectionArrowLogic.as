//com.sulake.habbo.room.object.logic.room.SelectionArrowLogic

package com.sulake.habbo.room.object.logic.room{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class SelectionArrowLogic extends ObjectLogicBase {

        public function SelectionArrowLogic();

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;


    }
}//package com.sulake.habbo.room.object.logic.room

