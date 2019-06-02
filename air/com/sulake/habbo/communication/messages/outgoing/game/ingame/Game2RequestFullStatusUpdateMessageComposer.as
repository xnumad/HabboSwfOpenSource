//com.sulake.habbo.communication.messages.outgoing.game.ingame.Game2RequestFullStatusUpdateMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.ingame{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2RequestFullStatusUpdateMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2RequestFullStatusUpdateMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.ingame

