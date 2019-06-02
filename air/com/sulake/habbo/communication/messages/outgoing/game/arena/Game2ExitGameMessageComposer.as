//com.sulake.habbo.communication.messages.outgoing.game.arena.Game2ExitGameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.arena{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2ExitGameMessageComposer implements IMessageComposer {

        private var _exitToRoomBeforeGame:Boolean;

        public function Game2ExitGameMessageComposer(k:Boolean=true);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.arena

