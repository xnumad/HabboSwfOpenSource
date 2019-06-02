//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameDirectoryStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameDirectoryStatusMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameDirectoryStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameDirectoryStatusMessageEvent(k:Function);

        public function getParser():Game2GameDirectoryStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

