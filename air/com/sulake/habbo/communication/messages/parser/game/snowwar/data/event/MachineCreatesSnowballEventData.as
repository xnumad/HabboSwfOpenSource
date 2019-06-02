//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.MachineCreatesSnowballEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MachineCreatesSnowballEventData extends SnowWarGameEventData {

        private var _snowBallMachineReference:int;

        public function MachineCreatesSnowballEventData(k:int);

        public function get snowBallMachineReference():int;

        override public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

