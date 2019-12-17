package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.avatar.geometry.AvatarModelGeometry;
    import com.sulake.habbo.avatar.actions.AvatarActionManager;
    import com.sulake.habbo.avatar.structure.FigureSetData;
    import com.sulake.habbo.avatar.structure.PartSetsData;
    import com.sulake.habbo.avatar.structure.AnimationData;
    import com.sulake.habbo.avatar.animation.AnimationManager;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.AnimationLayerData;
    import com.sulake.habbo.avatar.animation.Animation;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import com.sulake.habbo.avatar.geometry.GeometryBodyPart;
    import com.sulake.habbo.avatar.structure.parts.PartDefinition;
    import com.sulake.habbo.avatar.animation.AddDataContainer;
    import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
    import com.sulake.habbo.avatar.structure.animation.AnimationAction;
    import flash.geom.Point;
    import com.sulake.habbo.avatar.structure.animation.AnimationActionPart;
    import com.sulake.habbo.avatar.geometry.GeometryItem;
    import com.sulake.habbo.avatar.structure.figure.IFigurePart;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.structure.IStructureData;
    import flash.display.Shape;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import flash.geom.Matrix;
    import flash.display.Stage;
    import com.sulake.habbo.avatar.structure.*;

    public class AvatarStructure extends EventDispatcherWrapper 
    {
        private var _renderManager:AvatarRenderManager;
        private var _geometry:AvatarModelGeometry;
        private var _actionManager:AvatarActionManager;
        private var _figureData:FigureSetData;
        private var _partSetsData:PartSetsData;
        private var _animationData:AnimationData;
        private var _animationManager:AnimationManager;
        private var _defaultAction:ActionDefinition;
        private var _mandatorySetTypeIds:Dictionary;

        public function AvatarStructure(k:AvatarRenderManager)
        {
            this._renderManager = k;
            this._figureData = new FigureSetData();
            this._partSetsData = new PartSetsData();
            this._animationData = new AnimationData();
            this._animationManager = new AnimationManager();
            this._mandatorySetTypeIds = new Dictionary();
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                super.dispose();
                this._renderManager = null;
                this._figureData = null;
                this._partSetsData = null;
                this._animationData = null;
                this._mandatorySetTypeIds = null;
            }
        }

        public function init():void
        {
            this._mandatorySetTypeIds = new Dictionary();
        }

        public function initGeometry(k:XML):void
        {
            if (!k)
            {
                return;
            }
            this._geometry = new AvatarModelGeometry(k);
        }

        public function initActions(k:IAssetLibrary, _arg_2:XML):void
        {
            if (!_arg_2)
            {
                return;
            }
            this._actionManager = new AvatarActionManager(k, _arg_2);
            this._defaultAction = this._actionManager.getDefaultAction();
        }

        public function _Str_1620(k:XML):void
        {
            this._actionManager._Str_1620(k);
            this._defaultAction = this._actionManager.getDefaultAction();
        }

        public function initPartSets(k:XML):Boolean
        {
            if (!k)
            {
                return false;
            }
            if (this._partSetsData.parse(k))
            {
                this._partSetsData.getPartDefinition("ri")._Str_1583 = true;
                this._partSetsData.getPartDefinition("li")._Str_1583 = true;
                return true;
            }
            return false;
        }

        public function initAnimation(k:XML):Boolean
        {
            if (!k)
            {
                return false;
            }
            return this._animationData.parse(k);
        }

        public function initFigureData(k:XML):Boolean
        {
            if (!k)
            {
                return false;
            }
            return this._figureData.parse(k);
        }

        public function _Str_882(k:XML):void
        {
            this._figureData._Str_1133(k);
        }

        public function _Str_1849(k:AssetLibraryCollection, _arg_2:String="fx", _arg_3:int=200):void
        {
            var _local_4:XML;
            var _local_5:int;
            while (_local_5 < _arg_3)
            {
                if (k.hasAsset((_arg_2 + _local_5)))
                {
                    _local_4 = (k.getAssetByName((_arg_2 + _local_5)).content as XML);
                    this._animationManager.registerAnimation(this, _local_4);
                }
                _local_5++;
            }
        }

        public function registerAnimation(k:XML):void
        {
            this._animationManager.registerAnimation(this, k);
        }

        public function _Str_867(k:IAvatarFigureContainer, _arg_2:String, _arg_3:int=0):IPartColor
        {
            var _local_4:Array = k._Str_815(_arg_2);
            if (((!(_local_4)) || (_local_4.length < _arg_3)))
            {
                return null;
            }
            var _local_5:ISetType = this._figureData._Str_740(_arg_2);
            if (_local_5 == null)
            {
                return null;
            }
            var _local_6:IPalette = this._figureData.getPalette(_local_5._Str_734);
            if (!_local_6)
            {
                return null;
            }
            return _local_6._Str_751(_local_4[_arg_3]);
        }

        public function getBodyPartData(k:String, _arg_2:int, _arg_3:String):AnimationLayerData
        {
            return this._animationManager.getLayerData(k, _arg_2, _arg_3) as AnimationLayerData;
        }

        public function getAnimation(k:String):Animation
        {
            return this._animationManager.getAnimation(k) as Animation;
        }

        public function _Str_1675(k:String):ActionDefinition
        {
            return this._actionManager._Str_1675(k);
        }

        public function _Str_2018(k:String):ActionDefinition
        {
            return this._actionManager._Str_2018(k);
        }

        public function _Str_1939(k:String):Boolean
        {
            return this._geometry._Str_1939(k);
        }

        public function isHeadTurnPreventedByAction(k:Array):Array
        {
            return this._actionManager.isHeadTurnPreventedByAction(k);
        }

        public function _Str_1936(k:Array):int
        {
            var _local_3:IActiveActionData;
            var _local_2:int;
            for each (_local_3 in k)
            {
                _local_2 = Math.max(_local_2, this._animationData.getFrameCount(_local_3.definition));
            }
            return _local_2;
        }

        public function getMandatorySetTypeIds(k:String, _arg_2:int):Array
        {
            if (!this._mandatorySetTypeIds[k])
            {
                this._mandatorySetTypeIds[k] = new Dictionary();
            }
            if (this._mandatorySetTypeIds[k][_arg_2])
            {
                return this._mandatorySetTypeIds[k][_arg_2];
            }
            this._mandatorySetTypeIds[k][_arg_2] = this._figureData.getMandatorySetTypeIds(k, _arg_2);
            return this._mandatorySetTypeIds[k][_arg_2];
        }

        public function _Str_2264(k:String, _arg_2:String):IFigurePartSet
        {
            return this._figureData._Str_2264(k, _arg_2);
        }

        public function _Str_781(k:Array, _arg_2:String, _arg_3:int):Array
        {
            return this._actionManager._Str_781(k, _arg_2, _arg_3);
        }

        public function getCanvas(k:String, _arg_2:String):AvatarCanvas
        {
            return this._geometry.getCanvas(k, _arg_2);
        }

        public function _Str_2101(k:IAvatarImage):void
        {
            this._geometry._Str_2101(k);
        }

        public function _Str_2021(k:IActiveActionData, _arg_2:IAvatarImage):Array
        {
            var _local_6:GeometryBodyPart;
            var _local_7:String;
            var _local_8:Animation;
            var _local_9:String;
            var _local_10:PartDefinition;
            var _local_11:XML;
            var _local_12:XML;
            var _local_13:AddDataContainer;
            var _local_14:String;
            var _local_3:Array = [];
            var _local_4:Array = new Array();
            var _local_5:String = k.definition.geometryType;
            if (k.definition.isAnimation)
            {
                _local_7 = ((k.definition.state + ".") + k.actionParameter);
                _local_8 = (this._animationManager.getAnimation(_local_7) as Animation);
                if (_local_8 != null)
                {
                    _local_3 = _local_8.getAnimatedBodyPartIds(0, k.overridingAction);
                    if (_local_8.hasAddData())
                    {
                        _local_11 = <item id="" x="0" y="0" z="0" radius="0.01" nx="0" ny="0" nz="-1" double="1"/>
                        ;
                        _local_12 = <part/>
                        ;
                        for each (_local_13 in _local_8.addData)
                        {
                            _local_6 = this._geometry.getBodyPart(_local_5, _local_13.align);
                            if (_local_6 != null)
                            {
                                _local_11.@id = _local_13.id;
                                _local_6.addPart(_local_11, _arg_2);
                                _local_12.@["set-type"] = _local_13.id;
                                _local_10 = this._partSetsData.addPartDefinition(_local_12);
                                _local_10._Str_1583 = true;
                                if (_local_13.base == "")
                                {
                                    _local_10._Str_1734 = 1;
                                }
                                if (_local_4.indexOf(_local_6.id) == -1)
                                {
                                    _local_4.push(_local_6.id);
                                }
                            }
                        }
                    }
                }
                for each (_local_9 in _local_3)
                {
                    _local_6 = this._geometry.getBodyPart(_local_5, _local_9);
                    if (_local_6 != null)
                    {
                        if (_local_4.indexOf(_local_6.id) == -1)
                        {
                            _local_4.push(_local_6.id);
                        }
                    }
                }
            }
            else
            {
                _local_3 = this._partSetsData.getActiveParts(k.definition);
                for each (_local_14 in _local_3)
                {
                    _local_6 = this._geometry.getBodyPartOfItem(_local_5, _local_14, _arg_2);
                    if (_local_6 != null)
                    {
                        if (_local_4.indexOf(_local_6.id) == -1)
                        {
                            _local_4.push(_local_6.id);
                        }
                    }
                }
            }
            return _local_4;
        }

        public function getBodyPartsUnordered(k:String):Array
        {
            return this._geometry.getBodyPartIdsInAvatarSet(k);
        }

        public function getBodyParts(k:String, _arg_2:String, _arg_3:int):Array
        {
            var _local_4:Number = AvatarDirectionAngle._Str_2204[_arg_3];
            return this._geometry._Str_2250(k, _local_4, _arg_2);
        }

        public function _Str_1888(k:IActiveActionData, _arg_2:int, _arg_3:int, _arg_4:String):Point
        {
            var _local_5:AnimationAction = this._animationData.getAction(k.definition);
            if (_local_5)
            {
                return _local_5._Str_1888(_arg_2, _arg_3, _arg_4);
            }
            return AnimationAction.DEFAULT_OFFSET;
        }

        public function _Str_713(k:String, _arg_2:IAvatarFigureContainer, _arg_3:IActiveActionData, _arg_4:String, _arg_5:int, _arg_6:Array, _arg_7:IAvatarImage, _arg_8:Map=null):Array
        {
            var _local_10:Animation;
            var _local_12:String;
            var _local_13:PartDefinition;
            var _local_17:String;
            var _local_18:AvatarImagePartContainer;
            var _local_19:AnimationActionPart;
            var _local_20:Array;
            var _local_22:Array;
            var _local_23:AvatarImagePartContainer;
            var _local_24:String;
            var _local_25:String;
            var _local_26:GeometryBodyPart;
            var _local_27:GeometryItem;
            var _local_28:int;
            var _local_29:Array;
            var _local_30:ISetType;
            var _local_31:IPalette;
            var _local_32:IFigurePartSet;
            var _local_33:IFigurePart;
            var _local_34:IActionDefinition;
            var _local_35:String;
            var _local_36:IPartColor;
            var _local_37:Boolean;
            var _local_38:Boolean;
            var _local_39:IPartColor;
            var _local_40:Boolean;
            var _local_41:String;
            var _local_42:int;
            var _local_43:int;
            var _local_44:GeometryBodyPart;
            var _local_45:Boolean;
            var _local_46:Number;
            var _local_47:String;
            var _local_48:AddDataContainer;
            if (_arg_3 == null)
            {
                return [];
            }
            var _local_9:Array = this._partSetsData.getActiveParts(_arg_3.definition);
            var _local_11:Array = new Array();
            var _local_14:Array = [0];
            var _local_15:AnimationAction = this._animationData.getAction(_arg_3.definition);
            if (_arg_3.definition.isAnimation)
            {
                _local_24 = ((_arg_3.definition.state + ".") + _arg_3.actionParameter);
                _local_10 = (this._animationManager.getAnimation(_local_24) as Animation);
                if (_local_10 != null)
                {
                    _local_14 = this.getPopulatedFrameArray(_local_10._Str_2185(_arg_3.overridingAction));
                    for each (_local_25 in _local_10.getAnimatedBodyPartIds(0, _arg_3.overridingAction))
                    {
                        if (_local_25 == k)
                        {
                            _local_26 = this._geometry.getBodyPart(_arg_4, _local_25);
                            if (_local_26 != null)
                            {
                                for each (_local_27 in _local_26.getDynamicParts(_arg_7))
                                {
                                    _local_9.push(_local_27.id);
                                }
                            }
                        }
                    }
                }
            }
            var _local_16:Array = this._geometry._Str_713(_arg_4, k, _arg_5, _local_9, _arg_7);
            var _local_21:Array = _arg_2._Str_1016();
            for each (_local_17 in _local_21)
            {
                if (_arg_8 != null)
                {
                    if (_arg_8[_local_17] != null) continue;
                }
                _local_28 = _arg_2.getPartSetId(_local_17);
                _local_29 = _arg_2._Str_815(_local_17);
                _local_30 = this._figureData._Str_740(_local_17);
                if (_local_30)
                {
                    _local_31 = this._figureData.getPalette(_local_30._Str_734);
                    if (_local_31)
                    {
                        _local_32 = _local_30._Str_1020(_local_28);
                        if (_local_32)
                        {
                            _arg_6 = _arg_6.concat(_local_32.hiddenLayers);
                            for each (_local_33 in _local_32.parts)
                            {
                                if (_local_16.indexOf(_local_33.type) > -1)
                                {
                                    if (_local_15 != null)
                                    {
                                        _local_19 = _local_15.getPart(_local_33.type);
                                        if (_local_19 != null)
                                        {
                                            _local_20 = _local_19.frames;
                                        }
                                        else
                                        {
                                            _local_20 = _local_14;
                                        }
                                    }
                                    else
                                    {
                                        _local_20 = _local_14;
                                    }
                                    _local_34 = _arg_3.definition;
                                    if (_local_9.indexOf(_local_33.type) == -1)
                                    {
                                        _local_34 = this._defaultAction;
                                    }
                                    _local_13 = this._partSetsData.getPartDefinition(_local_33.type);
                                    _local_35 = ((_local_13 == null) ? _local_33.type : _local_13._Str_1693);
                                    if (_local_35 == "")
                                    {
                                        _local_35 = _local_33.type;
                                    }
                                    if (((_local_29) && (_local_29.length > (_local_33._Str_827 - 1))))
                                    {
                                        _local_36 = _local_31._Str_751(_local_29[(_local_33._Str_827 - 1)]);
                                    }
                                    _local_37 = (_local_33._Str_827 > 0);
                                    _local_18 = new AvatarImagePartContainer(k, _local_33.type, _local_33.id.toString(), _local_36, _local_20, _local_34, _local_37, _local_33.paletteMap, _local_35);
                                    _local_11.push(_local_18);
                                }
                            }
                        }
                    }
                }
            }
            _local_22 = new Array();
            for each (_local_12 in _local_16)
            {
                _local_38 = false;
                _local_39 = null;
                _local_40 = ((_arg_8) && (_arg_8[_local_12]));
                for each (_local_23 in _local_11)
                {
                    if (_local_23.partType == _local_12)
                    {
                        if (_local_40)
                        {
                            _local_39 = _local_23.color;
                        }
                        else
                        {
                            _local_38 = true;
                            if (_arg_6.indexOf(_local_12) == -1)
                            {
                                _local_22.push(_local_23);
                            }
                        }
                    }
                }
                if (!_local_38)
                {
                    if (_local_40)
                    {
                        _local_41 = _arg_8[_local_12];
                        _local_42 = 0;
                        _local_43 = 0;
                        while (_local_43 < _local_41.length)
                        {
                            _local_42 = (_local_42 + _local_41.charCodeAt(_local_43));
                            _local_43++;
                        }
                        if (_local_15 != null)
                        {
                            _local_19 = _local_15.getPart(_local_12);
                            if (_local_19 != null)
                            {
                                _local_20 = _local_19.frames;
                            }
                            else
                            {
                                _local_20 = _local_14;
                            }
                        }
                        else
                        {
                            _local_20 = _local_14;
                        }
                        _local_18 = new AvatarImagePartContainer(k, _local_12, _local_41, _local_39, _local_20, _arg_3.definition, (!(_local_39 == null)), -1, _local_12, false, 1);
                        _local_22.push(_local_18);
                    }
                    else
                    {
                        if (_local_9.indexOf(_local_12) > -1)
                        {
                            _local_44 = this._geometry.getBodyPartOfItem(_arg_4, _local_12, _arg_7);
                            if (k != _local_44.id)
                            {
                            }
                            else
                            {
                                _local_13 = this._partSetsData.getPartDefinition(_local_12);
                                _local_45 = false;
                                _local_46 = 1;
                                if (_local_13._Str_1583)
                                {
                                    _local_47 = "1";
                                    if (_arg_3.actionParameter != "")
                                    {
                                        _local_47 = _arg_3.actionParameter;
                                    }
                                    if (_local_13.hasStaticId())
                                    {
                                        _local_47 = _local_13._Str_1734.toString();
                                    }
                                    if (_local_10 != null)
                                    {
                                        _local_48 = _local_10.getAddData(_local_12);
                                        if (_local_48 != null)
                                        {
                                            _local_45 = _local_48.isBlended;
                                            _local_46 = _local_48.blend;
                                        }
                                    }
                                    if (_local_15 != null)
                                    {
                                        _local_19 = _local_15.getPart(_local_12);
                                        if (_local_19 != null)
                                        {
                                            _local_20 = _local_19.frames;
                                        }
                                        else
                                        {
                                            _local_20 = _local_14;
                                        }
                                    }
                                    else
                                    {
                                        _local_20 = _local_14;
                                    }
                                    _local_18 = new AvatarImagePartContainer(k, _local_12, _local_47, null, _local_20, _arg_3.definition, false, -1, _local_12, _local_45, _local_46);
                                    _local_22.push(_local_18);
                                }
                            }
                        }
                    }
                }
            }
            return _local_22;
        }

        public function get figureData():IStructureData
        {
            return this._figureData;
        }

        public function get animationManager():AnimationManager
        {
            return this._animationManager;
        }

        public function get avatarRenderManager():AvatarRenderManager
        {
            return this._renderManager;
        }

        private function getPopulatedFrameArray(k:int):Array
        {
            var _local_2:Array = new Array();
            var _local_3:int;
            while (_local_3 < k)
            {
                _local_2.push(_local_3);
                _local_3++;
            }
            return _local_2;
        }

        public function displayGeometry(k:Stage):void
        {
            var _local_9:String;
            var _local_10:GeometryBodyPart;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Shape;
            var _local_2:BitmapData = new BitmapData(960, 540, false, 0xFFFFFFFF);
            var _local_3:Bitmap = new Bitmap(_local_2);
            k.addChild(_local_3);
            var _local_4:Number = (_local_2.width / 2);
            var _local_5:Number = (_local_2.height / 2);
            var _local_6:Number = 200;
            var _local_7:TextField = new TextField();
            var _local_8:Matrix = new Matrix();
            for each (_local_9 in this._geometry.getBodyPartIdsInAvatarSet("full"))
            {
                _local_10 = this._geometry.getBodyPart("vertical", _local_9);
                Logger.log(("Drawing bodypart : " + _local_9));
                if (_local_10 != null)
                {
                    _local_11 = (_local_10.location.x * _local_6);
                    _local_12 = (_local_10.location.z * _local_6);
                    _local_13 = (_local_10.radius * _local_6);
                    _local_14 = new Shape();
                    _local_14.graphics.lineStyle(1, 0xFFFF0000, 1);
                    _local_14.graphics.drawCircle((_local_4 + _local_11), (_local_5 + _local_12), _local_13);
                    _local_2.draw(_local_14);
                    _local_7.text = _local_9;
                    _local_7.textColor = 0xFFFF0000;
                    _local_8.identity();
                    _local_8.tx = ((((_local_4 + _local_11) + _local_13) - _local_7.textWidth) - 5);
                    _local_8.ty = ((_local_5 + _local_12) - 5);
                    _local_2.draw(_local_7, _local_8);
                }
                else
                {
                    Logger.log(("Could not draw bodypart : " + _local_9));
                }
            }
        }

        public function _Str_672():Array
        {
            var k:Dictionary;
            var _local_2:Array;
            var _local_3:String;
            if (this._actionManager)
            {
                k = this._actionManager._Str_1675("CarryItem").params;
                _local_2 = [];
                for (_local_3 in k)
                {
                    _local_2.push(_local_3);
                }
                return _local_2;
            }
            return [];
        }
    }
}



