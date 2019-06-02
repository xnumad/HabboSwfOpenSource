//com.sulake.habbo.communication.messages.outgoing.game.ingame.Game2SetUserMoveTargetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.ingame{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2SetUserMoveTargetMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2SetUserMoveTargetMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.ingame

