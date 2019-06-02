//com.sulake.habbo.communication.messages.outgoing.groupforums.PostMessageMessageComposer

package com.sulake.habbo.communication.messages.outgoing.groupforums{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class PostMessageMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function PostMessageMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.groupforums

