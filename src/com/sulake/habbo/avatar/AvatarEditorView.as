package com.sulake.habbo.avatar
{
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.Timer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.common.IAvatarEditorGridView;
    import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.IWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.common.AvatarEditorGridView;
    import com.sulake.habbo.avatar.effects.AvatarEditorGridViewEffects;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import __AS3__.vec.*;

    public class AvatarEditorView 
    {
        public static var _Str_6802:IWindowContainer;
        public static var _Str_8604:IWindowContainer;
        public static var _Str_20146:int = 0x666666;
        private static const _Str_15942:int = 1500;
        private static const _Str_3163:Point = new Point(100, 30);

        private var _editor:HabboAvatarEditor;
        private var _editorContent:IWindowContainer;
        private var _currentViewId:String;
        private var _tabContainer:ITabContextWindow;
        private var _frameWindow:IFrameWindow;
        private var _windowContext:IWindowContainer;
        private var _saveTimer:Timer;
        private var _avatarDirection:int = 4;
        private var _currentSideContentType:String;
        private var _showWardrobeOnUpdate:Boolean = true;
        private var _availableCategories:Array;
        private var _allCategories:Array;
        private var _categoryContainers:Dictionary;
        private var _gridView:IAvatarEditorGridView;
        private var _effectsGridView:IAvatarEditorGridView;
        private var _avatarEditorNameChangeView:AvatarEditorNameChangeView;

        public function AvatarEditorView(k:HabboAvatarEditor, _arg_2:Array)
        {
            var _local_3:String;
            this._availableCategories = [];
            this._allCategories = [AvatarEditorFigureCategory.GENERIC, AvatarEditorFigureCategory.HEAD, AvatarEditorFigureCategory.TORSO, AvatarEditorFigureCategory.LEGS, AvatarEditorFigureCategory.HOTLOOKS, AvatarEditorFigureCategory.WARDROBE];
            super();
            this._editor = k;
            this._saveTimer = new Timer(_Str_15942, 1);
            this._saveTimer.addEventListener(TimerEvent.TIMER, this._Str_5183);
            if (k.manager.getBoolean("effects.in.avatar.editor"))
            {
                this._allCategories.push(AvatarEditorFigureCategory.EFFECTS);
            }
            if (_arg_2 == null)
            {
                _arg_2 = this._allCategories;
            }
            for each (_local_3 in _arg_2)
            {
                this._availableCategories.push(_local_3);
            }
            this.createWindow();
        }

        public function dispose():void
        {
            var k:IWindowContainer;
            var _local_2:IWindowContainer;
            var _local_3:IWindowContainer;
            if (this._saveTimer != null)
            {
                this._saveTimer.stop();
                this._saveTimer.removeEventListener(TimerEvent.TIMER, this._Str_5183);
                this._saveTimer = null;
            }
            if (this._tabContainer)
            {
                this._tabContainer.dispose();
                this._tabContainer = null;
            }
            if (this._editorContent)
            {
                this._editorContent.dispose();
                this._editorContent = null;
            }
            if (this._windowContext != null)
            {
                this._windowContext.dispose();
                this._windowContext = null;
            }
            if (this._frameWindow)
            {
                this._frameWindow.dispose();
                this._frameWindow = null;
            }
            if (this._editorContent != null)
            {
                k = (this._editorContent.findChildByName("figureContainer") as IWindowContainer);
                if (k != null)
                {
                    while (k.numChildren > 0)
                    {
                        k.removeChildAt(0);
                    }
                }
                _local_2 = (this._editorContent.findChildByName("contentArea") as IWindowContainer);
                if (_local_2 != null)
                {
                    while (_local_2.numChildren > 0)
                    {
                        _local_2.removeChildAt(0);
                    }
                }
                _local_3 = (this._editorContent.findChildByName("sideContainer") as IWindowContainer);
                if (_local_3 != null)
                {
                    while (_local_3.numChildren > 0)
                    {
                        _local_3.removeChildAt(0);
                    }
                }
                this._editor = null;
            }
        }

        public function _Str_2259(k:Array, _arg_2:String=null):IFrameWindow
        {
            if (this._frameWindow)
            {
                this._frameWindow.visible = true;
                this._frameWindow.activate();
                return this._frameWindow;
            }
            if (this._frameWindow)
            {
                this._frameWindow.dispose();
                this._frameWindow = null;
            }
            var _local_3:XmlAsset = (this._editor.manager.assets.getAssetByName("AvatarEditorFrame") as XmlAsset);
            if (_local_3)
            {
                this._frameWindow = (this._editor.manager.windowManager.buildFromXML((_local_3.content as XML)) as IFrameWindow);
            }
            if (this._frameWindow == null)
            {
                return null;
            }
            var _local_4:IWindowContainer = (this._frameWindow.findChildByName("maincontent") as IWindowContainer);
            if (!this._Str_13533(_local_4, k))
            {
                this._frameWindow.dispose();
                this._frameWindow = null;
                return null;
            }
            if (((_arg_2) && (!(this._frameWindow.header == null))))
            {
                this._frameWindow.header.title.text = _arg_2;
            }
            this._frameWindow.position = _Str_3163;
            this._frameWindow.findChildByName("header_button_close").procedure = this._Str_3328;
            return this._frameWindow;
        }

        public function _Str_13533(k:IWindowContainer, _arg_2:Array):Boolean
        {
            var _local_3:int;
            if (!this._Str_19170(_arg_2))
            {
                return false;
            }
            if (k)
            {
                _local_3 = k.getChildIndex(this._editorContent);
                if (_local_3)
                {
                    k.removeChildAt(_local_3);
                }
                k.addChild(this._editorContent);
            }
            else
            {
                if (this._windowContext == null)
                {
                    this._windowContext = (this._editor.manager.windowManager.createWindow("avatarEditorContainer", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108._Str_16702, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(0, 0, 2, 2), null, 0) as IWindowContainer);
                    this._windowContext.addChild(this._editorContent);
                }
                _local_3 = this._windowContext.getChildIndex(this._editorContent);
                if (_local_3)
                {
                    k.removeChildAt(_local_3);
                }
                this._windowContext.visible = true;
            }
            return true;
        }

        public function _Str_19170(k:Array):Boolean
        {
            var _local_2:String;
            if (k == null)
            {
                return this._Str_19170(this._allCategories);
            }
            if (k.length != this._availableCategories.length)
            {
                return false;
            }
            for each (_local_2 in k)
            {
                if (this._availableCategories.indexOf(_local_2) < 0)
                {
                    return false;
                }
            }
            return true;
        }

        private function _Str_5183(k:Event=null):void
        {
            this._saveTimer.stop();
            if (this._editorContent)
            {
                this._editorContent.findChildByName("save").enable();
            }
        }

        public function show():void
        {
            if (this._frameWindow)
            {
                this._frameWindow.visible = true;
            }
            else
            {
                if (this._editorContent)
                {
                    this._editorContent.visible = true;
                }
            }
        }

        public function hide():void
        {
            if (this._frameWindow)
            {
                this._frameWindow.visible = false;
            }
            else
            {
                if (this._editorContent)
                {
                    this._editorContent.visible = false;
                }
            }
        }

        private function createWindow():void
        {
            var _local_4:String;
            var _local_5:ITabButtonWindow;
            var _local_6:int;
            var _local_7:IWindow;
            if (this._editorContent == null)
            {
                this._editorContent = (this._editor.manager.windowManager.buildFromXML(((this._editor.manager.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML)) as IWindowContainer);
            }
            if (_Str_6802 == null)
            {
                _Str_6802 = (this._editorContent.findChildByName("thumb_template") as IWindowContainer);
                if (_Str_6802)
                {
                    this._editorContent.removeChild(_Str_6802);
                }
            }
            if (_Str_8604 == null)
            {
                _Str_8604 = (this._editorContent.findChildByName("palette_template") as IWindowContainer);
                if (_Str_8604)
                {
                    this._editorContent.removeChild(_Str_8604);
                }
            }
            if (((!(this._editor.manager == null)) && (!(this._editor.manager._Str_2627 == null))))
            {
                this._editorContent.findChildByName("avatar_name").caption = this._editor.manager._Str_2627.userName;
                if (this._editor.manager.getBoolean("premium.name.change.enabled"))
                {
                    this._editorContent.findChildByName("avatar_name_change").visible = true;
                }
            }
            this._editorContent.procedure = this._Str_3328;
            this._tabContainer = (this._editorContent.findChildByName("mainTabs") as ITabContextWindow);
            var k:Vector.<String> = new Vector.<String>(0);
            var _local_2:int = (this._tabContainer._Str_4277 - 1);
            while (_local_2 >= 0)
            {
                _local_5 = this._tabContainer._Str_3363(_local_2);
                k.push(_local_5.name);
                if (((!(_local_5 == null)) && (this._availableCategories.indexOf(_local_5.name) < 0)))
                {
                    this._tabContainer._Str_5897(_local_5);
                    _local_6 = (_local_2 + 1);
                    while (_local_6 < this._tabContainer._Str_4277)
                    {
                        this._tabContainer._Str_3363(_local_6).x = (this._tabContainer._Str_3363(_local_6).x - _local_5.width);
                        _local_6++;
                    }
                }
                _local_2--;
            }
            this._categoryContainers = new Dictionary();
            var _local_3:IWindowContainer = (this._editorContent.findChildByName("contentArea") as IWindowContainer);
            for each (_local_4 in k)
            {
                _local_7 = _local_3.findChildByName((_local_4 + "_content"));
                if (_local_7)
                {
                    this._categoryContainers[_local_4] = _local_3.removeChild(_local_7);
                }
            }
            this._gridView = new AvatarEditorGridView((this._editorContent.findChildByName("grid_container") as IWindowContainer));
            this._effectsGridView = new AvatarEditorGridViewEffects((this._editorContent.findChildByName("grid_container") as IWindowContainer));
            this._tabContainer.selector.setSelected(this._tabContainer._Str_3363(0));
            this.update();
        }

        public function update():void
        {
            var k:IWindow = (this._editorContent.findChildByName("wardrobeButtonContainer") as IWindow);
            if (((k) && (this._editor.manager._Str_2627)))
            {
                k.visible = ((this._editor.manager._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2964) && (this._editor._Str_16133()));
                k.visible = this._editor._Str_16133();
            }
            var _local_2:String = AvatarEditorSideCategory.NOTHING;
            if (((this._currentSideContentType == AvatarEditorSideCategory.WARDROBE) || (this._showWardrobeOnUpdate)))
            {
                _local_2 = AvatarEditorSideCategory.WARDROBE;
            }
            if (!this._editor._Str_16133())
            {
                _local_2 = AvatarEditorSideCategory.NOTHING;
            }
            if (this._editor._Str_16127())
            {
                this._editor._Str_21762();
                this._editor._Str_21039();
            }
            if (this._editor._Str_7960())
            {
                this._editor._Str_8360();
            }
            this._Str_17697(_local_2);
            this._Str_26459(this._currentViewId);
        }

        public function _Str_5985(k:String, _arg_2:Boolean=false):void
        {
            if (_arg_2)
            {
            }
            this._Str_26459(k);
        }

        private function _Str_24588():void
        {
            if (this._currentSideContentType == AvatarEditorSideCategory.WARDROBE)
            {
                this._showWardrobeOnUpdate = false;
                this._Str_17697(AvatarEditorSideCategory.NOTHING);
            }
            else
            {
                this._Str_17697(AvatarEditorSideCategory.WARDROBE);
            }
        }

        private function _Str_17697(k:String):void
        {
            var _local_5:int;
            if (this._currentSideContentType == k)
            {
                return;
            }
            var _local_2:IWindowContainer = (this._editorContent.findChildByName("sideContainer") as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            var _local_3:IWindow;
            switch (k)
            {
                case AvatarEditorSideCategory.NOTHING:
                    break;
                case AvatarEditorSideCategory.WARDROBE:
                    _local_3 = this._editor._Str_25527(AvatarEditorSideCategory.WARDROBE);
                    break;
            }
            var _local_4:IWindow = _local_2.removeChildAt(0);
            if (_local_4)
            {
                this._editorContent.width = (this._editorContent.width - _local_4.width);
            }
            if (_local_3)
            {
                _local_2.addChild(_local_3);
                _local_3.visible = true;
                _local_2.width = _local_3.width;
            }
            else
            {
                _local_2.width = 0;
            }
            this._currentSideContentType = k;
            if (this._frameWindow)
            {
                _local_5 = 8;
                this._frameWindow.content.width = (this._editorContent.width + _local_5);
            }
        }

        private function _Str_26459(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (k == "")
            {
                return;
            }
            var _local_2:IWindowContainer = (this._editorContent.findChildByName("contentArea") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            if (k == AvatarEditorFigureCategory.EFFECTS)
            {
                this.effectsParamViewContainer.visible = true;
            }
            else
            {
                this.effectsParamViewContainer.visible = false;
            }
            var _local_3:IWindow = _local_2.getChildAt(0);
            _local_2.removeChild(_local_3);
            _local_2.invalidate();
            var _local_4:IWindow = this._editor._Str_17609(k);
            if (_local_4 == null)
            {
                return;
            }
            this._gridView.window.visible = false;
            _local_4.visible = true;
            _local_2.addChild(_local_4);
            this._editor._Str_25043(k);
            this._currentViewId = k;
            this._tabContainer.selector.setSelected(this._tabContainer._Str_19493(k));
        }

        public function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                _local_3 = (_arg_2 as ITabContextWindow).selector.getSelected().name;
                if (_local_3 != this._currentViewId)
                {
                    this._editor._Str_14039(_local_3);
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.CLICK)
                {
                    switch (_arg_2.name)
                    {
                        case "save":
                            if (((!(this._editor._Str_16064())) && (this._editor._Str_7960())))
                            {
                                this._Str_25363();
                                this._saveTimer.start();
                                this._editorContent.findChildByName("save").disable();
                                return;
                            }
                            if (((!(this._editor._Str_16064())) && (this._editor._Str_16127())))
                            {
                                this._editor.openHabboClubAdWindow();
                                this._saveTimer.start();
                                this._editorContent.findChildByName("save").disable();
                                return;
                            }
                            this._saveTimer.start();
                            this._editorContent.findChildByName("save").disable();
                            this._editor._Str_22528();
                            this._editor.manager.close(this._editor._Str_12289);
                            return;
                        case "cancel":
                        case "header_button_close":
                            if (this._editor._Str_16127())
                            {
                                this._editor._Str_21762();
                                this._editor._Str_21039();
                            }
                            this._editor.manager.close(this._editor._Str_12289);
                            return;
                        case "rotate_avatar":
                            this._avatarDirection++;
                            if (this._avatarDirection > 7)
                            {
                                this._avatarDirection = 0;
                            }
                            this._editor.figureData.direction = this._avatarDirection;
                            return;
                        case "wardrobe":
                            this._Str_24588();
                            return;
                        case "avatar_name_change":
                            if (this._avatarEditorNameChangeView != null)
                            {
                                this._avatarEditorNameChangeView.focus();
                            }
                            else
                            {
                                this._avatarEditorNameChangeView = new AvatarEditorNameChangeView(this, (this._editorContent.x + this._editorContent.width), this._editorContent.y);
                            }
                            return;
                    }
                }
            }
        }

        private function _Str_25363():void
        {
            if (this._editor.manager.catalog)
            {
                this._editor.manager.catalog.openCatalogPage(this._editor.manager.getProperty("catalog.clothes.page"));
            }
        }

        public function get effectsParamViewContainer():IWindowContainer
        {
            return IWindowContainer(this._editorContent.findChildByName("effectParamsContainer"));
        }

        public function getCategoryContainer(k:String):IWindow
        {
            return this._categoryContainers[k];
        }

        public function get _Str_19197():IAvatarEditorGridView
        {
            return this._gridView;
        }

        public function _Str_25244():IWidgetWindow
        {
            return this._editorContent.findChildByName("avatarWidget") as IWidgetWindow;
        }

        public function get effectsGridView():IAvatarEditorGridView
        {
            return this._effectsGridView;
        }

        public function get editor():HabboAvatarEditor
        {
            return this._editor;
        }

        public function get _Str_22767():AvatarEditorNameChangeView
        {
            return this._avatarEditorNameChangeView;
        }
    }
}
