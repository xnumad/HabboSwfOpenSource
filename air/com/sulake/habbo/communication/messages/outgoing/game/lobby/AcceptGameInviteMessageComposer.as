//com.sulake.habbo.communication.messages.outgoing.game.lobby.AcceptGameInviteMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AcceptGameInviteMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function AcceptGameInviteMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

