//com.sulake.habbo.communication.messages.outgoing.game.arena.Game2LoadStageReadyMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.arena{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2LoadStageReadyMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2LoadStageReadyMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.arena

