package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetActivatedBadgesComposer implements IMessageComposer 
    {
        private const _Str_20506:int = 5;

        private var _badgeArr:Array;

        public function SetActivatedBadgesComposer()
        {
            this._badgeArr = new Array();
        }

        public function addActivatedBadge(k:String):void
        {
            if (this._badgeArr.length >= this._Str_20506)
            {
                return;
            }
            this._badgeArr.push(k);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            var _local_2:int = 1;
            while (_local_2 <= this._Str_20506)
            {
                if (_local_2 <= this._badgeArr.length)
                {
                    k.push(_local_2);
                    k.push(this._badgeArr[(_local_2 - 1)]);
                }
                else
                {
                    k.push(_local_2);
                    k.push("");
                }
                _local_2++;
            }
            return k;
        }
    }
}
