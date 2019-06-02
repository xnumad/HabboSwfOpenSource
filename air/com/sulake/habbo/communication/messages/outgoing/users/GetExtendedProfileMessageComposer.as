//com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetExtendedProfileMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetExtendedProfileMessageComposer(k:int, _arg_2:Boolean=true);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

