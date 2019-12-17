package com.sulake.habbo.avatar
{
    import com.sulake.habbo.avatar.structure.IStructureData;
    import com.sulake.core.utils.Map;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.common.ISideContentModel;
    import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
    import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.habbo.avatar.generic.BodyModel;
    import com.sulake.habbo.avatar.head.HeadModel;
    import com.sulake.habbo.avatar.torso.TorsoModel;
    import com.sulake.habbo.avatar.legs.LegsModel;
    import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
    import com.sulake.habbo.avatar.effects.EffectsModel;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_484._Str_4639;
    import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.common.AvatarEditorGridView;
    import com.sulake.habbo.avatar.common.CategoryData;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;

    public class HabboAvatarEditor 
    {
        private static const _Str_18590:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
        private static const _Str_18820:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
        private static const _Str_6331:int = 2;

        private var _instanceId:uint;
        private var _manager:HabboAvatarEditorManager;
        private var _figureStructureData:IStructureData;
        private var _view:AvatarEditorView;
        private var _isInitialized:Boolean = false;
        private var _categories:Map;
        private var _sideContents:Map;
        private var _figures:Dictionary;
        private var _gender:String = "M";
        private var _figureString:String;
        private var _editorSaver:_Str_5523 = null;
        private var _enableSideContent:Boolean = false;
        private var _avatarEffectChanged:Boolean = false;
        private var _clubMemberLevel:int;
        private var _forceSellableClothingVisibility:Boolean = false;

        public function HabboAvatarEditor(k:uint, _arg_2:HabboAvatarEditorManager, _arg_3:Boolean=false)
        {
            this._instanceId = k;
            this._manager = _arg_2;
            this._figureStructureData = this._manager.avatarRenderManager._Str_813();
            this._forceSellableClothingVisibility = _arg_3;
        }

        public function dispose():void
        {
            var k:IAvatarEditorCategoryModel;
            var _local_2:ISideContentModel;
            if (this._categories != null)
            {
                for each (k in this._categories)
                {
                    k.dispose();
                    k = null;
                }
                this._categories = null;
            }
            if (this._sideContents != null)
            {
                for each (_local_2 in this._sideContents)
                {
                    _local_2.dispose();
                    _local_2 = null;
                }
                this._sideContents = null;
            }
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
            this._figureStructureData = null;
            this._figures = null;
            this._editorSaver = null;
        }

        private function init(k:Array=null):void
        {
            if (this._isInitialized)
            {
                return;
            }
            this._categories = new Map();
            this._sideContents = new Map();
            this._sideContents.add(AvatarEditorSideCategory.WARDROBE, new WardrobeModel(this));
            this._view = new AvatarEditorView(this, k);
            this._figures = new Dictionary();
            this._figures[FigureData.M] = new FigureData(this);
            this._figures[FigureData.F] = new FigureData(this);
            var _local_2:FigureData = this._figures[FigureData.M];
            var _local_3:FigureData = this._figures[FigureData.F];
            _local_2.loadAvatarData(_Str_18590, FigureData.M);
            _local_3.loadAvatarData(_Str_18820, FigureData.F);
            this._categories.add(AvatarEditorFigureCategory.GENERIC, new BodyModel(this));
            this._categories.add(AvatarEditorFigureCategory.HEAD, new HeadModel(this));
            this._categories.add(AvatarEditorFigureCategory.TORSO, new TorsoModel(this));
            this._categories.add(AvatarEditorFigureCategory.LEGS, new LegsModel(this));
            if (((k == null) || (k.indexOf(AvatarEditorFigureCategory.HOTLOOKS) > -1)))
            {
                this._categories.add(AvatarEditorFigureCategory.HOTLOOKS, new HotLooksModel(this));
            }
            this._categories.add(AvatarEditorFigureCategory.EFFECTS, new EffectsModel(this));
            this._isInitialized = true;
        }

        public function loadAvatarInEditor(k:String, _arg_2:String, _arg_3:int=0):void
        {
            var _local_6:IAvatarEditorCategoryModel;
            switch (_arg_2)
            {
                case FigureData.M:
                case "m":
                case "M":
                    _arg_2 = FigureData.M;
                    break;
                case FigureData.F:
                case "f":
                case "F":
                    _arg_2 = FigureData.F;
                    break;
                default:
                    _arg_2 = FigureData.M;
            }
            this.clubMemberLevel = _arg_3;
            var _local_4:Boolean;
            var _local_5:FigureData = this._figures[_arg_2];
            if (_local_5 == null)
            {
                return;
            }
            _local_5.loadAvatarData(k, _arg_2);
            if (_arg_2 != this.gender)
            {
                this.gender = _arg_2;
                _local_4 = true;
            }
            if (this._figureString != k)
            {
                this._figureString = k;
                _local_4 = true;
            }
            if (((this._categories) && (_local_4)))
            {
                for each (_local_6 in this._categories)
                {
                    _local_6.reset();
                }
            }
            if (this._view != null)
            {
                this._view.update();
            }
        }

        public function _Str_20100(k:String):ISetType
        {
            if (this._figureStructureData == null)
            {
                return null;
            }
            return this._figureStructureData._Str_740(k);
        }

        public function getPalette(k:int):IPalette
        {
            if (this._figureStructureData == null)
            {
                return null;
            }
            return this._figureStructureData.getPalette(k);
        }

        public function _Str_2826(k:_Str_5523, _arg_2:Array=null, _arg_3:Boolean=false, _arg_4:String=null, _arg_5:String="generic"):IFrameWindow
        {
            this._editorSaver = k;
            this._enableSideContent = _arg_3;
            this.init(_arg_2);
            this._Str_21799(_arg_2, _arg_5);
            return this._view._Str_2259(_arg_2, _arg_4);
        }

        public function _Str_13533(k:IWindowContainer=null, _arg_2:_Str_5523=null, _arg_3:Array=null, _arg_4:Boolean=false):Boolean
        {
            this._editorSaver = _arg_2;
            this._enableSideContent = _arg_4;
            this.init(_arg_3);
            this._view._Str_13533(k, _arg_3);
            this._Str_21799(_arg_3);
            return true;
        }

        private function _Str_21799(k:Array, _arg_2:String="generic"):void
        {
            var _local_3:Boolean = ((!(k == null)) && (k.length > 0));
            if (((!(_arg_2 == null)) && ((!(_local_3)) || (k.indexOf(_arg_2) >= 0))))
            {
                this._Str_14039(_arg_2);
            }
            else
            {
                if (_local_3)
                {
                    this._Str_14039(k[0]);
                }
                else
                {
                    this._Str_14039(AvatarEditorFigureCategory.GENERIC);
                }
            }
        }

        public function get _Str_12289():uint
        {
            return this._instanceId;
        }

        public function hide():void
        {
            this._view.hide();
        }

        public function _Str_17609(k:String):IWindow
        {
            var _local_2:IAvatarEditorCategoryModel = (this._categories.getValue(k) as IAvatarEditorCategoryModel);
            if (_local_2 != null)
            {
                return _local_2.getWindowContainer();
            }
            return null;
        }

        public function _Str_25043(k:String):void
        {
            var _local_2:IAvatarEditorCategoryModel = (this._categories.getValue(k) as IAvatarEditorCategoryModel);
            if (_local_2)
            {
                _local_2.switchCategory();
            }
        }

        public function _Str_25527(k:String):IWindowContainer
        {
            var _local_2:ISideContentModel = (this._sideContents.getValue(k) as ISideContentModel);
            if (_local_2 != null)
            {
                return _local_2.getWindowContainer();
            }
            return null;
        }

        public function _Str_14039(k:String):void
        {
            if (this._view)
            {
                this._view._Str_5985(k, false);
            }
        }

        public function _Str_26108():void
        {
            if (this._categories == null)
            {
                return;
            }
            this.update();
        }

        public function _Str_21039():void
        {
            if (this._categories == null)
            {
                return;
            }
            this.update();
        }

        public function get figureData():FigureData
        {
            return this._figures[this._gender];
        }

        public function _Str_22528():void
        {
            var _local_3:_Str_4639;
            var k:String = this.figureData.getFigureString();
            var _local_2:String = this.figureData.gender;
            if (this._editorSaver != null)
            {
                this._editorSaver._Str_21941(k, _local_2);
            }
            else
            {
                _local_3 = new _Str_4639(k, _local_2);
                this._manager.communication.connection.send(_local_3);
                this._manager.events.dispatchEvent(new AvatarUpdateEvent(k));
                _local_3.dispose();
                _local_3 = null;
                if (this._avatarEffectChanged)
                {
                    if (this.figureData.avatarEffectType != -1)
                    {
                        this._manager.inventory.setEffectSelected(this.figureData.avatarEffectType);
                    }
                    else
                    {
                        this._manager.inventory._Str_12575(true);
                    }
                }
                this._avatarEffectChanged = false;
            }
        }

        public function _Str_24037(k:IAvatarEditorCategoryModel, _arg_2:String):CategoryData
        {
            var _local_5:int;
            var _local_6:IFigurePartSet;
            var _local_7:AvatarEditorGridPartItem;
            var _local_8:ISetType;
            var _local_9:IPalette;
            var _local_10:Array;
            var _local_11:Array;
            var _local_12:Boolean;
            var _local_13:IPartColor;
            var _local_14:Array;
            var _local_15:Boolean;
            var _local_16:Boolean;
            var _local_17:Map;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:Boolean;
            var _local_22:AvatarEditorGridColorItem;
            var _local_23:int;
            var _local_24:int;
            var _local_25:BitmapDataAsset;
            var _local_26:BitmapData;
            var _local_27:IWindowContainer;
            var _local_28:Boolean;
            var _local_29:Boolean;
            var _local_30:Boolean;
            var _local_31:BitmapDataAsset;
            var _local_32:BitmapData;
            var _local_33:IWindowContainer;
            var _local_34:Array;
            if (!k)
            {
                return null;
            }
            if (!_arg_2)
            {
                return null;
            }
            var _local_3:Array = [];
            var _local_4:Array = new Array();
            _local_5 = 0;
            while (_local_5 < _Str_6331)
            {
                _local_4.push(new Array());
                _local_5++;
            }
            _local_8 = this._Str_20100(_arg_2);
            if (!_local_8)
            {
                return null;
            }
            if (_local_8 != null)
            {
                _local_9 = this.getPalette(_local_8._Str_734);
                if (!_local_9)
                {
                    return null;
                }
                _local_10 = this.figureData.getColourIds(_arg_2);
                if (!_local_10)
                {
                    _local_10 = new Array();
                }
                _local_11 = new Array(_local_10.length);
                _local_12 = this._Str_24175();
                for each (_local_13 in _local_9.colors)
                {
                    if (((_local_13.isSelectable) && ((_local_12) || (this.clubMemberLevel >= _local_13.clubLevel))))
                    {
                        _local_20 = 0;
                        while (_local_20 < _Str_6331)
                        {
                            _local_21 = (this.clubMemberLevel < _local_13.clubLevel);
                            _local_22 = new AvatarEditorGridColorItem((AvatarEditorView._Str_8604.clone() as IWindowContainer), k, _local_13, _local_21);
                            _local_4[_local_20].push(_local_22);
                            _local_20++;
                        }
                        if (_arg_2 != FigureData.FACE)
                        {
                            _local_23 = 0;
                            while (_local_23 < _local_10.length)
                            {
                                if (_local_13.id == _local_10[_local_23])
                                {
                                    _local_11[_local_23] = _local_13;
                                }
                                _local_23++;
                            }
                        }
                    }
                }
                if (_local_12)
                {
                    _local_24 = 2;
                    _local_14 = this._manager.avatarRenderManager._Str_838(this.gender, _local_24);
                }
                else
                {
                    _local_14 = this._manager.avatarRenderManager._Str_838(this.gender, this.clubMemberLevel);
                }
                _local_15 = Boolean((_local_14.indexOf(_arg_2) == -1));
                if (_local_15)
                {
                    _local_25 = (this._manager.windowManager.assets.getAssetByName("avatar_editor_generic_remove_selection") as BitmapDataAsset);
                    _local_26 = (_local_25.content as BitmapData).clone();
                    _local_27 = (AvatarEditorView._Str_6802.clone() as IWindowContainer);
                    _local_27.name = AvatarEditorGridView.REMOVE_ITEM;
                    _local_7 = new AvatarEditorGridPartItem(_local_27, k, null, null, false);
                    _local_7._Str_3093 = _local_26;
                    _local_3.push(_local_7);
                }
                _local_16 = (!(_arg_2 == FigureData.FACE));
                _local_17 = _local_8._Str_710;
                _local_18 = _local_17.length;
                _local_19 = (_local_18 - 1);
                while (_local_19 >= 0)
                {
                    _local_6 = _local_17.getWithIndex(_local_19);
                    _local_28 = false;
                    if (_local_6.gender == FigureData.U)
                    {
                        _local_28 = true;
                    }
                    else
                    {
                        if (_local_6.gender == this.gender)
                        {
                            _local_28 = true;
                        }
                    }
                    if ((((_local_6.isSelectable) && (_local_28)) && ((_local_12) || (this.clubMemberLevel >= _local_6.clubLevel))))
                    {
                        _local_29 = (this.clubMemberLevel < _local_6.clubLevel);
                        _local_30 = true;
                        if (_local_6.isSellable)
                        {
                            _local_30 = (((this.manager.inventory) && (this._manager.inventory._Str_14439(_local_6.id))) || (this._Str_16064()));
                        }
                        if (_local_30)
                        {
                            _local_7 = new AvatarEditorGridPartItem((AvatarEditorView._Str_6802.clone() as IWindowContainer), k, _local_6, _local_11, _local_16, _local_29);
                            _local_3.push(_local_7);
                        }
                    }
                    _local_19--;
                }
            }
            _local_3.sort(((this._Str_25757) ? this._Str_25189 : this._Str_23935));
            if (((this._forceSellableClothingVisibility) || (this._manager.getBoolean("avatareditor.support.sellablefurni"))))
            {
                _local_31 = (this._manager.windowManager.assets.getAssetByName("camera_zoom_in") as BitmapDataAsset);
                _local_32 = (_local_31.content as BitmapData).clone();
                _local_33 = (AvatarEditorView._Str_6802.clone() as IWindowContainer);
                _local_33.name = AvatarEditorGridView.GET_MORE;
                _local_7 = new AvatarEditorGridPartItem(_local_33, k, null, null, false);
                _local_7._Str_3093 = _local_32;
                _local_3.push(_local_7);
            }
            _local_5 = 0;
            while (_local_5 < _Str_6331)
            {
                _local_34 = (_local_4[_local_5] as Array);
                _local_34.sort(this._Str_23625);
                _local_5++;
            }
            return new CategoryData(_local_3, _local_4);
        }

        public function _Str_16133():Boolean
        {
            return this._enableSideContent;
        }

        public function _Str_16127():Boolean
        {
            var k:IAvatarEditorCategoryModel;
            var _local_2:Boolean;
            for each (k in this._categories.getValues())
            {
                _local_2 = k._Str_20411(this.clubMemberLevel);
                if (_local_2)
                {
                    return true;
                }
            }
            return false;
        }

        public function _Str_7960():Boolean
        {
            var k:IAvatarEditorCategoryModel;
            var _local_2:Boolean;
            for each (k in this._categories.getValues())
            {
                _local_2 = k._Str_7960(this._manager.inventory);
                if (_local_2)
                {
                    return true;
                }
            }
            return false;
        }

        public function _Str_21762():void
        {
            var k:IAvatarEditorCategoryModel;
            for each (k in this._categories.getValues())
            {
                k._Str_15298(this.clubMemberLevel);
            }
            this.figureData._Str_2491();
        }

        public function _Str_8360():void
        {
            var k:IAvatarEditorCategoryModel;
            for each (k in this._categories.getValues())
            {
                k._Str_8360();
            }
            this.figureData._Str_2491();
        }

        public function _Str_24919(k:String):int
        {
            var _local_3:IPalette;
            var _local_4:IPartColor;
            var _local_2:ISetType = this._Str_20100(k);
            if (_local_2 != null)
            {
                _local_3 = this.getPalette(_local_2._Str_734);
                for each (_local_4 in _local_3.colors)
                {
                    if (((_local_4.isSelectable) && (this.clubMemberLevel >= _local_4.clubLevel)))
                    {
                        return _local_4.id;
                    }
                }
            }
            return -1;
        }

        private function _Str_23935(k:AvatarEditorGridPartItem, _arg_2:AvatarEditorGridPartItem):Number
        {
            var _local_3:Number = ((k.partSet == null) ? -1 : Number(k.partSet.clubLevel));
            var _local_4:Number = ((_arg_2.partSet == null) ? -1 : Number(_arg_2.partSet.clubLevel));
            var _local_5:Boolean = ((k.partSet == null) ? false : k.partSet.isSellable);
            var _local_6:Boolean = ((_arg_2.partSet == null) ? false : _arg_2.partSet.isSellable);
            if (((_local_5) && (!(_local_6))))
            {
                return 1;
            }
            if (((_local_6) && (!(_local_5))))
            {
                return -1;
            }
            if (_local_3 < _local_4)
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return 1;
            }
            if (k.partSet.id < _arg_2.partSet.id)
            {
                return -1;
            }
            if (k.partSet.id > _arg_2.partSet.id)
            {
                return 1;
            }
            return 0;
        }

        private function _Str_25189(k:AvatarEditorGridPartItem, _arg_2:AvatarEditorGridPartItem):Number
        {
            var _local_3:Number = ((k.partSet == null) ? 9999999999 : Number(k.partSet.clubLevel));
            var _local_4:Number = ((_arg_2.partSet == null) ? 9999999999 : Number(_arg_2.partSet.clubLevel));
            var _local_5:Boolean = ((k.partSet == null) ? false : k.partSet.isSellable);
            var _local_6:Boolean = ((_arg_2.partSet == null) ? false : _arg_2.partSet.isSellable);
            if (((_local_5) && (!(_local_6))))
            {
                return 1;
            }
            if (((_local_6) && (!(_local_5))))
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return -1;
            }
            if (_local_3 < _local_4)
            {
                return 1;
            }
            if (k.partSet.id > _arg_2.partSet.id)
            {
                return -1;
            }
            if (k.partSet.id < _arg_2.partSet.id)
            {
                return 1;
            }
            return 0;
        }

        private function _Str_23625(k:AvatarEditorGridColorItem, _arg_2:AvatarEditorGridColorItem):Number
        {
            var _local_3:Number = ((k._Str_3420 == null) ? -1 : (k._Str_3420.clubLevel as Number));
            var _local_4:Number = ((_arg_2._Str_3420 == null) ? -1 : (_arg_2._Str_3420.clubLevel as Number));
            if (_local_3 < _local_4)
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return 1;
            }
            if (k._Str_3420.index < _arg_2._Str_3420.index)
            {
                return -1;
            }
            if (k._Str_3420.index > _arg_2._Str_3420.index)
            {
                return 1;
            }
            return 0;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function set gender(k:String):void
        {
            var _local_2:IAvatarEditorCategoryModel;
            if (this._gender == k)
            {
                return;
            }
            this._gender = k;
            for each (_local_2 in this._categories)
            {
                _local_2.reset();
            }
            if (this._view != null)
            {
                this._view.update();
            }
        }

        public function get handler():AvatarEditorMessageHandler
        {
            return this._manager.handler;
        }

        public function get wardrobe():WardrobeModel
        {
            if (!this._isInitialized)
            {
                return null;
            }
            return this._sideContents.getValue(AvatarEditorSideCategory.WARDROBE);
        }

        public function get effects():EffectsModel
        {
            if (!this._isInitialized)
            {
                return null;
            }
            return this._categories.getValue(AvatarEditorFigureCategory.EFFECTS);
        }

        public function set clubMemberLevel(k:int):void
        {
            this._clubMemberLevel = k;
        }

        public function get clubMemberLevel():int
        {
            if (!this._clubMemberLevel)
            {
                return this._manager._Str_2627.clubLevel;
            }
            return this._clubMemberLevel;
        }

        public function _Str_10922():Boolean
        {
            return this._manager.catalog._Str_10922();
        }

        private function get _Str_25757():Boolean
        {
            return this._manager.getBoolean("avatareditor.show.clubitems.first");
        }

        private function _Str_24175():Boolean
        {
            return this._manager.getBoolean("avatareditor.show.clubitems.dimmed");
        }

        public function get manager():HabboAvatarEditorManager
        {
            return this._manager;
        }

        public function update():void
        {
            var k:IAvatarEditorCategoryModel;
            var _local_2:ISideContentModel;
            for each (k in this._categories)
            {
                k.reset();
            }
            for each (_local_2 in this._sideContents)
            {
                _local_2.reset();
            }
            if (this._view)
            {
                this._view.update();
            }
        }

        public function setAvatarEffectType(k:int):void
        {
            this.figureData.avatarEffectType = k;
            this.figureData._Str_2491();
            this._avatarEffectChanged = true;
        }

        public function get view():AvatarEditorView
        {
            return this._view;
        }

        public function openHabboClubAdWindow():void
        {
            if (this._manager.catalog)
            {
                this._manager.catalog.openClubCenter();
            }
        }

        public function _Str_16064():Boolean
        {
            return this._instanceId == AvatarEditorInstanceId._Str_16370;
        }
    }
}












