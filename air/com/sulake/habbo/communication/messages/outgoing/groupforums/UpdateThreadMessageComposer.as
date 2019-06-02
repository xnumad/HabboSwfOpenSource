//com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateThreadMessageComposer

package com.sulake.habbo.communication.messages.outgoing.groupforums{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateThreadMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UpdateThreadMessageComposer(k:int, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;

        public function unwatch(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.groupforums

