package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ChangePostureMessageComposer implements IMessageComposer
    {
        private var _posture:int;

        public function ChangePostureMessageComposer(k:int)
        {
            this._posture = k;
        }

        public function getMessageArray():Array
        {
            return [this._posture];
        }

        public function dispose():void
        {
        }
    }
}
