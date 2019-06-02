//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.HumanLeftGameEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanLeftGameEventData extends SnowWarGameEventData {

        private var _humanGameObjectId:int;

        public function HumanLeftGameEventData(k:int);

        public function get humanGameObjectId():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

