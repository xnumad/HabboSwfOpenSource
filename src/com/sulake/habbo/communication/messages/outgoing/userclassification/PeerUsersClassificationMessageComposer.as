package com.sulake.habbo.communication.messages.outgoing.userclassification
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PeerUsersClassificationMessageComposer implements IMessageComposer
    {
        private var userClassType:String;

        public function PeerUsersClassificationMessageComposer(k:String)
        {
            this.userClassType = k;
        }

        public function getMessageArray():Array
        {
            return [this.userClassType];
        }

        public function dispose():void
        {
            this.userClassType = null;
        }
    }
}
