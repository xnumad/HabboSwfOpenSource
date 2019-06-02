//com.sulake.habbo.communication.messages.outgoing.moderator.ModMuteMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ModMuteMessageComposer implements IMessageComposer, IDisposable {

        public static const NO_ISSUE_ID:int;

        private var _array:Array;

        public function ModMuteMessageComposer(k:int, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

