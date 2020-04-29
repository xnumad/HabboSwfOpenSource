package com.sulake.core.window.utils
{
    public class ChildEntityArray extends ChildEntityArrayReader implements IChildEntityArray 
    {
        public function removeChild(k:IChildEntity):IChildEntity
        {
            var _local_2:int = messageArray.indexOf(k);
            if (_local_2 < 0)
            {
                return null;
            }
            messageArray.splice(_local_2, 1);
            return k;
        }

        public function addChild(k:IChildEntity):IChildEntity
        {
            messageArray.push(k);
            return k;
        }

        public function addChildAt(k:IChildEntity, _arg_2:int):IChildEntity
        {
            messageArray.splice(_arg_2, 0, k);
            return k;
        }

        public function removeChildAt(k:int):IChildEntity
        {
            var _local_2:IChildEntity = messageArray[k];
            if (_local_2 != null)
            {
                messageArray.splice(k, 1);
                return _local_2;
            }
            return null;
        }

        public function setChildIndex(k:IChildEntity, _arg_2:int):void
        {
            var _local_3:int = messageArray.indexOf(k);
            if (((_local_3 > -1) && (!(_arg_2 == _local_3))))
            {
                messageArray.splice(_local_3, 1);
                messageArray.splice(_arg_2, 0, k);
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
                _local_3 = messageArray.indexOf(k);
                if (_local_3 < 0)
                {
                    return;
                }
                _local_4 = messageArray.indexOf(_arg_2);
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
                messageArray.splice(_local_4, 1);
                messageArray.splice(_local_3, 1);
                messageArray.splice(_local_3, 0, _arg_2);
                messageArray.splice(_local_4, 0, k);
            }
        }

        public function swapChildrenAt(k:int, _arg_2:int):void
        {
            this.swapChildren(messageArray[k], messageArray[_arg_2]);
        }
    }
}
