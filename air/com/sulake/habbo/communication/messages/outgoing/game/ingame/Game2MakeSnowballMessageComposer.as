//com.sulake.habbo.communication.messages.outgoing.game.ingame.Game2MakeSnowballMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.ingame{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2MakeSnowballMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2MakeSnowballMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.ingame

