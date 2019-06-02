//com.sulake.habbo.communication.messages.incoming.game.arena.Game2PlayerRematchesMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2PlayerRematchesMessageParser;

    [SecureSWF(rename="true")]
    public class Game2PlayerRematchesMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2PlayerRematchesMessageEvent(k:Function);

        public function getParser():Game2PlayerRematchesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

