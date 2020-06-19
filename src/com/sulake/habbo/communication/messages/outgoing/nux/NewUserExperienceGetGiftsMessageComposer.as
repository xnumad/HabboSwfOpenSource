package com.sulake.habbo.communication.messages.outgoing.nux
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;

    public class NewUserExperienceGetGiftsMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function NewUserExperienceGetGiftsMessageComposer(selectedItems:Vector.<NewUserExperienceGetGiftsSelection>)
        {
            var _local_2:NewUserExperienceGetGiftsSelection;
            this._array = new Array();
            super();
            this._array.push((selectedItems.length * 3));
            for each (_local_2 in selectedItems)
            {
                this._array.push(_local_2.dayIndex);
                this._array.push(_local_2.stepIndex);
                this._array.push(_local_2.giftIndex);
            }
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
