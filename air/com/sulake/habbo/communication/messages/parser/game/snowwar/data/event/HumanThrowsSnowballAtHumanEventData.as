//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.HumanThrowsSnowballAtHumanEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanThrowsSnowballAtHumanEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;
        private var _targetHumanGameObjectId:int;
        private var _trajectory:int;

        public function HumanThrowsSnowballAtHumanEventData(k:int);

        public function get humanGameObjectId():int;

        public function get targetHumanGameObjectId():int;

        public function get trajectory():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

