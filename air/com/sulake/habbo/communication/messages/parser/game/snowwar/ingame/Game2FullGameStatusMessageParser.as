//com.sulake.habbo.communication.messages.parser.game.snowwar.ingame.Game2FullGameStatusMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.ingame{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2FullGameStatusMessageParser implements IMessageParser {

        private var _fullStatus:FullGameStatusData;

        public function Game2FullGameStatusMessageParser();

        public function get fullStatus():FullGameStatusData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.ingame

