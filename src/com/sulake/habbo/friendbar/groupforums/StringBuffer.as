package com.sulake.habbo.friendbar.groupforums
{
    public class StringBuffer 
    {
        private static const _Str_16146:Number = ">".charCodeAt(0);
        private static const _Str_18046:Number = "<".charCodeAt(0);

        private var _Str_6427:Array;

        public function StringBuffer()
        {
            this._Str_6427 = new Array();
            super();
        }

        public function _Str_15932(k:String):StringBuffer
        {
            var _local_3:Number;
            var _local_2:Number = 0;
            while (_local_2 < k.length)
            {
                _local_3 = k.charCodeAt(_local_2);
                switch (_local_3)
                {
                    case _Str_18046:
                        this.add("&lt;");
                        break;
                    case _Str_16146:
                        this.add("&gt;");
                        break;
                    default:
                        this._Str_6427.push(_local_3);
                }
                _local_2++;
            }
            return this;
        }

        public function add(k:String):StringBuffer
        {
            var _local_2:Number = 0;
            while (_local_2 < k.length)
            {
                this._Str_6427.push(k.charCodeAt(_local_2));
                _local_2++;
            }
            return this;
        }

        public function toString():String
        {
            return String.fromCharCode.apply(this, this._Str_6427);
        }

        public function get length():int
        {
            return this._Str_6427.length;
        }

        public function reset():void
        {
            this._Str_6427 = new Array();
        }
    }
}
