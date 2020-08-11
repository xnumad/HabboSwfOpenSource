package com.sulake.habbo.communication.messages.outgoing.userclassification
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RoomUsersClassificationMessageComposer implements IMessageComposer
    {
        private var _Str_7397:String;

        public function RoomUsersClassificationMessageComposer(k:String)
        {
            this._Str_7397 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_7397];
        }

        public function dispose():void
        {
            this._Str_7397 = null;
        }
    }
}
