package com.sulake.habbo.avatar.actions
{
    import com.sulake.core.utils.Map;
    import flash.utils.Dictionary;

    public class ActionDefinition implements IActionDefinition 
    {
        private var _id:String;
        private var _state:String;
        private var _precedence:int;
        private var _activePartSet:String;
        private var _assetPartDefinition:String;
        private var _lay:String;
        private var _geometryType:String;
        private var _isMain:Boolean = false;
        private var _isDefault:Boolean = false;
        private var _isAnimation:Boolean = false;
        private var _startFromFrameZero:Boolean = false;
        private var _prevents:Array;
        private var _preventHeadTurn:Boolean;
        private var _canvasOffsets:Map;
        private var _types:Dictionary;
        private var _params:Dictionary;
        private var _defaultParameterValue:String = "";

        public function ActionDefinition(k:XML)
        {
            var _local_3:XML;
            var _local_4:XML;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            this._prevents = new Array();
            this._types = new Dictionary();
            this._params = new Dictionary();
            super();
            this._id = String(k.@id);
            this._state = String(k.@state);
            this._precedence = parseInt(k.@precedence);
            this._activePartSet = String(k.@activepartset);
            this._assetPartDefinition = String(k.@assetpartdefinition);
            this._lay = String(k.@lay);
            this._geometryType = String(k.@geometrytype);
            this._isMain = Boolean(parseInt(k.@main));
            this._isDefault = Boolean(parseInt(k.@isdefault));
            this._isAnimation = Boolean(parseInt(k.@animation));
            this._startFromFrameZero = (k.@startfromframezero == "true");
            this._preventHeadTurn = (k.@preventheadturn == "true");
            var _local_2:String = String(k.@prevents);
            if (_local_2 != "")
            {
                this._prevents = _local_2.split(",");
            }
            for each (_local_3 in k.param)
            {
                _local_5 = String(_local_3.@id);
                _local_6 = String(_local_3.@value);
                if (_local_5 == "default")
                {
                    this._defaultParameterValue = _local_6;
                }
                else
                {
                    this._params[_local_5] = _local_6;
                }
            }
            for each (_local_4 in k.type)
            {
                _local_7 = String(_local_4.@id);
                this._types[_local_7] = new ActionType(_local_4);
            }
        }

        public function setOffsets(k:String, _arg_2:int, _arg_3:Array):void
        {
            if (this._canvasOffsets == null)
            {
                this._canvasOffsets = new Map();
            }
            if (this._canvasOffsets.getValue(k) == null)
            {
                this._canvasOffsets.add(k, new Map());
            }
            var _local_4:Map = this._canvasOffsets.getValue(k);
            _local_4.add(_arg_2, _arg_3);
        }

        public function getOffsets(k:String, _arg_2:int):Array
        {
            if (this._canvasOffsets == null)
            {
                return null;
            }
            var _local_3:Map = (this._canvasOffsets.getValue(k) as Map);
            if (_local_3 == null)
            {
                return null;
            }
            return _local_3.getValue(_arg_2) as Array;
        }

        public function getParameterValue(k:String):String
        {
            if (k == "")
            {
                return "";
            }
            var _local_2:String = this._params[k];
            if (_local_2 == null)
            {
                _local_2 = this._defaultParameterValue;
            }
            return _local_2;
        }

        private function _Str_1889(k:String):Array
        {
            if (k == "")
            {
                return [];
            }
            var _local_2:ActionType = this._types[k];
            if (_local_2 != null)
            {
                return _local_2.prevents;
            }
            return [];
        }

        public function toString():String
        {
            return ((((((((((((((((((((((("[ActionDefinition]\n" + "id:           ") + this.id) + "\n") + "state:        ") + this.state) + "\n") + "main:         ") + this.isMain) + "\n") + "default:      ") + this.isDefault) + "\n") + "geometry:     ") + this.state) + "\n") + "precedence:   ") + this.precedence) + "\n") + "activepartset:") + this.activePartSet) + "\n") + "activepartdef:") + this.assetPartDefinition) + "";
        }

        public function get id():String
        {
            return this._id;
        }

        public function get state():String
        {
            return this._state;
        }

        public function get precedence():int
        {
            return this._precedence;
        }

        public function get activePartSet():String
        {
            return this._activePartSet;
        }

        public function get isMain():Boolean
        {
            return this._isMain;
        }

        public function get isDefault():Boolean
        {
            return this._isDefault;
        }

        public function get assetPartDefinition():String
        {
            return this._assetPartDefinition;
        }

        public function get lay():String
        {
            return this._lay;
        }

        public function get geometryType():String
        {
            return this._geometryType;
        }

        public function get isAnimation():Boolean
        {
            return this._isAnimation;
        }

        public function getPrevents(k:String=""):Array
        {
            return this._prevents.concat(this._Str_1889(k));
        }

        public function getPreventHeadTurn(k:String=""):Boolean
        {
            if (k == "")
            {
                return this._preventHeadTurn;
            }
            var _local_2:ActionType = this._types[k];
            if (_local_2 != null)
            {
                return _local_2.preventHeadTurn;
            }
            return this._preventHeadTurn;
        }

        public function isAnimated(k:String):Boolean
        {
            if (k == "")
            {
                return true;
            }
            var _local_2:ActionType = this._types[k];
            if (_local_2 != null)
            {
                return _local_2.isAnimated;
            }
            return true;
        }

        public function get startFromFrameZero():Boolean
        {
            return this._startFromFrameZero;
        }

        public function get params():Dictionary
        {
            return this._params;
        }
    }
}
