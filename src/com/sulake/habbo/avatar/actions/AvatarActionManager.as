package com.sulake.habbo.avatar.actions
{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Dictionary;

    public class AvatarActionManager 
    {
        private var _assets:IAssetLibrary;
        private var _actions:Dictionary;
        private var _defaultAction:ActionDefinition;

        public function AvatarActionManager(k:IAssetLibrary, _arg_2:XML)
        {
            this._assets = k;
            this._actions = new Dictionary();
            this._Str_1620(_arg_2);
        }

        public function _Str_1620(k:XML):void
        {
            var _local_2:XML;
            var _local_3:String;
            var _local_4:ActionDefinition;
            for each (_local_2 in k.action)
            {
                _local_3 = String(_local_2.@state);
                if (_local_3 != "")
                {
                    _local_4 = new ActionDefinition(_local_2);
                    this._actions[_local_3] = _local_4;
                }
            }
            this.parseActionOffsets();
        }

        private function parseActionOffsets():void
        {
            var k:ActiveActionData;
            var _local_2:ActionDefinition;
            var _local_3:String;
            var _local_4:XML;
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Number;
            var _local_10:XML;
            for each (_local_2 in this._actions)
            {
                _local_3 = _local_2.state;
                if (this._assets.hasAsset(("action_offset_" + _local_3)))
                {
                    _local_4 = (this._assets.getAssetByName(("action_offset_" + _local_3)).content as XML);
                    for each (_local_10 in _local_4.offset)
                    {
                        _local_5 = String(_local_10.@size);
                        _local_6 = parseInt(_local_10.@direction);
                        _local_7 = parseInt(_local_10.@x);
                        _local_8 = parseInt(_local_10.@y);
                        _local_9 = Number(_local_10.@z);
                        _local_2.setOffsets(_local_5, _local_6, new Array(_local_7, _local_8, _local_9));
                    }
                }
            }
        }

        public function _Str_1675(k:String):ActionDefinition
        {
            var _local_2:ActionDefinition;
            for each (_local_2 in this._actions)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_2018(k:String):ActionDefinition
        {
            return this._actions[k];
        }

        public function getDefaultAction():ActionDefinition
        {
            var k:ActionDefinition;
            if (this._defaultAction)
            {
                return this._defaultAction;
            }
            for each (k in this._actions)
            {
                if (k.isDefault)
                {
                    this._defaultAction = k;
                    return k;
                }
            }
            return null;
        }

        public function _Str_781(k:Array, _arg_2:String, _arg_3:int):Array
        {
            var _local_4:Array;
            var _local_5:ActiveActionData;
            var _local_6:ActionDefinition;
            var _local_7:int;
            _local_7 = 0;
            while (_local_7 < k.length)
            {
                _local_5 = (k[_local_7] as ActiveActionData);
                _local_6 = (this._actions[_local_5.actionType] as ActionDefinition);
                if (((!(_local_6 == null)) && (!(_local_6.getOffsets(_arg_2, _arg_3) == null))))
                {
                    _local_4 = _local_6.getOffsets(_arg_2, _arg_3);
                }
                _local_7++;
            }
            return _local_4;
        }

        public function isHeadTurnPreventedByAction(k:Array):Array
        {
            var _local_3:IActiveActionData;
            var _local_4:ActionDefinition;
            k = this._Str_1247(k);
            var _local_2:Array = new Array();
            for each (_local_3 in k)
            {
                _local_4 = this._actions[_local_3.actionType];
                if (_local_4 != null)
                {
                    _local_3.definition = _local_4;
                    _local_2.push(_local_3);
                }
            }
            _local_2.sort(this.orderByPrecedence);
            return _local_2;
        }

        private function _Str_1247(k:Array):Array
        {
            var _local_4:ActiveActionData;
            var _local_5:ActionDefinition;
            var _local_6:int;
            var _local_7:String;
            var _local_2:Array = new Array();
            var _local_3:Array = new Array();
            _local_6 = 0;
            while (_local_6 < k.length)
            {
                _local_4 = (k[_local_6] as ActiveActionData);
                _local_5 = (this._actions[_local_4.actionType] as ActionDefinition);
                if (_local_5 != null)
                {
                    _local_3 = _local_3.concat(_local_5.getPrevents(_local_4.actionParameter));
                }
                _local_6++;
            }
            _local_6 = 0;
            while (_local_6 < k.length)
            {
                _local_4 = (k[_local_6] as ActiveActionData);
                _local_7 = _local_4.actionType;
                if (_local_4.actionType == "fx")
                {
                    _local_7 = (_local_7 + ("." + _local_4.actionParameter));
                }
                if (_local_3.indexOf(_local_7) == -1)
                {
                    _local_2.push(_local_4);
                }
                _local_6++;
            }
            return _local_2;
        }

        private function orderByPrecedence(k:IActiveActionData, _arg_2:IActiveActionData):Number
        {
            var _local_3:Number = k.definition.precedence;
            var _local_4:Number = _arg_2.definition.precedence;
            if (_local_3 < _local_4)
            {
                return 1;
            }
            if (_local_3 > _local_4)
            {
                return -1;
            }
            return 0;
        }
    }
}

