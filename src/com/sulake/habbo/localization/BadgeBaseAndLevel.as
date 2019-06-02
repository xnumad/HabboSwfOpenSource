package com.sulake.habbo.localization
{
    public class BadgeBaseAndLevel 
    {
        private var _base:String = "";
        private var _level:int = 1;

        public function BadgeBaseAndLevel(k:String)
        {
            var _local_2:int = (k.length - 1);
            while (((_local_2 > 0) && (this.isNumber(k.charAt(_local_2)))))
            {
                _local_2--;
            }
            this._base = k.substring(0, (_local_2 + 1));
            var _local_3:String = k.substring((_local_2 + 1), k.length);
            if (((!(_local_3 == null)) && (!(_local_3 == ""))))
            {
                this._level = int(_local_3);
            }
        }

        private function isNumber(k:String):Boolean
        {
            var _local_2:int = k.charCodeAt(0);
            return (_local_2 >= 48) && (_local_2 <= 57);
        }

        public function get base():String
        {
            return this._base;
        }

        public function get level():int
        {
            return this._level;
        }

        public function set level(k:int):void
        {
            this._level = Math.max(1, k);
        }

        public function get badgeId():String
        {
            return this._base + this._level;
        }
    }
}
