//com.sulake.habbo.communication.messages.outgoing.game.lobby.GetGameStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGameStatusMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetGameStatusMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

