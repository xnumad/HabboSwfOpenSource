//com.sulake.habbo.communication.messages.parser.game.snowwar.ingame.Game2GameStatusMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.ingame{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameStatusMessageParser implements IMessageParser {

        private var _status:GameStatusData;

        public function Game2GameStatusMessageParser();

        public function get status():GameStatusData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.ingame

