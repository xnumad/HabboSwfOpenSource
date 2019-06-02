//com.sulake.habbo.communication.messages.outgoing.catalog.GetBonusRareInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetBonusRareInfoMessageComposer implements IMessageComposer {

        public function GetBonusRareInfoMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

