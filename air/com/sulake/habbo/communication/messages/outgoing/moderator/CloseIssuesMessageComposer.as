//com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssuesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class CloseIssuesMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function CloseIssuesMessageComposer(k:Array, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

