//com.sulake.habbo.communication.messages.outgoing.help.ChatReviewGuideDecidesOnOfferMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ChatReviewGuideDecidesOnOfferMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ChatReviewGuideDecidesOnOfferMessageComposer(k:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

