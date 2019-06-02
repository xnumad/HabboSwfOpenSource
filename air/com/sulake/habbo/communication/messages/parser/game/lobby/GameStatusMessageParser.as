//com.sulake.habbo.communication.messages.parser.game.lobby.GameStatusMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GameStatusMessageParser implements IMessageParser {

        private static const OK:int;
        private static const MAINTENANCE:int;

        private var _gameTypeId:int;
        private var _status:int;

        public function GameStatusMessageParser();

        public function get gameTypeId():int;

        public function get isOk():Boolean;

        public function get isInMaintenance():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

