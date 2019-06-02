//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamPlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamPlayerData {

        private var _userId:int;
        private var _userName:String;
        private var _score:int;
        private var _figure:String;
        private var _gender:String;
        private var _playerStats:Game2PlayerStatsData;
        private var _teamId:int;
        private var _willRejoin:Boolean;

        public function Game2TeamPlayerData(k:int, _arg_2:IMessageDataWrapper):void;

        public function get userId():int;

        public function get score():int;

        public function get userName():String;

        public function get figure():String;

        public function get gender():String;

        public function get playerStats():Game2PlayerStatsData;

        public function get teamId():int;

        public function get willRejoin():Boolean;

        public function set willRejoin(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

