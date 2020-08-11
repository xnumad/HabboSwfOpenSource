package com.sulake.habbo.communication.messages.outgoing.userclassification
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RoomUsersClassificationMessageComposer implements IMessageComposer
    {
        private var userClassType:String;

        public function RoomUsersClassificationMessageComposer(k:String)
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
