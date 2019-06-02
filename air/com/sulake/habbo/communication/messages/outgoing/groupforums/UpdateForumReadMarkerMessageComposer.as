//com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateForumReadMarkerMessageComposer

package com.sulake.habbo.communication.messages.outgoing.groupforums{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateForumReadMarkerMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UpdateForumReadMarkerMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.groupforums

