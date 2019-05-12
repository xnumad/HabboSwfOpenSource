package com.sulake.habbo.notifications.feed
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class FeedSettings 
    {
        public static const _Str_17770:int = 0;
        public static const _Str_16008:int = 1;
        public static const _Str_16132:int = 2;
        public static const _Str_9534:int = 3;
        public static const _Str_15660:int = 0;
        public static const _Str_14283:int = 1;
        public static const _Str_14828:int = 2;

        private var _feed:NotificationController;
        private var _visibleFeedCategories:Vector.<int>;

        public function FeedSettings(k:NotificationController)
        {
            this._visibleFeedCategories = new Vector.<int>();
            this._visibleFeedCategories.push(FeedSettings._Str_14283);
            this._visibleFeedCategories.push(FeedSettings._Str_15660);
            this._visibleFeedCategories.push(FeedSettings._Str_14828);
        }

        public function dispose():void
        {
            this._feed = null;
            this._visibleFeedCategories = null;
        }

        public function _Str_22647():Vector.<int>
        {
            return this._visibleFeedCategories;
        }

        public function _Str_24684(k:int):void
        {
            this._feed._Str_23011();
        }
    }
}
