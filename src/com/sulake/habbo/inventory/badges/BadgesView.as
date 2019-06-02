package com.sulake.habbo.inventory.badges
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.Core;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class BadgesView implements IInventoryView 
    {
        private var _windowManager:IHabboWindowManager;
        private var _view:IWindowContainer;
        private var _model:BadgesModel;
        private var _inactiveGrid:IItemGridWindow;
        private var _activeGrid:IItemGridWindow;
        private var _disposed:Boolean = false;
        private var _isInitialized:Boolean = false;
        private var _filteredBadges:Array;

        public function BadgesView(k:BadgesModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._model = k;
            this._windowManager = _arg_2;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isVisible():Boolean
        {
            return ((this._view) && (!(this._view.parent == null))) && (this._view.visible);
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._windowManager = null;
            this._model = null;
            this._inactiveGrid = null;
            this._activeGrid = null;
            this._filteredBadges = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (((this._view == null) || (this._view.disposed)))
            {
                return null;
            }
            return this._view;
        }

        public function _Str_18918(k:String):void
        {
            this._Str_13242(k);
            this._Str_2944();
        }

        public function _Str_2944():void
        {
            var _local_3:Array;
            if (!this._isInitialized)
            {
                return;
            }
            if (((this._view == null) || (this._view.disposed)))
            {
                return;
            }
            var k:IButtonWindow = (this._view.findChildByName("wearBadge_button") as IButtonWindow);
            if (k == null)
            {
                return;
            }
            var _local_2:Badge = this._model._Str_17378();
            if (_local_2 == null)
            {
                k.disable();
                this._Str_19119(null);
                this._Str_20172(null);
                this._view.findChildByName("badge_image").visible = false;
            }
            else
            {
                if (_local_2._Str_3222)
                {
                    k.caption = "${inventory.badges.clearbadge}";
                }
                else
                {
                    k.caption = "${inventory.badges.wearbadge}";
                }
                this._Str_19119(this._model.controller.localization.getBadgeName(_local_2.badgeId));
                this._Str_20172(this._model.controller.localization.getBadgeDesc(_local_2.badgeId));
                _Str_2402(IWidgetWindow(this._view.findChildByName("badge_image")).widget).badgeId = _local_2.badgeId;
                this._view.findChildByName("badge_image").visible = true;
                _local_3 = this._model._Str_5453(BadgesModel._Str_6557);
                if ((((!(_local_3 == null)) && (_local_3.length >= this._model._Str_23348())) && (!(_local_2._Str_3222))))
                {
                    k.disable();
                }
                else
                {
                    k.enable();
                }
            }
        }

        private function init():void
        {
            this._view = this._model.controller.view._Str_9043(InventoryCategory.BADGES);
            this._view.procedure = this._Str_3328;
            this._view.visible = false;
            var k:IWindow = this._view.findChildByName("wearBadge_button");
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_24890);
            }
            this._inactiveGrid = (this._view.findChildByName("inactive_items") as IItemGridWindow);
            this._inactiveGrid.addEventListener(WindowMouseEvent.CLICK, this._Str_20827);
            this._activeGrid = (this._view.findChildByName("active_items") as IItemGridWindow);
            this._activeGrid.addEventListener(WindowMouseEvent.CLICK, this._Str_20205);
            this._view.findChildByName("filter").caption = "";
            this._view.findChildByName("clear_filter_button").visible = false;
            this._filteredBadges = new Array();
            this._isInitialized = true;
        }

        private function _Str_13242(k:String):void
        {
            var _local_4:Badge;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            if (!this._isInitialized)
            {
                return;
            }
            if (((this._view == null) || (this._view.disposed)))
            {
                return;
            }
            var _local_2:Number = this._inactiveGrid.scrollV;
            this._inactiveGrid._Str_3956();
            this._activeGrid._Str_3956();
            this._filteredBadges.length = 0;
            var _local_3:Array = this._model._Str_5453(BadgesModel._Str_8369);
            var _local_5:int;
            while (_local_5 < _local_3.length)
            {
                _local_4 = (_local_3[_local_5] as Badge);
                if (!_local_4._Str_3222)
                {
                    _local_7 = false;
                    if (((k == null) || (k.length == 0)))
                    {
                        _local_7 = true;
                    }
                    else
                    {
                        _local_8 = k.toLowerCase();
                        _local_9 = this._model.controller.localization.getBadgeName(_local_4.badgeId);
                        _local_10 = this._model.controller.localization.getBadgeDesc(_local_4.badgeId);
                        if (((_local_9 == null) || (_local_10 == null)))
                        {
                            Core.error(("Missing localization for badge " + _local_4.badgeId), false);
                        }
                        else
                        {
                            _local_9 = _local_9.toLowerCase();
                            _local_10 = _local_10.toLowerCase();
                            if (((_local_9.indexOf(_local_8) >= 0) || (_local_10.indexOf(_local_8) >= 0)))
                            {
                                _local_7 = true;
                            }
                        }
                    }
                    if (_local_7)
                    {
                        this._inactiveGrid._Str_2816(_local_4.window);
                        this._filteredBadges.push(_local_4);
                        _local_4.window.addEventListener(WindowMouseEvent.CLICK, this._Str_20827);
                    }
                }
                _local_5++;
            }
            if (_local_2 > 0)
            {
                this._inactiveGrid.scrollV = _local_2;
            }
            var _local_6:Array = this._model._Str_5453(BadgesModel._Str_6557);
            _local_5 = 0;
            while (_local_5 < _local_6.length)
            {
                _local_4 = (_local_6[_local_5] as Badge);
                this._activeGrid._Str_2816(_local_4.window);
                _local_4.window.addEventListener(WindowMouseEvent.CLICK, this._Str_20205);
                _local_5++;
            }
        }

        private function _Str_19119(k:String):void
        {
            if (((this._view == null) || (this._view.disposed)))
            {
                return;
            }
            var _local_2:ITextWindow = (this._view.findChildByName("badgeName") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            if (k == null)
            {
                _local_2.text = "";
            }
            else
            {
                _local_2.text = "";
                _local_2.text = k;
            }
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:WindowKeyboardEvent;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "clear_filter_button":
                        this._view.findChildByName("filter").caption = "";
                        _arg_2.visible = false;
                        this._Str_18918(null);
                        break;
                }
            }
            else
            {
                if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP)
                {
                    _local_3 = (k as WindowKeyboardEvent);
                    switch (_arg_2.name)
                    {
                        case "filter":
                            this._view.findChildByName("clear_filter_button").visible = (_arg_2.caption.length > 0);
                            if (_local_3.keyCode == 13)
                            {
                                this._Str_18918(_arg_2.caption);
                            }
                            return;
                    }
                }
            }
        }

        private function _Str_20172(k:String):void
        {
            if (((this._view == null) || (this._view.disposed)))
            {
                return;
            }
            var _local_2:ITextWindow = (this._view.findChildByName("badgeDescriptionText") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            if (k == null)
            {
                _local_2.text = "${inventory.effects.defaultdescription}";
            }
            else
            {
                _local_2.text = "";
                _local_2.text = k;
            }
        }

        private function _Str_20827(k:WindowEvent):void
        {
            var _local_2:int = this._inactiveGrid._Str_3373(k.window);
            var _local_3:Badge = this._filteredBadges[_local_2];
            if (_local_3 != null)
            {
                this._model._Str_17509(_local_3.badgeId);
            }
        }

        private function _Str_20205(k:WindowEvent):void
        {
            var _local_2:int = this._activeGrid._Str_3373(k.window);
            var _local_3:Badge = this._model._Str_24207(_local_2);
            if (_local_3 != null)
            {
                this._model._Str_17509(_local_3.badgeId);
            }
        }

        private function _Str_24890(k:WindowEvent):void
        {
            var _local_2:Badge = this._model._Str_17378();
            if (_local_2 != null)
            {
                this._model._Str_24883(_local_2.badgeId);
            }
        }
    }
}
