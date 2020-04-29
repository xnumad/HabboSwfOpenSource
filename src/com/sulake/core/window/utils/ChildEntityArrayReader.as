package com.sulake.core.window.utils
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class ChildEntityArrayReader implements IChildEntityArrayReader 
    {
        protected var messageArray:Vector.<IChildEntity>;

        public function ChildEntityArrayReader()
        {
            this.messageArray = new Vector.<IChildEntity>();
            super();
        }

        public function get numChildren():int
        {
            return this.messageArray.length;
        }

        public function getChildAt(k:int):IChildEntity
        {
            return this.messageArray[k];
        }

        public function getChildByID(k:int):IChildEntity
        {
            var _local_2:IChildEntity;
            for each (_local_2 in this.messageArray)
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
            for each (_local_2 in this.messageArray)
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
            return this.messageArray.indexOf(k);
        }

        public function groupChildrenWithID(k:uint, _arg_2:Array):uint
        {
            var _local_3:IChildEntity;
            var _local_4:uint;
            for each (_local_3 in this.messageArray)
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
