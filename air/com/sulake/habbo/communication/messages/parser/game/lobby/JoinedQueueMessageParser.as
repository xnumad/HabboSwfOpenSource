//com.sulake.habbo.communication.messages.parser.game.lobby.JoinedQueueMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class JoinedQueueMessageParser implements IMessageParser {

        private var _gameTypeId:int;

        public function JoinedQueueMessageParser();

        public function get gameTypeId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

