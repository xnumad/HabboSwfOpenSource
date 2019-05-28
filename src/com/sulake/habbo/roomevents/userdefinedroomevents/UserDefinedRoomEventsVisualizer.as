package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
	import com.sulake.habbo.roomevents.userdefinedroomevents.binaryData.SelectionShader;
    import flash.display.Shader;
    import flash.filters.ShaderFilter;
    import flash.filters.ColorMatrixFilter;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BlendMode;

    public class UserDefinedRoomEventsVisualizer 
    {
        private var _userDefinedRoomEvents:HabboUserDefinedRoomEvents;
        private var _selectionShader:Array;

        public function UserDefinedRoomEventsVisualizer(k:HabboUserDefinedRoomEvents)
        {
            var _local_2:Class;
            var _local_3:Shader;
            var _local_4:ShaderFilter;
            var _local_5:Array;
            var _local_6:ColorMatrixFilter;
            super();
            this._userDefinedRoomEvents = k;
            _local_2 = SelectionShader;
            _local_3 = new Shader((new (_local_2)() as ByteArray));
            _local_4 = new ShaderFilter(_local_3);
            this._selectionShader = [_local_4];
            return;
            _local_5 = [3.5, 6.5, 1, 0, -1200, 3.5, 6.5, 1, 0, -1200, 3.5, 6.5, 1, 0, -1200, 0, 0, 0, 1, 0];
            _local_6 = new ColorMatrixFilter(_local_5);
            this._selectionShader = [_local_6];
        }

        public function hide(k:int):void
        {
            this._Str_19356(this._Str_9248(k));
        }

        public function _Str_21701(k:Dictionary):void
        {
            var _local_2:String;
            for (_local_2 in k)
            {
                Logger.log(("Show furni as unselected: " + _local_2));
                this._Str_19356(this._Str_9248(parseInt(_local_2)));
            }
        }

        public function show(k:int):void
        {
            this._Str_20934(this._Str_9248(k));
        }

        public function _Str_25313(k:Dictionary):void
        {
            var _local_2:String;
            for (_local_2 in k)
            {
                Logger.log(("Show furni as selected: " + _local_2));
                this._Str_20934(this._Str_9248(parseInt(_local_2)));
            }
        }

        private function _Str_9248(k:int):IRoomObject
        {
            return this._userDefinedRoomEvents.roomEngine.getRoomObject(this._userDefinedRoomEvents.roomId, k, RoomObjectCategoryEnum.CONST_10);
        }

        private function _Str_20934(k:IRoomObject):void
        {
            var _local_2:IRoomObjectSpriteVisualization;
            var _local_3:int;
            var _local_4:IRoomObjectSprite;
            if (k)
            {
                _local_2 = (k.getVisualization() as IRoomObjectSpriteVisualization);
                Logger.log(("Furni visualization: " + _local_2));
                _local_3 = 0;
                while (_local_3 < _local_2.spriteCount)
                {
                    _local_4 = _local_2.getSprite(_local_3);
                    if (_local_4.blendMode != BlendMode.ADD)
                    {
                        _local_4.filters = this._selectionShader;
                    }
                    _local_3++;
                }
            }
        }

        private function _Str_19356(k:IRoomObject):void
        {
            var _local_2:IRoomObjectSpriteVisualization;
            var _local_3:int;
            var _local_4:IRoomObjectSprite;
            if (k)
            {
                _local_2 = (k.getVisualization() as IRoomObjectSpriteVisualization);
                Logger.log(("Furni visualization: " + _local_2));
                _local_3 = 0;
                while (_local_3 < _local_2.spriteCount)
                {
                    _local_4 = _local_2.getSprite(_local_3);
                    _local_4.filters = [];
                    _local_3++;
                }
            }
        }
    }
}
