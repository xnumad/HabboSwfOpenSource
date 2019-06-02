//com.sulake.habbo.communication.messages.outgoing.moderator.GetUserChatlogMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetUserChatlogMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetUserChatlogMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

