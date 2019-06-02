//com.sulake.habbo.room.object.logic.furniture.FurnitureHockeyScoreLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureHockeyScoreLogic extends FurnitureLogic {

        public function FurnitureHockeyScoreLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

