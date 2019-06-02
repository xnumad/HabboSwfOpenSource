//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerStatsData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerStatsData {

        private var _score:int;
        private var _kills:int;
        private var _deaths:int;
        private var _snowballHits:int;
        private var _snowballHitsTaken:int;
        private var _snowballsThrown:int;
        private var _snowballsCreated:int;
        private var _snowballsFromMachine:int;
        private var _friendlyHits:int;
        private var _friendlyKills:int;

        public function Game2PlayerStatsData(k:IMessageDataWrapper);

        public function get score():int;

        public function get kills():int;

        public function get deaths():int;

        public function get snowballHits():int;

        public function get snowballHitsTaken():int;

        public function get snowballsThrown():int;

        public function get snowballsCreated():int;

        public function get snowballsFromMachine():int;

        public function get friendlyHits():int;

        public function get friendlyKills():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

