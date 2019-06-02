//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageStartingMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StageStartingMessageParser implements IMessageParser {

        private var _gameObjects:GameObjectsData;
        private var _gameType:int;
        private var _roomType:String;
        private var _countDown:int;

        public function Game2StageStartingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameObjects():GameObjectsData;

        public function get gameType():int;

        public function get roomType():String;

        public function get countDown():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

