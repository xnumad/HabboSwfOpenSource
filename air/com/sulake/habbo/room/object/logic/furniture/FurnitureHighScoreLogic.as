//com.sulake.habbo.room.object.logic.furniture.FurnitureHighScoreLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureHighScoreLogic extends FurnitureLogic {

        private static const SHOW_WIDGET_IN_STATE:int;

        private var _state:int;

        public function FurnitureHighScoreLogic();

        override public function getEventTypes():Array;

        override public function tearDown():void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

