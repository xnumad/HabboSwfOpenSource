//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.HumanGetsSnowballsFromMachineEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanGetsSnowballsFromMachineEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;
        private var _snowBallMachineReference:int;

        public function HumanGetsSnowballsFromMachineEventData(k:int);

        public function get humanGameObjectId():int;

        public function get snowBallMachineReference():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

