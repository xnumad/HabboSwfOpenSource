//com.sulake.habbo.communication.messages.outgoing.game.directory.Game2LeaveGameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.directory{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2LeaveGameMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2LeaveGameMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.directory

