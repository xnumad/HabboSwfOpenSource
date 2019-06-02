//com.sulake.habbo.communication.messages.outgoing.game.lobby.GetGameListMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGameListMessageComposer implements IMessageComposer {

        public function GetGameListMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

