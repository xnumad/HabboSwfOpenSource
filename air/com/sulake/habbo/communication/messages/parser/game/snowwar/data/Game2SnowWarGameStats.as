//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2SnowWarGameStats {

        private var _playerWithMostKills:int;
        private var _playerWithMostHits:int;

        public function Game2SnowWarGameStats(k:IMessageDataWrapper);

        public function get playerWithMostKills():int;

        public function get playerWithMostHits():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

