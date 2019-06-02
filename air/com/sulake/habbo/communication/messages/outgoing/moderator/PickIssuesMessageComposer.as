//com.sulake.habbo.communication.messages.outgoing.moderator.PickIssuesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class PickIssuesMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function PickIssuesMessageComposer(k:Array, _arg_2:Boolean=false, _arg_3:int=0);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

