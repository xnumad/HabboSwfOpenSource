package com.sulake.habbo.help.cfh.registry.user
{
    import com.sulake.core.utils.Map;
	import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;

    public class UserRegistry 
    {
        private static const _Str_18449:int = 80;

        private var _registry:Map;
        private var _roomName:String = "";
        private var _roomId:int;
        private var _withoutRoomNameList:Array;

        public function UserRegistry()
        {
            this._registry = new Map();
            this._withoutRoomNameList = new Array();
            super();
        }

        public function _Str_20328():Map
        {
            return this._registry;
        }

        public function _Str_4666(k:int):UserRegistryItem
        {
            return this._registry[k];
        }

        public function _Str_19528(k:int, _arg_2:String):void
        {
            this._roomId = k;
            this._roomName = _arg_2;
            if (this._roomName != "")
            {
                this._Str_24907();
            }
        }

        public function _Str_23385(k:int, _arg_2:String, _arg_3:String=""):void
        {
            var _local_4:UserRegistryItem;
            if (this._registry.getValue(k) != null)
            {
                this._registry.remove(k);
            }
            _local_4 = new UserRegistryItem(k, _arg_2, _arg_3, this._roomId, this._roomName);
            if (this._roomName == "")
            {
                this._withoutRoomNameList.push(k);
            }
            this._registry.add(k, _local_4);
            this._Str_23151();
        }

        private function _Str_23151():void
        {
            var k:int;
            while (this._registry.length > _Str_18449)
            {
                k = this._registry.getKey(0);
                this._registry.remove(k);
            }
        }

        private function _Str_24907():void
        {
            var k:UserRegistryItem;
            while (this._withoutRoomNameList.length > 0)
            {
                k = this._registry.getValue(this._withoutRoomNameList.shift());
                if (((!(k == null)) && (k.roomId == this._roomId)))
                {
                    k.roomName = this._roomName;
                }
            }
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
