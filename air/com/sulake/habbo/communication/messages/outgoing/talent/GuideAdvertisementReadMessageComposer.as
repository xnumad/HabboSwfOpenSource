//com.sulake.habbo.communication.messages.outgoing.talent.GuideAdvertisementReadMessageComposer

package com.sulake.habbo.communication.messages.outgoing.talent{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GuideAdvertisementReadMessageComposer implements IMessageComposer {

        public function GuideAdvertisementReadMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.talent

