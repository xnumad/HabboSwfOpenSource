//com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FullGameStatusData {

        private var _remainingTimeSeconds:int;
        private var _durationInSeconds:int;
        private var _gameObjects:GameObjectsData;
        private var _numberOfTeams:int;
        private var _gameStatus:GameStatusData;

        public function FullGameStatusData(k:IMessageDataWrapper);

        public function get remainingTimeSeconds():int;

        public function get durationInSeconds():int;

        public function get gameObjects():GameObjectsData;

        public function get numberOfTeams():int;

        public function get gameStatus():GameStatusData;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

