//com.sulake.habbo.communication.messages.outgoing.game.directory.Game2QuickJoinGameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.directory{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2QuickJoinGameMessageComposer implements IMessageComposer {

        public function Game2QuickJoinGameMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.directory

