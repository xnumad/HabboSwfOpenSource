package com.sulake.habbo.navigator.context
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SavedSearch;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.TopLevelContext;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorMetaDataParser;
    import __AS3__.vec.*;

    public class ContextContainer 
    {
        private var _navigator:HabboNewNavigator;
        private var _topLevelSearchesQuicklinks:Map;
        private var _savedSearches:Vector.<SavedSearch>;

        public function ContextContainer(k:HabboNewNavigator)
        {
            this._savedSearches = new Vector.<SavedSearch>();
            super();
            this._navigator = k;
        }

        public function _Str_23059(k:String):Boolean
        {
            if (!this._topLevelSearchesQuicklinks)
            {
                return false;
            }
            return this._topLevelSearchesQuicklinks.hasKey(k);
        }

        public function initialize(k:NavigatorMetaDataParser):void
        {
            var _local_2:TopLevelContext;
            this._topLevelSearchesQuicklinks = new Map();
            for each (_local_2 in k._Str_23833)
            {
                this._topLevelSearchesQuicklinks.add(_local_2.searchCode, _local_2._Str_21438);
            }
        }

        public function _Str_9965():Array
        {
            return this._topLevelSearchesQuicklinks.getKeys();
        }

        public function get _Str_8597():Vector.<SavedSearch>
        {
            return this._savedSearches;
        }

        public function set _Str_8597(k:Vector.<SavedSearch>):void
        {
            this._savedSearches = k;
        }

        public function isReady():Boolean
        {
            return !(this._topLevelSearchesQuicklinks == null);
        }
    }
}
