package com.sulake.core.window.utils
{
    public class ChildEntityArray extends ChildEntityArrayReader implements IChildEntityArray 
    {
        public function removeChild(k:IChildEntity):IChildEntity
        {
            var _local_2:int = _Str_2156.indexOf(k);
            if (_local_2 < 0)
            {
                return null;
            }
            _Str_2156.splice(_local_2, 1);
            return k;
        }

        public function addChild(k:IChildEntity):IChildEntity
        {
            _Str_2156.push(k);
            return k;
        }

        public function addChildAt(k:IChildEntity, _arg_2:int):IChildEntity
        {
            _Str_2156.splice(_arg_2, 0, k);
            return k;
        }

        public function removeChildAt(k:int):IChildEntity
        {
            var _local_2:IChildEntity = _Str_2156[k];
            if (_local_2 != null)
            {
                _Str_2156.splice(k, 1);
                return _local_2;
            }
            return null;
        }

        public function setChildIndex(k:IChildEntity, _arg_2:int):void
        {
            var _local_3:int = _Str_2156.indexOf(k);
            if (((_local_3 > -1) && (!(_arg_2 == _local_3))))
            {
                _Str_2156.splice(_local_3, 1);
                _Str_2156.splice(_arg_2, 0, k);
            }
        }

        public function swapChildren(k:IChildEntity, _arg_2:IChildEntity):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IChildEntity;
            var _local_6:int;
            if ((((!(k == null)) && (!(_arg_2 == null))) && (!(k == _arg_2))))
            {
                _local_3 = _Str_2156.indexOf(k);
                if (_local_3 < 0)
                {
                    return;
                }
                _local_4 = _Str_2156.indexOf(_arg_2);
                if (_local_4 < 0)
                {
                    return;
                }
                if (_local_4 < _local_3)
                {
                    _local_5 = k;
                    k = _arg_2;
                    _arg_2 = _local_5;
                    _local_6 = _local_3;
                    _local_3 = _local_4;
                    _local_4 = _local_6;
                }
                _Str_2156.splice(_local_4, 1);
                _Str_2156.splice(_local_3, 1);
                _Str_2156.splice(_local_3, 0, _arg_2);
                _Str_2156.splice(_local_4, 0, k);
            }
        }

        public function swapChildrenAt(k:int, _arg_2:int):void
        {
            this.swapChildren(_Str_2156[k], _Str_2156[_arg_2]);
        }
    }
}
