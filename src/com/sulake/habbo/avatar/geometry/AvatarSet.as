package com.sulake.habbo.avatar.geometry
{
    import flash.utils.Dictionary;

    public class AvatarSet 
    {
        private var _id:String;
        private var _avatarSets:Dictionary;
        private var _bodyParts:Array;
        private var _allBodyParts:Array;
        private var _isMain:Boolean;

        public function AvatarSet(k:XML)
        {
            var _local_3:AvatarSet;
            var _local_4:XML;
            var _local_5:XML;
            var _local_6:Array;
            super();
            this._id = String(k.@id);
            var _local_2:String = String(k.@main);
            this._isMain = ((_local_2 == null) ? false : Boolean(parseInt(_local_2)));
            this._avatarSets = new Dictionary();
            this._bodyParts = new Array();
            for each (_local_4 in k.avatarset)
            {
                _local_3 = new AvatarSet(_local_4);
                this._avatarSets[String(_local_4.@id)] = _local_3;
            }
            for each (_local_5 in k.bodypart)
            {
                this._bodyParts.push(String(_local_5.@id));
            }
            _local_6 = this._bodyParts.concat();
            for each (_local_3 in this._avatarSets)
            {
                _local_6 = _local_6.concat(_local_3.getBodyParts());
            }
            this._allBodyParts = _local_6;
        }

        public function findAvatarSet(k:String):AvatarSet
        {
            var _local_2:AvatarSet;
            if (k == this._id)
            {
                return this;
            }
            for each (_local_2 in this._avatarSets)
            {
                if (_local_2.findAvatarSet(k) != null)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function getBodyParts():Array
        {
            return this._allBodyParts.concat();
        }

        public function get id():String
        {
            return this._id;
        }

        public function get isMain():Boolean
        {
            var _local_1:AvatarSet;
            if (this._isMain)
            {
                return true;
            }
            for each (_local_1 in this._avatarSets)
            {
                if (_local_1.isMain)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
