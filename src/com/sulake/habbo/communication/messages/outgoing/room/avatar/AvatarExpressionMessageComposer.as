package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AvatarExpressionMessageComposer implements IMessageComposer
    {
        private var _typeCode:int = 0;

        public function AvatarExpressionMessageComposer(k:int)
        {
            this._typeCode = k;
        }

        public function dispose():void
        {
            this._typeCode = 0;
        }

        public function getMessageArray():Array
        {
            return [this._typeCode];
        }
    }
}
