package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AvatarExpressionMessageComposer implements IMessageComposer
    {
        private var _Str_5400:int = 0;

        public function AvatarExpressionMessageComposer(k:int)
        {
            this._Str_5400 = k;
        }

        public function dispose():void
        {
            this._Str_5400 = 0;
        }

        public function getMessageArray():Array
        {
            return [this._Str_5400];
        }
    }
}
