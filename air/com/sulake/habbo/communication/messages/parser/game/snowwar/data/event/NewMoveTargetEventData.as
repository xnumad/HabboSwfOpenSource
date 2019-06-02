//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.NewMoveTargetEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewMoveTargetEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;
        private var _x:int;
        private var _y:int;

        public function NewMoveTargetEventData(k:int);

        public function get humanGameObjectId():int;

        public function get x():int;

        public function get y():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

