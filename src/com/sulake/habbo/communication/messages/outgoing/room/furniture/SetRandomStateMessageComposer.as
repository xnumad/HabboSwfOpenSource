package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetRandomStateMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _param:int = 0;

        public function SetRandomStateMessageComposer(k:int, _arg_2:int=0)
        {
            this._objectId = k;
            this._param = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._param];
        }
    }
}
