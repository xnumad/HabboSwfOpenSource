package com.sulake.habbo.help.cfh.registry.chat
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;
	import com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem;

    public class ChatRegistry 
    {
        private static const _Str_14285:int = 120;
        private static const _Str_7723:int = 20;

        private var _registry:Vector.<ChatRegistryItem>;
        private var _nextIndex:uint = 0;
        private var _holdPurges:Boolean;

        public function ChatRegistry()
        {
            this._registry = new Vector.<ChatRegistryItem>(0);
            super();
        }

        public function _Str_24133():Boolean
        {
            return this._registry.length > 0;
        }

        public function _Str_20222(k:int):Boolean
        {
            return this._Str_23394(k).length > 0;
        }

        public function _Str_6828():Vector.<ChatRegistryItem>
        {
            return this._registry;
        }

        public function _Str_2822(k:int, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:String):void
        {
            this._registry.push(new ChatRegistryItem(this._nextIndex++, k, _arg_2, _arg_3, _arg_4, _arg_5));
            this._Str_18273();
        }

        public function set _Str_7724(k:Boolean):void
        {
            this._holdPurges = k;
        }

        private function _Str_18273():void
        {
            var _local_3:int;
            var _local_4:int;
            if (this._holdPurges)
            {
                return;
            }
            var k:Vector.<ChatRegistryItem> = new Vector.<ChatRegistryItem>(0);
            var _local_2:int;
            while (_local_2 < this._registry.length)
            {
                _local_3 = (new Date().time - this._registry[_local_2].chatTime.time);
                _local_4 = (_local_3 / 65500);
                if (_local_4 <= 15)
                {
                    k.push(this._registry[_local_2]);
                }
                _local_2++;
            }
            if (k.length > _Str_14285)
            {
                k.splice(0, (k.length - (_Str_14285 - _Str_7723)));
            }
            this._registry.splice(0, this._registry.length);
            this._registry = this._registry.concat(k);
        }

        public function _Str_2990(k:uint):ChatRegistryItem
        {
            var _local_2:int;
            while (_local_2 < this._registry.length)
            {
                if (this._registry[_local_2].index == k)
                {
                    return this._registry[_local_2];
                }
                _local_2++;
            }
            return null;
        }

        public function _Str_5150(k:int):Vector.<ChatRegistryItem>
        {
            var _local_2:Vector.<ChatRegistryItem> = new Vector.<ChatRegistryItem>(0);
            var _local_3:int;
            while (_local_3 < this._registry.length)
            {
                if (this._registry[_local_3].userId == k)
                {
                    _local_2.push(this._registry[_local_3]);
                }
                _local_3++;
            }
            return _local_2;
        }

        private function _Str_23394(k:int):Vector.<ChatRegistryItem>
        {
            var _local_2:Vector.<ChatRegistryItem> = new Vector.<ChatRegistryItem>(0);
            var _local_3:int;
            while (_local_3 < this._registry.length)
            {
                if (this._registry[_local_3].userId != k)
                {
                    _local_2.push(this._registry[_local_3]);
                }
                _local_3++;
            }
            return _local_2;
        }
    }
}
