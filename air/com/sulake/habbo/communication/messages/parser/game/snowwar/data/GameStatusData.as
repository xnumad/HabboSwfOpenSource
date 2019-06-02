//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameStatusData {

        private var _turn:int;
        private var _checksum:int;
        private var _eventsBySubturn:Map;

        public function GameStatusData(k:IMessageDataWrapper);

        public function get turn():int;

        public function get checksum():int;

        public function get events():Map;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

