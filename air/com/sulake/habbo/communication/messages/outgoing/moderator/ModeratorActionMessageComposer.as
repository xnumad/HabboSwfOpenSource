//com.sulake.habbo.communication.messages.outgoing.moderator.ModeratorActionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable {

        public static const ACTION_ALERT:int;
        public static const ACTION_KICK:int;
        public static const ACTION_MESSAGE:int;
        public static const ACTION_MESSAGE_AND_SOFT_KICK:int;

        private var _array:Array;

        public function ModeratorActionMessageComposer(k:int, _arg_2:String, _arg_3:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

