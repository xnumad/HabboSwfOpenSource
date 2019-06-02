//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageStillLoadingMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2StageStillLoadingMessageParser implements IMessageParser {

        private var _percentage:int;
        private var _finishedPlayers:Array;

        public function Game2StageStillLoadingMessageParser();

        public function get percentage():int;

        public function get finishedPlayers():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

