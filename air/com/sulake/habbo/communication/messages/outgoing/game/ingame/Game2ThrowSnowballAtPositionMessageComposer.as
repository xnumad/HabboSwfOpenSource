//com.sulake.habbo.communication.messages.outgoing.game.ingame.Game2ThrowSnowballAtPositionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.ingame{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2ThrowSnowballAtPositionMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2ThrowSnowballAtPositionMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.ingame

