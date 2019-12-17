package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import flash.geom.Rectangle;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import com.sulake.habbo.avatar.structure.figure.IFigurePart;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.IAvatarFigureContainer;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.core.assets.IAsset;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import flash.geom.Matrix;

    public class AvatarEditorGridPartItem implements IAvatarImageListener 
    {
        private static var _Str_8581:BitmapData;
        private static var _Str_2983:Array = [];

        private const _Str_7127:Array = [2, 6, 0, 4, 3, 1];

        private var _Str_2307:IAvatarEditorCategoryModel;
        private var _view:IWindowContainer;
        private var _Str_2779:IWindow;
        private var _partSet:IFigurePartSet;
        private var _Str_611:Array;
        private var _Str_16386:Boolean;
        private var _Str_2968:Boolean = false;
        private var _Str_3155:BitmapData;
        private var _Str_6176:Rectangle;
        private var _Str_18982:int = 0;
        private var _Str_1599:IAvatarRenderManager;
        private var _disposed:Boolean;
        private var _Str_8318:Boolean;

        {
            _Str_2983.push(AvatarFigurePartType.LEFT_HAND_ITEM);
            _Str_2983.push(AvatarFigurePartType.LEFT_HAND);
            _Str_2983.push(AvatarFigurePartType.LEFT_SLEEVE);
            _Str_2983.push(AvatarFigurePartType.LEFT_COAT_SLEEVE);
            _Str_2983.push(AvatarFigurePartType.BODY);
            _Str_2983.push(AvatarFigurePartType.SHOES);
            _Str_2983.push(AvatarFigurePartType.LEGS);
            _Str_2983.push(AvatarFigurePartType.CHEST);
            _Str_2983.push(AvatarFigurePartType.CHEST_ACCESSORY);
            _Str_2983.push(AvatarFigurePartType.COAT_CHEST);
            _Str_2983.push(AvatarFigurePartType.CHEST_PRINT);
            _Str_2983.push(AvatarFigurePartType.WAIST_ACCESSORY);
            _Str_2983.push(AvatarFigurePartType.RIGHT_HAND);
            _Str_2983.push(AvatarFigurePartType.RIGHT_SLEEVE);
            _Str_2983.push(AvatarFigurePartType.RIGHT_COAT_SLEEVE);
            _Str_2983.push(AvatarFigurePartType.HEAD);
            _Str_2983.push(AvatarFigurePartType.FACE);
            _Str_2983.push(AvatarFigurePartType.EYES);
            _Str_2983.push(AvatarFigurePartType.HAIR);
            _Str_2983.push(AvatarFigurePartType.HAIR_BIG);
            _Str_2983.push(AvatarFigurePartType.FACE_ACCESSORY);
            _Str_2983.push(AvatarFigurePartType.EYE_ACCESSORY);
            _Str_2983.push(AvatarFigurePartType.HEAD_ACCESSORY);
            _Str_2983.push(AvatarFigurePartType.HEAD_ACCESSORY_EXTRA);
            _Str_2983.push(AvatarFigurePartType.RIGHT_HAND_ITEM);
        }

        public function AvatarEditorGridPartItem(k:IWindowContainer, _arg_2:IAvatarEditorCategoryModel, _arg_3:IFigurePartSet, _arg_4:Array, _arg_5:Boolean=true, _arg_6:Boolean=false)
        {
            var _local_7:IFigurePart;
            var _local_8:Array;
            super();
            this._Str_2307 = _arg_2;
            this._partSet = _arg_3;
            this._view = k;
            this._Str_2779 = this._view.findChildByTag("BG_COLOR");
            this._Str_611 = _arg_4;
            this._Str_16386 = _arg_5;
            this._Str_8318 = _arg_6;
            if (_arg_3 == null)
            {
                this._Str_3155 = new BitmapData(1, 1, true, 0xFFFFFF);
            }
            if (_arg_3 != null)
            {
                _local_8 = _arg_3.parts;
                for each (_local_7 in _local_8)
                {
                    this._Str_18982 = Math.max(this._Str_18982, _local_7._Str_827);
                }
            }
            this._Str_1599 = this._Str_2307.controller.manager.avatarRenderManager;
            this._view.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            this._view.addEventListener(WindowMouseEvent.OUT, this._Str_17495);
            this._Str_8768();
        }

        private function _Str_17495(k:WindowMouseEvent):void
        {
            if (!this._Str_2968)
            {
                this._Str_2779.visible = false;
            }
            this._Str_2779.blend = 1;
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            if (!this._Str_2968)
            {
                this._Str_2779.visible = true;
                this._Str_2779.blend = 0.5;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._Str_2307 = null;
            this._partSet = null;
            if (this._view != null)
            {
                if (!this._view.disposed)
                {
                    this._view.dispose();
                }
            }
            this._view = null;
            if (this._Str_3155)
            {
                this._Str_3155.dispose();
            }
            this._Str_3155 = null;
            this._disposed = true;
            _Str_8581 = null;
            this._Str_2779 = null;
            this._Str_6176 = null;
            this._Str_1599 = null;
            this._disposed = true;
            this._Str_611 = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function get _Str_2365():Boolean
        {
            return this._Str_2968;
        }

        public function set _Str_2365(k:Boolean):void
        {
            this._Str_2968 = k;
            this._Str_8768();
        }

        public function get id():int
        {
            if (this._partSet == null)
            {
                return -1;
            }
            return this._partSet.id;
        }

        public function get _Str_17445():int
        {
            return this._Str_18982;
        }

        public function update():void
        {
            this._Str_8768();
        }

        public function set _Str_3093(k:BitmapData):void
        {
            this._Str_3155 = k;
            this._Str_8768();
        }

        public function get partSet():IFigurePartSet
        {
            return this._partSet;
        }

        public function set colors(k:Array):void
        {
            this._Str_611 = k;
            this._Str_8768();
        }

        private function _Str_8768():void
        {
            var _local_4:BitmapData;
            var _local_5:BitmapData;
            var _local_6:int;
            var _local_7:int;
            if (((!(this._view)) || (this._view.disposed)))
            {
                return;
            }
            var k:IBitmapWrapperWindow = (this._view.findChildByName("bitmap") as IBitmapWrapperWindow);
            if (k)
            {
                if (((!(this._Str_3155 == null)) && (!(this._Str_16386))))
                {
                    _local_4 = this._Str_3155;
                }
                else
                {
                    _local_4 = this._Str_23219();
                    if (!_local_4)
                    {
                        return;
                    }
                }
                _local_5 = ((k.bitmap) ? k.bitmap : new BitmapData(k.width, k.height));
                _local_5.fillRect(_local_5.rect, 0xFFFFFF);
                _local_6 = ((_local_5.width - _local_4.width) / 2);
                _local_7 = ((_local_5.height - _local_4.height) / 2);
                _local_5.copyPixels(_local_4, _local_4.rect, new Point(_local_6, _local_7), null, null, true);
                k.bitmap = _local_5;
            }
            var _local_2:IWindow = this._view.findChildByTag("CLUB_ICON");
            var _local_3:IStaticBitmapWrapperWindow = (this._view.findChildByTag("SELLABLE_ICON") as IStaticBitmapWrapperWindow);
            if (this._partSet)
            {
                _local_2.visible = (this._partSet.clubLevel > 0);
                _local_3.visible = this._partSet.isSellable;
            }
            else
            {
                _local_2.visible = false;
                _local_3.visible = false;
            }
            if (this._Str_8318)
            {
                this.setAlpha(_local_5, 0.2);
            }
            if (this._Str_2779 == null)
            {
                return;
            }
            this._Str_2779.visible = this._Str_2968;
            this._Str_2779.blend = 1;
            this._view.invalidate();
        }

        private function _Str_21262():Boolean
        {
            var _local_2:IFigurePart;
            var _local_3:String;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapData;
            if (this._Str_2307 == null)
            {
                this._Str_6176 = null;
                return false;
            }
            if ((((!(this.partSet)) || (!(this.partSet.parts))) || (this.partSet.parts.length == 0)))
            {
                this._Str_6176 = null;
                return false;
            }
            if (!this._Str_1599)
            {
                return false;
            }
            var k:IAvatarFigureContainer = this._Str_1599._Str_718(((this.partSet.type + "-") + this.partSet.id));
            if (!this._Str_1599._Str_961(k))
            {
                this._Str_1599._Str_889(k, this);
                return false;
            }
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:Rectangle = new Rectangle();
            for each (_local_2 in this.partSet.parts)
            {
                if (_local_7)
                {
                    _local_3 = ((((((((((FigureData.H + "_") + FigureData.STD) + "_") + _local_2.type) + "_") + _local_2.id) + "_") + this._Str_7127[_local_6]) + "_") + FigureData._Str_2028);
                    _local_4 = (this._Str_1599.getAssetByName(_local_3) as BitmapDataAsset);
                }
                else
                {
                    _local_6 = 0;
                    while (((!(_local_7)) && (_local_6 < this._Str_7127.length)))
                    {
                        _local_3 = ((((((((((FigureData.H + "_") + FigureData.STD) + "_") + _local_2.type) + "_") + _local_2.id) + "_") + this._Str_7127[_local_6]) + "_") + FigureData._Str_2028);
                        _local_4 = (this._Str_1599.getAssetByName(_local_3) as BitmapDataAsset);
                        if (((_local_4) && (_local_4.content)))
                        {
                            _local_7 = true;
                        }
                        else
                        {
                            _local_6++;
                        }
                    }
                }
                if (((_local_4) && (_local_4.content)))
                {
                    _local_5 = (_local_4.content as BitmapData);
                    _local_8 = _local_8.union(new Rectangle((-1 * _local_4.offset.x), (-1 * _local_4.offset.y), _local_4.rectangle.width, _local_4.rectangle.height));
                }
            }
            if (((_local_8) && (_local_8.width > 0)))
            {
                this._Str_6176 = _local_8;
                return true;
            }
            return false;
        }

        private function _Str_23219():BitmapData
        {
            var k:BitmapData;
            var _local_2:IFigurePart;
            var _local_3:String;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapData;
            var _local_9:IAsset;
            var _local_10:int;
            var _local_11:int;
            var _local_12:ColorTransform;
            var _local_13:IPartColor;
            var _local_14:Rectangle;
            if (this.partSet == null)
            {
                return null;
            }
            if (this._Str_2307 == null)
            {
                return null;
            }
            if (this._Str_6176 == null)
            {
                if (!this._Str_21262())
                {
                    if (!_Str_8581)
                    {
                        _local_9 = this._Str_2307.controller.manager.windowManager.assets.getAssetByName("avatar_editor_avatar_editor_download_icon");
                        _Str_8581 = (_local_9.content as BitmapData);
                    }
                    return _Str_8581;
                }
            }
            if (!this._Str_1599)
            {
                return null;
            }
            k = new BitmapData(this._Str_6176.width, this._Str_6176.height, true, 0xFFFFFF);
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:Array = this.partSet.parts.concat().sort(this._Str_25408);
            for each (_local_2 in _local_8)
            {
                _local_4 = null;
                if (_local_7)
                {
                    _local_3 = ((((((((((FigureData.H + "_") + FigureData.STD) + "_") + _local_2.type) + "_") + _local_2.id) + "_") + this._Str_7127[_local_6]) + "_") + FigureData._Str_2028);
                    _local_4 = (this._Str_1599.getAssetByName(_local_3) as BitmapDataAsset);
                }
                else
                {
                    _local_6 = 0;
                    while (((!(_local_7)) && (_local_6 < this._Str_7127.length)))
                    {
                        _local_3 = ((((((((((FigureData.H + "_") + FigureData.STD) + "_") + _local_2.type) + "_") + _local_2.id) + "_") + this._Str_7127[_local_6]) + "_") + FigureData._Str_2028);
                        _local_4 = (this._Str_1599.getAssetByName(_local_3) as BitmapDataAsset);
                        if (((_local_4) && (_local_4.content)))
                        {
                            _local_7 = true;
                        }
                        else
                        {
                            _local_6++;
                        }
                    }
                }
                if (_local_4)
                {
                    _local_5 = BitmapData(_local_4.content);
                    _local_10 = ((-1 * _local_4.offset.x) - this._Str_6176.x);
                    _local_11 = ((-1 * _local_4.offset.y) - this._Str_6176.y);
                    _local_12 = null;
                    if (((this._Str_16386) && (_local_2._Str_827 > 0)))
                    {
                        _local_13 = this._Str_611[(_local_2._Str_827 - 1)];
                        if (_local_13 != null)
                        {
                            _local_12 = _local_13.colorTransform;
                        }
                    }
                    if (_local_12)
                    {
                        _local_14 = new Rectangle(_local_10, _local_11, _local_4.rectangle.width, _local_4.rectangle.height);
                        k.draw((_local_4.content as BitmapData), new Matrix(1, 0, 0, 1, (-(_local_4.rectangle.x) + _local_10), (-(_local_4.rectangle.y) + _local_11)), _local_12, null, _local_14);
                    }
                    else
                    {
                        k.copyPixels(_local_5, _local_4.rectangle, new Point(_local_10, _local_11), null, null, true);
                    }
                }
            }
            return k;
        }

        private function setAlpha(k:BitmapData, _arg_2:Number):BitmapData
        {
            var _local_3:Rectangle = new Rectangle(0, 0, k.width, k.height);
            var _local_4:ColorTransform = new ColorTransform();
            _local_4.alphaMultiplier = _arg_2;
            k.colorTransform(_local_3, _local_4);
            return k;
        }

        private function _Str_25408(k:IFigurePart, _arg_2:IFigurePart):Number
        {
            var _local_3:Number = _Str_2983.indexOf(k.type);
            var _local_4:Number = _Str_2983.indexOf(_arg_2.type);
            if (_local_3 < _local_4)
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return 1;
            }
            if (k.index < _arg_2.index)
            {
                return -1;
            }
            if (k.index > _arg_2.index)
            {
                return 1;
            }
            return 0;
        }

        public function _Str_840(k:String):void
        {
            if (!this._Str_21262())
            {
                return;
            }
            this._Str_8768();
        }

        public function get _Str_14863():Boolean
        {
            return this._Str_8318;
        }
    }
}
