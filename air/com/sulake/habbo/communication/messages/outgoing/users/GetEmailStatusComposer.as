//com.sulake.habbo.communication.messages.outgoing.users.GetEmailStatusComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetEmailStatusComposer implements IMessageComposer {

        public function GetEmailStatusComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

