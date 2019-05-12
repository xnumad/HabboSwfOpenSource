package com.sulake.habbo.navigator
{
	import com.sulake.habbo.navigator.cache.NavigatorCacheEntry;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4173;

    public class NavigatorCache 
    {
        private static const _Str_18368:Number = (4 * 1000);//4000

        private var _Str_6451:Dictionary;

        public function NavigatorCache()
        {
            this._Str_6451 = new Dictionary();
        }

        public function _Str_22588(k:String, _arg_2:_Str_4173):void
        {
            this._Str_23575();
            var _local_3:Number = getTimer();
            this._Str_6451[k] = new NavigatorCacheEntry(k, _arg_2, _local_3, this._Str_25767(_local_3));
        }

        public function _Str_4666(k:String):_Str_4173
        {
            var _local_2:NavigatorCacheEntry = this._Str_6451[k];
            if (_local_2 != null)
            {
                if (_local_2._Str_19856(getTimer()))
                {
                    delete this._Str_6451[k];
                    return null;
                }
                return _local_2._Str_23130;
            }
            return null;
        }

        public function _Str_25085(k:String):void
        {
            delete this._Str_6451[k];
        }

        private function _Str_23575():void
        {
            var k:Object;
            var _local_2:String;
            var _local_3:NavigatorCacheEntry;
            for (k in this._Str_6451)
            {
                _local_2 = String(k);
                _local_3 = this._Str_6451[_local_2];
                if (((_local_3 == null) || (_local_3._Str_19856(getTimer()))))
                {
                    delete this._Str_6451[_local_2];
                }
            }
        }

        private function _Str_25767(k:Number):Number
        {
            return k + _Str_18368;
        }
    }
}
