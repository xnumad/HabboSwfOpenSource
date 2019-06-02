//com.sulake.habbo.communication.messages.outgoing.catalog.GetSellablePetPalettesComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetSellablePetPalettesComposer implements IMessageComposer {

        private var _data:Array;

        public function GetSellablePetPalettesComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

