//com.sulake.habbo.communication.messages.outgoing.moderator.GetCfhChatlogMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetCfhChatlogMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetCfhChatlogMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

