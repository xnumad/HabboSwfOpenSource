//com.sulake.habbo.room.object.logic.furniture.FurnitureEditableInternalLinkLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureEditableInternalLinkLogic extends FurnitureLogic {

        private var _showStateOneOnceRendered:Boolean;
        private var _updateCount:int;

        public function FurnitureEditableInternalLinkLogic();

        override public function initialize(k:XML):void;

        override public function update(k:int):void;

        public function setAnimationState(k:int):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function getEventTypes():Array;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

