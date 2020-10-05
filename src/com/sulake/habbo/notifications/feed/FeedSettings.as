package com.sulake.habbo.notifications.feed
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class FeedSettings 
    {
        public static const FEED_SECTION_URGENT:int = 0;
        public static const FEED_SECTION_ACTIONS:int = 1;
        public static const FEED_SECTION_PERSISTENT:int = 2;
        public static const FEED_SECTION_NOTIFICATIONS:int = 3;
        public static const FEED_CATEGORY_ME:int = 0;
        public static const FEED_CATEGORY_FRIENDS:int = 1;
        public static const FEED_CATEGORY_HOTEL:int = 2;

        private var _feed:NotificationController;
        private var _visibleFeedCategories:Vector.<int>;

        public function FeedSettings(k:NotificationController)
        {
            this._visibleFeedCategories = new Vector.<int>();
            this._visibleFeedCategories.push(FeedSettings.FEED_CATEGORY_FRIENDS);
            this._visibleFeedCategories.push(FeedSettings.FEED_CATEGORY_ME);
            this._visibleFeedCategories.push(FeedSettings.FEED_CATEGORY_HOTEL);
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
            this._feed.updateFeedCategoryFiltering();
        }
    }
}
