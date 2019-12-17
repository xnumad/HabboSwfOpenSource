package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.inventory.IHabboInventory;

    public class CategoryData 
    {
        private const _Str_13041:int = 2;

        private var _parts:Array;
        private var _palettes:Array;
        private var _selectedPartIndex:int = -1;
        private var _paletteIndexes:Array;

        public function CategoryData(k:Array, _arg_2:Array)
        {
            this._parts = k;
            this._palettes = _arg_2;
        }

        private static function _Str_21219(k:Array, _arg_2:int):int
        {
            var _local_4:AvatarEditorGridColorItem;
            if (((!(k)) || (k.length == 0)))
            {
                return -1;
            }
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = k[_local_3];
                if (((_local_4._Str_3420) && (_local_4._Str_3420.clubLevel <= _arg_2)))
                {
                    return _local_4._Str_3420.id;
                }
                _local_3++;
            }
            return -1;
        }


        public function dispose():void
        {
            var k:AvatarEditorGridPartItem;
            var _local_2:Array;
            var _local_3:AvatarEditorGridColorItem;
            if (this._parts)
            {
                for each (k in this._parts)
                {
                    k.dispose();
                }
                this._parts = null;
            }
            if (this._palettes)
            {
                for each (_local_2 in (this._palettes as Array))
                {
                    if (_local_2)
                    {
                        for each (_local_3 in _local_2)
                        {
                            _local_3.dispose();
                        }
                    }
                }
                this._palettes = null;
            }
            this._selectedPartIndex = -1;
            this._paletteIndexes = null;
        }

        public function _Str_20245(k:int):void
        {
            var _local_3:AvatarEditorGridPartItem;
            if (!this._parts)
            {
                return;
            }
            var _local_2:int;
            while (_local_2 < this._parts.length)
            {
                _local_3 = this._parts[_local_2];
                if (_local_3.id == k)
                {
                    this._Str_8066(_local_2);
                    return;
                }
                _local_2++;
            }
        }

        public function _Str_17669(k:Array):void
        {
            var _local_2:AvatarEditorGridColorItem;
            var _local_4:Array;
            var _local_5:int;
            var _local_6:int;
            var _local_7:AvatarEditorGridColorItem;
            if (!this._palettes)
            {
                return;
            }
            if (!k)
            {
                return;
            }
            this._paletteIndexes = new Array(k.length);
            var _local_3:int;
            while (_local_3 < this._palettes.length)
            {
                _local_4 = this.getPalette(_local_3);
                if (_local_4)
                {
                    if (k.length > _local_3)
                    {
                        _local_5 = k[_local_3];
                    }
                    else
                    {
                        _local_7 = (_local_4[0] as AvatarEditorGridColorItem);
                        if (((_local_7) && (_local_7._Str_3420)))
                        {
                            _local_5 = _local_7._Str_3420.id;
                        }
                    }
                    _local_6 = 0;
                    while (_local_6 < _local_4.length)
                    {
                        _local_2 = (_local_4[_local_6] as AvatarEditorGridColorItem);
                        if (_local_2._Str_3420.id == _local_5)
                        {
                            this._paletteIndexes[_local_3] = _local_6;
                            _local_2._Str_2365 = true;
                        }
                        else
                        {
                            _local_2._Str_2365 = false;
                        }
                        _local_6++;
                    }
                }
                _local_3++;
            }
            this._Str_19574();
        }

        public function _Str_8066(k:int):AvatarEditorGridPartItem
        {
            var _local_2:AvatarEditorGridPartItem;
            var _local_3:AvatarEditorGridPartItem;
            if (!this._parts)
            {
                return null;
            }
            if (((this._selectedPartIndex >= 0) && (this._parts.length > this._selectedPartIndex)))
            {
                _local_2 = this._parts[this._selectedPartIndex];
                if (_local_2)
                {
                    _local_2._Str_2365 = false;
                }
            }
            if (this._parts.length > k)
            {
                _local_3 = (this._parts[k] as AvatarEditorGridPartItem);
                if (_local_3)
                {
                    _local_3._Str_2365 = true;
                    this._selectedPartIndex = k;
                    return _local_3;
                }
            }
            return null;
        }

        public function _Str_17959(k:int, _arg_2:int):AvatarEditorGridColorItem
        {
            var _local_3:Array = this.getPalette(_arg_2);
            if (!_local_3)
            {
                return null;
            }
            if (_local_3.length <= k)
            {
                return null;
            }
            this._Str_23284(this._paletteIndexes[_arg_2], _arg_2);
            this._paletteIndexes[_arg_2] = k;
            var _local_4:AvatarEditorGridColorItem = (_local_3[k] as AvatarEditorGridColorItem);
            if (!_local_4)
            {
                return null;
            }
            _local_4._Str_2365 = true;
            this._Str_19574();
            return _local_4;
        }

        public function _Str_24480(k:int):int
        {
            return this._paletteIndexes[k];
        }

        private function _Str_23284(k:int, _arg_2:int):void
        {
            var _local_3:Array = this.getPalette(_arg_2);
            if (!_local_3)
            {
                return;
            }
            if (_local_3.length <= k)
            {
                return;
            }
            var _local_4:AvatarEditorGridColorItem = (_local_3[k] as AvatarEditorGridColorItem);
            if (!_local_4)
            {
                return;
            }
            _local_4._Str_2365 = false;
        }

        public function _Str_11211():Array
        {
            var _local_7:Array;
            var _local_8:AvatarEditorGridColorItem;
            if (((!(this._paletteIndexes)) || (this._paletteIndexes.length == 0)))
            {
                return null;
            }
            if (((!(this._palettes)) || (this._palettes.length == 0)))
            {
                return null;
            }
            var k:Array = (this._palettes[0] as Array);
            if (((!(k)) || (k.length == 0)))
            {
                return null;
            }
            var _local_2:AvatarEditorGridColorItem = (k[0] as AvatarEditorGridColorItem);
            if (((!(_local_2)) || (!(_local_2._Str_3420))))
            {
                return null;
            }
            var _local_3:int = _local_2._Str_3420.id;
            var _local_4:Array = new Array();
            var _local_5:int;
            while (_local_5 < this._paletteIndexes.length)
            {
                _local_7 = this._palettes[_local_5];
                if (!((!(_local_7)) || (_local_7.length <= _local_5)))
                {
                    if (_local_7.length > this._paletteIndexes[_local_5])
                    {
                        _local_8 = (_local_7[this._paletteIndexes[_local_5]] as AvatarEditorGridColorItem);
                        if (((_local_8) && (_local_8._Str_3420)))
                        {
                            _local_4.push(_local_8._Str_3420.id);
                        }
                        else
                        {
                            _local_4.push(_local_3);
                        }
                    }
                    else
                    {
                        _local_4.push(_local_3);
                    }
                }
                _local_5++;
            }
            var _local_6:AvatarEditorGridPartItem = this._Str_6315();
            if (!_local_6)
            {
                return null;
            }
            _local_4 = _local_4.slice(0, Math.max(_local_6._Str_17445, 1));
            return _local_4;
        }

        private function _Str_16788():Array
        {
            var _local_2:AvatarEditorGridColorItem;
            var k:Array = new Array();
            var _local_3:int;
            while (_local_3 < this._paletteIndexes.length)
            {
                _local_2 = this._Str_13355(_local_3);
                if (_local_2)
                {
                    k.push(_local_2._Str_3420);
                }
                else
                {
                    k.push(null);
                }
                _local_3++;
            }
            return k;
        }

        public function _Str_13355(k:int):AvatarEditorGridColorItem
        {
            var _local_2:Array = this.getPalette(k);
            if (((!(_local_2)) || (_local_2.length <= this._paletteIndexes[k])))
            {
                return null;
            }
            return _local_2[this._paletteIndexes[k]] as AvatarEditorGridColorItem;
        }

        public function _Str_26437(k:int):int
        {
            var _local_2:AvatarEditorGridColorItem = this._Str_13355(k);
            if (((_local_2) && (_local_2._Str_3420)))
            {
                return _local_2._Str_3420.id;
            }
            return 0;
        }

        public function get parts():Array
        {
            return this._parts;
        }

        public function getPalette(k:int):Array
        {
            if (!this._paletteIndexes)
            {
                return null;
            }
            if (!this._palettes)
            {
                return null;
            }
            if (this._palettes.length <= k)
            {
                return null;
            }
            return this._palettes[k] as Array;
        }

        public function _Str_6315():AvatarEditorGridPartItem
        {
            return this._parts[this._selectedPartIndex] as AvatarEditorGridPartItem;
        }

        private function _Str_19574():void
        {
            var _local_2:AvatarEditorGridPartItem;
            var k:Array = this._Str_16788();
            for each (_local_2 in this._parts)
            {
                if (_local_2)
                {
                    _local_2.colors = k;
                }
            }
        }

        public function _Str_23352(k:int):Boolean
        {
            var _local_6:int;
            var _local_7:IPartColor;
            var _local_8:IFigurePartSet;
            var _local_2:Boolean;
            var _local_3:Array = this._Str_16788();
            if (_local_3)
            {
                _local_6 = 0;
                while (_local_6 < _local_3.length)
                {
                    _local_7 = _local_3[_local_6];
                    if (((!(_local_7 == null)) && (_local_7.clubLevel > k)))
                    {
                        _local_2 = true;
                    }
                    _local_6++;
                }
            }
            var _local_4:Boolean;
            var _local_5:AvatarEditorGridPartItem = this._Str_6315();
            if (((!(_local_5 == null)) && (_local_5.partSet)))
            {
                _local_8 = _local_5.partSet;
                if (((!(_local_8 == null)) && (_local_8.clubLevel > k)))
                {
                    _local_4 = true;
                }
            }
            return (_local_2) || (_local_4);
        }

        public function _Str_7960(k:IHabboInventory):Boolean
        {
            var _local_4:IFigurePartSet;
            var _local_2:Boolean;
            var _local_3:AvatarEditorGridPartItem = this._Str_6315();
            if (((!(_local_3 == null)) && (_local_3.partSet)))
            {
                _local_4 = _local_3.partSet;
                if ((((!(_local_4 == null)) && (_local_4.isSellable)) && (!(k._Str_14439(_local_4.id)))))
                {
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        public function _Str_15298(k:int):Boolean
        {
            var _local_3:IFigurePartSet;
            var _local_4:AvatarEditorGridPartItem;
            var _local_2:AvatarEditorGridPartItem = this._Str_6315();
            if (((_local_2) && (_local_2.partSet)))
            {
                _local_3 = _local_2.partSet;
                if (_local_3.clubLevel > k)
                {
                    _local_4 = this._Str_8066(0);
                    if (((!(_local_4 == null)) && (_local_4.partSet == null)))
                    {
                        this._Str_8066(1);
                    }
                    return true;
                }
            }
            return false;
        }

        public function _Str_23810(k:int):Boolean
        {
            var _local_8:IPartColor;
            var _local_2:Array = new Array();
            var _local_3:Array = this._Str_16788();
            var _local_4:Boolean;
            var _local_5:Array = this.getPalette(0);
            var _local_6:int = _Str_21219(_local_5, k);
            if (_local_6 == -1)
            {
                return false;
            }
            var _local_7:int;
            while (_local_7 < _local_3.length)
            {
                _local_8 = _local_3[_local_7];
                if (_local_8 == null)
                {
                    _local_2.push(_local_6);
                    _local_4 = true;
                }
                else
                {
                    if (_local_8.clubLevel > k)
                    {
                        _local_2.push(_local_6);
                        _local_4 = true;
                    }
                    else
                    {
                        _local_2.push(_local_8.id);
                    }
                }
                _local_7++;
            }
            if (_local_4)
            {
                this._Str_17669(_local_2);
            }
            return _local_4;
        }

        public function _Str_8360(k:IHabboInventory):Boolean
        {
            var _local_3:IFigurePartSet;
            var _local_4:AvatarEditorGridPartItem;
            var _local_2:AvatarEditorGridPartItem = this._Str_6315();
            if (((_local_2) && (_local_2.partSet)))
            {
                _local_3 = _local_2.partSet;
                if (((_local_3.isSellable) && (!(k._Str_14439(_local_3.id)))))
                {
                    _local_4 = this._Str_8066(0);
                    if (((!(_local_4 == null)) && (_local_4.partSet == null)))
                    {
                        this._Str_8066(1);
                    }
                    return true;
                }
            }
            return false;
        }

        public function get _Str_22359():int
        {
            return this._selectedPartIndex;
        }
    }
}
