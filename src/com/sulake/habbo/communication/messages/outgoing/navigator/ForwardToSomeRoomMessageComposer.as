package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ForwardToSomeRoomMessageComposer implements IMessageComposer
    {
        private var _type:String;

        public function ForwardToSomeRoomMessageComposer(k:String):void
        {
            this._type = k;
        }

        public function getMessageArray():Array
        {
            return [this._type];
        }

        public function dispose():void
        {
            this._type = null;
        }
    }
}
