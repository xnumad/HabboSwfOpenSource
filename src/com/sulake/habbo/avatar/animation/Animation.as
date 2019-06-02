package com.sulake.habbo.avatar.animation
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.AvatarStructure;
    import com.sulake.habbo.avatar.actions.IActionDefinition;

    public class Animation implements IAnimation 
    {
        private static const _Str_2211:Array = [];

        private var _id:String;
        private var _description:String;
        private var _frames:Array;
        private var _spriteData:Array;
        private var _avatarData:AvatarDataContainer;
        private var _directionData:DirectionDataContainer;
        private var _removeData:Array;
        private var _addData:Array;
        private var _overriddenActions:Map;
        private var _overrideFrames:Map;
        private var _resetOnToggle:Boolean;

        public function Animation(k:AvatarStructure, _arg_2:XML)
        {
            var _local_3:XML;
            var _local_4:XML;
            var _local_5:XML;
            var _local_6:XML;
            var _local_7:String;
            var _local_8:String;
            var _local_9:Array;
            this._frames = [];
            super();
            this._id = String(_arg_2.@name);
            if (_arg_2.hasOwnProperty("@desc"))
            {
                this._description = String(_arg_2.@desc);
            }
            else
            {
                this._description = this._id;
            }
            if (_arg_2.hasOwnProperty("@resetOnToggle"))
            {
                this._resetOnToggle = Boolean(_arg_2.@resetOnToggle);
            }
            else
            {
                this._resetOnToggle = false;
            }
            if (_arg_2.hasOwnProperty("sprite"))
            {
                this._spriteData = [];
                for each (_local_3 in _arg_2.sprite)
                {
                    this._spriteData.push(new SpriteDataContainer((this as IAnimation), _local_3));
                }
            }
            if (_arg_2.hasOwnProperty("avatar"))
            {
                this._avatarData = new AvatarDataContainer(_arg_2.avatar[0]);
            }
            if (_arg_2.hasOwnProperty("direction"))
            {
                this._directionData = new DirectionDataContainer(_arg_2.direction[0]);
            }
            if (_arg_2.hasOwnProperty("remove"))
            {
                this._removeData = [];
                for each (_local_4 in _arg_2.remove)
                {
                    this._removeData.push(String(_local_4.@id));
                }
            }
            if (_arg_2.hasOwnProperty("add"))
            {
                this._addData = [];
                for each (_local_5 in _arg_2.add)
                {
                    this._addData.push(new AddDataContainer(_local_5));
                }
            }
            if (_arg_2.hasOwnProperty("override"))
            {
                this._overrideFrames = new Map();
                this._overriddenActions = new Map();
                for each (_local_6 in _arg_2.override)
                {
                    _local_7 = _local_6.@name;
                    _local_8 = _local_6.@override;
                    this._overriddenActions.add(_local_8, _local_7);
                    _local_9 = new Array();
                    this.parseFrames(_local_9, _local_6.frame, k);
                    this._overrideFrames.add(_local_7, _local_9);
                }
            }
            this.parseFrames(this._frames, _arg_2.frame, k);
        }

        private function parseFrames(k:Array, _arg_2:XMLList, _arg_3:AvatarStructure):void
        {
            var _local_4:Array;
            var _local_5:IActionDefinition;
            var _local_6:XML;
            var _local_7:int;
            var _local_8:int;
            var _local_9:XML;
            var _local_10:XML;
            var _local_11:AnimationLayerData;
            var _local_12:AnimationLayerData;
            for each (_local_6 in _arg_2)
            {
                _local_7 = 1;
                if (_local_6.@repeats > 1)
                {
                    _local_7 = int(_local_6.@repeats);
                }
                _local_8 = 0;
                while (_local_8 < _local_7)
                {
                    _local_4 = new Array();
                    for each (_local_9 in _local_6.bodypart)
                    {
                        _local_5 = _arg_3._Str_1675(String(_local_9.@action));
                        _local_11 = new AnimationLayerData(_local_9, AnimationLayerData.BODYPART, _local_5);
                        _local_4.push(_local_11);
                    }
                    for each (_local_10 in _local_6.fx)
                    {
                        _local_5 = _arg_3._Str_1675(String(_local_10.@action));
                        _local_12 = new AnimationLayerData(_local_10, AnimationLayerData.FX, _local_5);
                        _local_4.push(_local_12);
                        if (_local_5 != null)
                        {
                        }
                    }
                    k.push(_local_4);
                    _local_8++;
                }
            }
        }

        public function _Str_2185(k:String=null):int
        {
            var _local_2:Array;
            if (!k)
            {
                return this._frames.length;
            }
            if (this._overrideFrames)
            {
                _local_2 = this._overrideFrames.getValue(k);
                if (_local_2)
                {
                    return _local_2.length;
                }
            }
            return 0;
        }

        public function hasOverriddenActions():Boolean
        {
            if (!this._overriddenActions)
            {
                return false;
            }
            return this._overriddenActions.length > 0;
        }

        public function overriddenActionNames():Array
        {
            if (!this._overriddenActions)
            {
                return null;
            }
            return this._overriddenActions.getKeys();
        }

        public function overridingAction(k:String):String
        {
            if (!this._overriddenActions)
            {
                return null;
            }
            return this._overriddenActions.getValue(k);
        }

        private function _Str_2259(k:int, _arg_2:String=null):Array
        {
            var _local_4:Array;
            var _local_3:Array = [];
            if (!_arg_2)
            {
                if (this._frames.length > 0)
                {
                    _local_3 = this._frames[(k % this._frames.length)];
                }
            }
            else
            {
                _local_4 = (this._overrideFrames.getValue(_arg_2) as Array);
                if (((_local_4) && (_local_4.length > 0)))
                {
                    _local_3 = _local_4[(k % _local_4.length)];
                }
            }
            return _local_3;
        }

        public function getAnimatedBodyPartIds(k:int, _arg_2:String=null):Array
        {
            var _local_4:AnimationLayerData;
            var _local_5:AddDataContainer;
            var _local_3:Array = new Array();
            for each (_local_4 in this._Str_2259(k, _arg_2))
            {
                if (_local_4.type == AnimationLayerData.BODYPART)
                {
                    _local_3.push(_local_4.id);
                }
                else
                {
                    if (_local_4.type == AnimationLayerData.FX)
                    {
                        if (this._addData)
                        {
                            for each (_local_5 in this._addData)
                            {
                                if (_local_5.id == _local_4.id)
                                {
                                    _local_3.push(_local_5.align);
                                }
                            }
                        }
                    }
                }
            }
            return _local_3;
        }

        public function getLayerData(k:int, _arg_2:String, _arg_3:String=null):AnimationLayerData
        {
            var _local_4:AnimationLayerData;
            var _local_5:AddDataContainer;
            for each (_local_4 in this._Str_2259(k, _arg_3))
            {
                if (_local_4.id == _arg_2)
                {
                    return _local_4 as AnimationLayerData;
                }
                if (_local_4.type == AnimationLayerData.FX)
                {
                    for each (_local_5 in this._addData)
                    {
                        if (((_local_5.align == _arg_2) && (_local_5.id == _local_4.id)))
                        {
                            return _local_4 as AnimationLayerData;
                        }
                    }
                }
            }
            return null;
        }

        public function hasAvatarData():Boolean
        {
            return !(this._avatarData == null);
        }

        public function hasDirectionData():Boolean
        {
            return !(this._directionData == null);
        }

        public function hasAddData():Boolean
        {
            return !(this._addData == null);
        }

        public function getAddData(k:String):AddDataContainer
        {
            var _local_2:AddDataContainer;
            if (this._addData)
            {
                for each (_local_2 in this._addData)
                {
                    if (_local_2.id == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get spriteData():Array
        {
            return (this._spriteData) ? this._spriteData : _Str_2211;
        }

        public function get avatarData():AvatarDataContainer
        {
            return this._avatarData;
        }

        public function get directionData():DirectionDataContainer
        {
            return this._directionData;
        }

        public function get removeData():Array
        {
            return (this._removeData) ? this._removeData : _Str_2211;
        }

        public function get addData():Array
        {
            return (this._addData) ? this._addData : _Str_2211;
        }

        public function toString():String
        {
            return this._description;
        }

        public function get resetOnToggle():Boolean
        {
            return this._resetOnToggle;
        }
    }
}
