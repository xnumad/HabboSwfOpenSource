//com.sulake.habbo.communication.messages.outgoing.catalog.GetClubGiftInfo

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetClubGiftInfo implements IMessageComposer {

        public function GetClubGiftInfo();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

