//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.HumanThrowsSnowballAtPositionEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanThrowsSnowballAtPositionEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;
        private var _targetX:int;
        private var _targetY:int;
        private var _trajectory:int;

        public function HumanThrowsSnowballAtPositionEventData(k:int);

        public function get humanGameObjectId():int;

        public function get targetX():int;

        public function get targetY():int;

        public function get trajectory():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

