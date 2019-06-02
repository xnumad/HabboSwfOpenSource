//com.sulake.habbo.communication.messages.incoming.game.directory.Game2InArenaQueueMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2InArenaQueueMessageParser;

    [SecureSWF(rename="true")]
    public class Game2InArenaQueueMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2InArenaQueueMessageEvent(k:Function);

        public function getParser():Game2InArenaQueueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

