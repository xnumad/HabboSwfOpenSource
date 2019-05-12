package com.sulake.core.window.utils
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class ChildEntityArrayReader implements IChildEntityArrayReader 
    {
        protected var _Str_2156:Vector.<IChildEntity>;

        public function ChildEntityArrayReader()
        {
            this._Str_2156 = new Vector.<IChildEntity>();
            super();
        }

        public function get numChildren():int
        {
            return this._Str_2156.length;
        }

        public function getChildAt(k:int):IChildEntity
        {
            return this._Str_2156[k];
        }

        public function getChildByID(k:int):IChildEntity
        {
            var _local_2:IChildEntity;
            for each (_local_2 in this._Str_2156)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function getChildByName(k:String):IChildEntity
        {
            var _local_2:IChildEntity;
            for each (_local_2 in this._Str_2156)
            {
                if (_local_2.name == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function getChildIndex(k:IChildEntity):int
        {
            return this._Str_2156.indexOf(k);
        }

        public function groupChildrenWithID(k:uint, _arg_2:Array):uint
        {
            var _local_3:IChildEntity;
            var _local_4:uint;
            for each (_local_3 in this._Str_2156)
            {
                if (_local_3.id == k)
                {
                    _arg_2.push(_local_3);
                    _local_4++;
                }
            }
            return _local_4;
        }
    }
}
