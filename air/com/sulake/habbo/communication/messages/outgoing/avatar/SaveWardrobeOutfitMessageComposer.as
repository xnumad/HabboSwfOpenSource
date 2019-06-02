//com.sulake.habbo.communication.messages.outgoing.avatar.SaveWardrobeOutfitMessageComposer

package com.sulake.habbo.communication.messages.outgoing.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SaveWardrobeOutfitMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function SaveWardrobeOutfitMessageComposer(k:int, _arg_2:String, _arg_3:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.avatar

