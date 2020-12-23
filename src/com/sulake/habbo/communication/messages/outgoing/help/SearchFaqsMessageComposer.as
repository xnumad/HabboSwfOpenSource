package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SearchFaqsMessageComposer implements IMessageComposer
    {
        private var _searchString:String;

        public function SearchFaqsMessageComposer(k:String)
        {
            this._searchString = k;
        }

        public function getMessageArray():Array
        {
            return [this._searchString];
        }

        public function dispose():void
        {
        }
    }
}
