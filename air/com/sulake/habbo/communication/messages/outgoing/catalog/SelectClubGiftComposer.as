//com.sulake.habbo.communication.messages.outgoing.catalog.SelectClubGiftComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SelectClubGiftComposer implements IMessageComposer {

        private var _productCode:String;

        public function SelectClubGiftComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

