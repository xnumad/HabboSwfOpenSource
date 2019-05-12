package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SavedSearch;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NavigatorSavedSearchesParser implements IMessageParser 
    {
        private var _savedSearches:Vector.<SavedSearch>;


        public function flush():Boolean
        {
            this._savedSearches = new Vector.<SavedSearch>(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._savedSearches.push(new SavedSearch(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_8597():Vector.<SavedSearch>
        {
            return this._savedSearches;
        }
    }
}
