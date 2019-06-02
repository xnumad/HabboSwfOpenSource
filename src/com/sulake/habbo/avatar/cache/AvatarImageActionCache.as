package com.sulake.habbo.avatar.cache
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.actions.IActiveActionData;

    public class AvatarImageActionCache 
    {
        private var _Str_586:Map;
        private var _Str_1233:IActiveActionData;
        private var _Str_1188:int;
        private var _disposed:Boolean;

        public function AvatarImageActionCache()
        {
            this._Str_586 = new Map();
        }

        public function _Str_1565(k:IActiveActionData, _arg_2:int):void
        {
            if (this._Str_1233 == null)
            {
                this._Str_1233 = k;
            }
            var _local_3:AvatarImageBodyPartCache = this._Str_1961(this._Str_1233);
            if (_local_3 != null)
            {
                _local_3.setDirection(_arg_2);
            }
            this._Str_1233 = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._Str_586 == null)
                {
                    return;
                }
                if (this._Str_586)
                {
                    this._Str_2089(0, int.MAX_VALUE);
                    this._Str_586.dispose();
                    this._Str_586 = null;
                }
                this._disposed = true;
            }
        }

        public function _Str_2089(k:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:AvatarImageBodyPartCache;
            var _local_6:String;
            if (((this._Str_586 == null) || (this._disposed)))
            {
                return;
            }
            var _local_5:Array = this._Str_586.getKeys();
            for each (_local_6 in _local_5)
            {
                _local_4 = (this._Str_586.getValue(_local_6) as AvatarImageBodyPartCache);
                if (_local_4 != null)
                {
                    _local_3 = _local_4.getDirection();
                    if ((_arg_2 - _local_3) >= k)
                    {
                        _local_4.dispose();
                        this._Str_586.remove(_local_6);
                    }
                }
            }
        }

        public function getAction():IActiveActionData
        {
            return this._Str_1233;
        }

        public function setDirection(k:int):void
        {
            this._Str_1188 = k;
        }

        public function getDirection():int
        {
            return this._Str_1188;
        }

        public function _Str_1961(k:IActiveActionData=null):AvatarImageBodyPartCache
        {
            if (!this._Str_1233)
            {
                return null;
            }
            if (k == null)
            {
                k = this._Str_1233;
            }
            if (k.overridingAction != null)
            {
                return this._Str_586.getValue(k.overridingAction) as AvatarImageBodyPartCache;
            }
            return this._Str_586.getValue(k.id) as AvatarImageBodyPartCache;
        }

        public function _Str_1765(k:IActiveActionData, _arg_2:AvatarImageBodyPartCache):void
        {
            if (k.overridingAction != null)
            {
                this._Str_586.add(k.overridingAction, _arg_2);
            }
            else
            {
                this._Str_586.add(k.id, _arg_2);
            }
        }

        private function _Str_587(k:String):void
        {
        }
    }
}
