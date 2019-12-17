package com.sulake.habbo.avatar.structure.figure
{
    public class FigurePartSet implements IFigurePartSet 
    {
        private var _type:String;
        private var _id:int;
        private var _gender:String;
        private var _clubLevel:int;
        private var _isColorable:Boolean;
        private var _isSelectable:Boolean;
        private var _parts:Array;
        private var _hiddenLayers:Array;
        private var _isPreSelectable:Boolean;
        private var _isSellable:Boolean;

        public function FigurePartSet(k:XML, _arg_2:String)
        {
            var _local_3:XML;
            var _local_4:XML;
            var _local_5:FigurePart;
            var _local_6:int;
            super();
            this._type = _arg_2;
            this._id = parseInt(k.@id);
            this._gender = String(k.@gender);
            this._clubLevel = parseInt(k.@club);
            this._isColorable = Boolean(parseInt(k.@colorable));
            this._isSelectable = Boolean(parseInt(k.@selectable));
            this._isPreSelectable = Boolean(parseInt(k.@preselectable));
            this._isSellable = Boolean(parseInt(k.@sellable));
            this._parts = new Array();
            this._hiddenLayers = new Array();
            for each (_local_3 in k.part)
            {
                _local_5 = new FigurePart(_local_3);
                _local_6 = this.indexOfPartType(_local_5);
                if (_local_6 != -1)
                {
                    this._parts.splice(_local_6, 0, _local_5);
                }
                else
                {
                    this._parts.push(_local_5);
                }
            }
            for each (_local_4 in k.hiddenlayers.layer)
            {
                this._hiddenLayers.push(String(_local_4.@parttype));
            }
        }

        public function dispose():void
        {
            var k:FigurePart;
            for each (k in this._parts)
            {
                k.dispose();
            }
            this._parts = null;
            this._hiddenLayers = null;
        }

        private function indexOfPartType(k:FigurePart):int
        {
            var _local_3:FigurePart;
            var _local_2:int;
            while (_local_2 < this._parts.length)
            {
                _local_3 = this._parts[_local_2];
                if (((_local_3.type == k.type) && (_local_3.index < k.index)))
                {
                    return _local_2;
                }
                _local_2++;
            }
            return -1;
        }

        public function getPart(k:String, _arg_2:int):IFigurePart
        {
            var _local_3:FigurePart;
            for each (_local_3 in this._parts)
            {
                if (((_local_3.type == k) && (_local_3.id == _arg_2)))
                {
                    return _local_3;
                }
            }
            return null;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get isColorable():Boolean
        {
            return this._isColorable;
        }

        public function get isSelectable():Boolean
        {
            return this._isSelectable;
        }

        public function get parts():Array
        {
            return this._parts;
        }

        public function get hiddenLayers():Array
        {
            return this._hiddenLayers;
        }

        public function get isPreSelectable():Boolean
        {
            return this._isPreSelectable;
        }

        public function get isSellable():Boolean
        {
            return this._isSellable;
        }
    }
}
