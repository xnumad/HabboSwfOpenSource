//com.sulake.habbo.communication.messages.outgoing.room.avatar.ChangeMottoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChangeMottoMessageComposer implements IMessageComposer {

        private var _motto:String;

        public function ChangeMottoMessageComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

