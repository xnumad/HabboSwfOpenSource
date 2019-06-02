//com.sulake.habbo.communication.messages.outgoing.help.GetFaqCategoryMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFaqCategoryMessageComposer implements IMessageComposer {

        private var _categoryId:int;

        public function GetFaqCategoryMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

