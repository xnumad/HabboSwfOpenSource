//com.sulake.habbo.communication.messages.outgoing.game.arena.Game2PlayAgainMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.arena{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2PlayAgainMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2PlayAgainMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.arena

