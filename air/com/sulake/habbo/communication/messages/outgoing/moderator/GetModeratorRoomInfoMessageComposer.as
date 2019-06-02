//com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorRoomInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetModeratorRoomInfoMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetModeratorRoomInfoMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

