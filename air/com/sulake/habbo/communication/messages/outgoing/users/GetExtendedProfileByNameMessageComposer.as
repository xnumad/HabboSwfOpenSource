//com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileByNameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetExtendedProfileByNameMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetExtendedProfileByNameMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

