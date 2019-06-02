//com.sulake.habbo.communication.messages.outgoing.moderator.ModerateRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ModerateRoomMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ModerateRoomMessageComposer(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

