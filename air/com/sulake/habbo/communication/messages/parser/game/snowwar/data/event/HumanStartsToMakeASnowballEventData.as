//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.HumanStartsToMakeASnowballEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanStartsToMakeASnowballEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;

        public function HumanStartsToMakeASnowballEventData(k:int);

        public function get humanGameObjectId():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

