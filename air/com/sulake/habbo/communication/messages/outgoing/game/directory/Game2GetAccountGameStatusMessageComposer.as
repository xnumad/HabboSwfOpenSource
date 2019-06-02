//com.sulake.habbo.communication.messages.outgoing.game.directory.Game2GetAccountGameStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.directory{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2GetAccountGameStatusMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2GetAccountGameStatusMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.directory

