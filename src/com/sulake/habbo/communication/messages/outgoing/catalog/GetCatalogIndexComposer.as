package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetCatalogIndexComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetCatalogIndexComposer(k:String)
        {
            this._array = [k];
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
