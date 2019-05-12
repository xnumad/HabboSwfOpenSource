package com.sulake.core.localization
{
    import flash.utils.Dictionary;

    public class Localization implements ILocalization 
    {
        private var _manager:ICoreLocalizationManager;
        private var _key:String;
        private var _value:String;
        private var _parameters:Dictionary;
        private var _listeners:Array;
        private var _isInitialized:Boolean = false;

        public function Localization(manager:ICoreLocalizationManager, key:String, value:String=null)
        {
            this._manager = manager;
            this._key = key;
            this._value = value;
        }

        public function get isInitialized():Boolean
        {
            return !(this._value == null);
        }

        public function get value():String
        {
            return this.fillParameterValues();
        }

        public function get raw():String
        {
            return this._value;
        }

        public function setValue(value:String):void
        {
            this._value = value;
            this.updateListeners();
        }

        public function registerListener(listener:ILocalizable):void
        {
            if (!this._listeners)
            {
                this._listeners = [];
            }
            if (this._listeners.indexOf(listener) == -1)
            {
                this._listeners.push(listener);
            }
            listener.localization = this.value;
        }

        public function removeListener(listener:ILocalizable):void
        {
            if (this._listeners)
            {
                var index:int = this._listeners.indexOf(listener);
                if (index >= 0)
                {
                    this._listeners.splice(index, 1);
                }
            }
        }

        public function registerParameter(parameter:String, value:String, id:String="%"):void
        {
            if (!this._parameters)
            {
                this._parameters = new Dictionary();
            }
            this._parameters[parameter] = {
                "id":id,
                "value":value
            }
            this.updateListeners();
        }

        public function updateListeners():void
        {
            if (this._listeners)
            {
                for each (var listener:ILocalizable in this._listeners)
                {
                    listener.localization = this.value;
                }
            }
        }

        private function fillParameterValues():String
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:String;
            var _local_8:RegExp;
            var _local_9:int;
            var _local_10:RegExp;
            var _local_11:RegExp;
            var _local_12:int;
            var _local_13:String;
            var _local_14:String;
            var _local_15:String;
            var k:String = this._value;
            if (k == null)
            {
                return null;
            }
            if (this._parameters)
            {
                for (_local_4 in this._parameters)
                {
                    _local_5 = this._parameters[_local_4];
                    _local_6 = ((_local_5.id + _local_4) + _local_5.id);
                    _local_7 = _local_5.value;
                    _local_8 = new RegExp(_local_6, "gim");
                    k = k.replace(_local_8, _local_7);
                    if (k.toLowerCase().indexOf(((_local_5.id + "{") + _local_4)) >= 0)
                    {
                        switch (int(_local_7))
                        {
                            case 0:
                                _local_9 = 1;
                                break;
                            case 1:
                                _local_9 = 2;
                                break;
                            default:
                                _local_9 = 3;
                        }
                        _local_10 = new RegExp((((_local_5.id + "\\{") + _local_4) + "\\|([^|]*)\\|([^|]*)\\|([^}]*)\\}"), "gim");
                        _local_11 = new RegExp((_local_5.id + _local_5.id), "gim");
                        k = k.replace(_local_10, ("$" + _local_9));
                        k = k.replace(_local_11, _local_7);
                    }
                }
            }
            var _local_2:RegExp = new RegExp("%%%([A-Za-z0-9_])+%%%", "g");
            var _local_3:Array = k.match(_local_2);
            if (_local_3 != null)
            {
                _local_12 = (_local_3.length - 1);
                while (_local_12 >= 0)
                {
                    _local_13 = _local_3[_local_12].substring(3, (_local_3[_local_12].length - 3));
                    _local_14 = ((this._key + ".") + _local_13);
                    _local_15 = this._manager.getLocalization(_local_14, _local_13);
                    k = k.replace(_local_3[_local_12], _local_15);
                    _local_12--;
                }
            }
            return k;
        }
    }
}
