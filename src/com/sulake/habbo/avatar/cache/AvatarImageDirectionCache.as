package com.sulake.habbo.avatar.cache
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
    import com.sulake.habbo.avatar.AvatarImagePartContainer;

    public class AvatarImageDirectionCache 
    {
        private var _partList:Array;
        private var _images:Dictionary;

        public function AvatarImageDirectionCache(k:Array)
        {
            this._images = new Dictionary();
            this._partList = k;
        }

        public function dispose():void
        {
            var k:AvatarImageBodyPartContainer;
            for each (k in this._images)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            this._images = null;
        }

        public function _Str_1699():Array
        {
            return this._partList;
        }

        public function getImageContainer(k:int):AvatarImageBodyPartContainer
        {
            var _local_2:String = this.getCacheKey(k);
            return this._images[_local_2];
        }

        public function updateImageContainer(k:AvatarImageBodyPartContainer, _arg_2:int):void
        {
            var _local_4:AvatarImageBodyPartContainer;
            var _local_3:String = this.getCacheKey(_arg_2);
            if (this._images[_local_3])
            {
                _local_4 = (this._images[_local_3] as AvatarImageBodyPartContainer);
                if (_local_4)
                {
                    _local_4.dispose();
                }
            }
            this._images[_local_3] = k;
        }

        private function getCacheKey(k:int):String
        {
            var _local_3:AvatarImagePartContainer;
            var _local_2:String = "";
            for each (_local_3 in this._partList)
            {
                _local_2 = (_local_2 + (_local_3.getCacheableKey(k) + "/"));
            }
            return _local_2;
        }

        private function _Str_587(k:String):void
        {
        }
    }
}
