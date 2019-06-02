//com.sulake.habbo.communication.messages.outgoing.users.GetMOTDMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetMOTDMessageComposer implements IMessageComposer {

        public function GetMOTDMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

