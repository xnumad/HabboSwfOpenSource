//com.sulake.habbo.communication.messages.outgoing.advertisement.GetInterstitialMessageComposer

package com.sulake.habbo.communication.messages.outgoing.advertisement{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetInterstitialMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetInterstitialMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.advertisement

