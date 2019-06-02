//com.sulake.habbo.communication.messages.outgoing.inventory.purse.GetCreditsInfoComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.purse{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCreditsInfoComposer implements IMessageComposer {

        public function GetCreditsInfoComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.purse

