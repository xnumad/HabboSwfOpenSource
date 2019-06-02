//com.sulake.habbo.communication.messages.outgoing.help.GetFaqCategoriesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFaqCategoriesMessageComposer implements IMessageComposer {

        public function GetFaqCategoriesMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

