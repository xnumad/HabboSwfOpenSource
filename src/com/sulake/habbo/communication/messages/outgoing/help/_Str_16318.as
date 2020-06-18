package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16318 implements IMessageComposer 
    {
        private var _categoryId:int;

        public function _Str_16318(k:int)
        {
            this._categoryId = k;
        }

        public function getMessageArray():Array
        {
            return [this._categoryId];
        }

        public function dispose():void
        {
        }
    }
}
