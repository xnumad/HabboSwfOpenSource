//com.sulake.habbo.communication.messages.parser.game.lobby.GameInviteMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GameInviteMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _inviterId:int;

        public function GameInviteMessageParser();

        public function get gameTypeId():int;

        public function get inviterId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

