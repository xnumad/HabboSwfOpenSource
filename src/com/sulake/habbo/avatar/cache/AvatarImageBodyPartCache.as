package com.sulake.habbo.avatar.cache
{
    import com.sulake.core.utils.Map;
    import flash.utils.getTimer;

    public class AvatarImageBodyPartCache 
    {
        private var _Str_586:Map;
        private var _Str_1509:int;

        public function AvatarImageBodyPartCache()
        {
            this._Str_586 = new Map();
            this.setDirection(getTimer());
        }

        public function dispose():void
        {
            var k:AvatarImageDirectionCache;
            this._Str_587("[dispose]");
            if (this._Str_586 == null)
            {
                return;
            }
            for each (k in this._Str_586)
            {
                k.dispose();
            }
            this._Str_586.dispose();
        }

        public function _Str_2070(k:int):AvatarImageDirectionCache
        {
            var _local_2:String = k.toString();
            return this._Str_586.getValue(_local_2) as AvatarImageDirectionCache;
        }

        public function _Str_2168(k:int, _arg_2:AvatarImageDirectionCache):void
        {
            var _local_3:String = k.toString();
            this._Str_586.add(_local_3, _arg_2);
        }

        public function setDirection(k:int):void
        {
            this._Str_1509 = k;
        }

        public function getDirection():int
        {
            return this._Str_1509;
        }

        private function _Str_587(k:String):void
        {
        }
    }
}
