package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SignMessageComposer implements IMessageComposer
    {
        private var _signID:int;

        public function SignMessageComposer(k:int)
        {
            this._signID = k;
        }

        public function getMessageArray():Array
        {
            return [this._signID];
        }

        public function dispose():void
        {
        }
    }
}
