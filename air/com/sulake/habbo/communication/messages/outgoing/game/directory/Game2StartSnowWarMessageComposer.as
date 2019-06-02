//com.sulake.habbo.communication.messages.outgoing.game.directory.Game2StartSnowWarMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.directory{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2StartSnowWarMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2StartSnowWarMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.directory

