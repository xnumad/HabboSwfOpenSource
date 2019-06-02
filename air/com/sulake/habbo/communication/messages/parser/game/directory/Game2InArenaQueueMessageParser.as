//com.sulake.habbo.communication.messages.parser.game.directory.Game2InArenaQueueMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2InArenaQueueMessageParser implements IMessageParser {

        private var _position:int;

        public function Game2InArenaQueueMessageParser();

        public function get position():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

