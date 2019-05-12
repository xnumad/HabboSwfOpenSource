package com.sulake.habbo.help.cfh.registry.instantmessage
{
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class InstantMessageRegistry 
    {
        private static const _Str_7723:int = 5;
        private static const _Str_12594:int = 20;

        private var _registry:Map;
        private var _nextIndex:int = 0;
        private var _purgeCounter:int = 0;
        private var _holdPurges:Boolean;

        public function InstantMessageRegistry()
        {
            this._registry = new Map();
        }

        public function _Str_2822(k:int, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Vector.<InstantMessageRegistryItem>;
            var _local_5:Vector.<InstantMessageRegistryItem>;
            if (this._registry.hasKey(k))
            {
                _local_4 = this._registry.getValue(k);
                _local_4.push(new InstantMessageRegistryItem(this._nextIndex++, k, _arg_2, _arg_3));
                this._registry.remove(k);
                this._registry.add(k, _local_4);
            }
            else
            {
                _local_5 = new Vector.<InstantMessageRegistryItem>();
                _local_5.push(new InstantMessageRegistryItem(this._nextIndex++, k, _arg_2, _arg_3));
                this._registry.add(k, _local_5);
            }
            this._purgeCounter++;
            if ((this._purgeCounter % 3) == 0)
            {
                this._Str_18273();
            }
        }

        private function _Str_18273():void
        {
            var _local_2:Vector.<InstantMessageRegistryItem>;
            var _local_3:Vector.<InstantMessageRegistryItem>;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (this._holdPurges)
            {
                return;
            }
            var k:int;
            while (k < this._registry.length)
            {
                _local_2 = this._registry.getWithIndex(k);
                _local_3 = new Vector.<InstantMessageRegistryItem>(0);
                if (((_local_2) && (_local_2.length > 0)))
                {
                    _local_4 = _local_2[0].userId;
                    _local_5 = 0;
                    while (_local_5 < _local_2.length)
                    {
                        _local_6 = (new Date().time - _local_2[_local_5].chatTime.time);
                        _local_7 = (_local_6 / 65500);
                        if (_local_7 <= 15)
                        {
                            _local_3.push(_local_2[_local_5]);
                        }
                        _local_5++;
                    }
                    if (_local_3.length > _Str_12594)
                    {
                        _local_3.splice(0, (_local_3.length - (_Str_12594 - _Str_7723)));
                    }
                    _local_2.splice(0, _local_2.length);
                    _local_2 = _local_2.concat(_local_3);
                    this._registry.remove(_local_4);
                    this._registry.add(_local_4, _local_2);
                }
                k++;
            }
        }

        public function set _Str_7724(k:Boolean):void
        {
            this._holdPurges = k;
        }

        public function _Str_5150(k:int):Vector.<InstantMessageRegistryItem>
        {
            return this._registry.getValue(k);
        }

        public function _Str_23839(k:int):Boolean
        {
            var _local_2:Vector.<InstantMessageRegistryItem> = this._Str_5150(k);
            if (_local_2)
            {
                return this._Str_5150(k).length > 0;
            }
            return false;
        }

        public function _Str_24133():Boolean
        {
            return this._registry.length > 0;
        }

        public function _Str_6828():Map
        {
            return this._registry;
        }

        public function _Str_2990(k:int, _arg_2:uint):InstantMessageRegistryItem
        {
            var _local_3:Vector.<InstantMessageRegistryItem> = this._Str_5150(k);
            var _local_4:int;
            while (_local_4 < _local_3.length)
            {
                if (_local_3[_local_4].index == _arg_2)
                {
                    return _local_3[_local_4];
                }
                _local_4++;
            }
            return null;
        }
    }
}
