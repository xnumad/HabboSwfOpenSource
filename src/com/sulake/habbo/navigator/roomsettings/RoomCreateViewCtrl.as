package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.navigator.domain.RoomLayout;
    import flash.utils.Timer;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.core.window.components.IDropMenuWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.events.Event;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.navigator.Util;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10588;
    import __AS3__.vec.*;
    import com.sulake.habbo.navigator.*;

    public class RoomCreateViewCtrl 
    {
        private static const _Str_18545:int = 75;
        private static const _Str_17355:int = 50;

        private var _navigator:IHabboTransitionalNavigator;
        private var _content:IWindowContainer;
        private var _list:IItemListWindow;
        private var _layouts:Vector.<RoomLayout>;
        private var _selectedLayout:RoomLayout;
        private var _arrowTimer:Timer;
        private var _arrowMovingDown:Boolean = true;
        private var _roomNameInput:TextFieldManager;
        private var _roomDescInput:TextFieldManager;
        private var _categoryMenu:IDropMenuWindow;
        private var _maxVisitors:IDropMenuWindow;
        private var _tradeSettings:IDropMenuWindow;
        private var _selectableAndVisibleCategories:Array;

        public function RoomCreateViewCtrl(k:IHabboTransitionalNavigator)
        {
            this._selectableAndVisibleCategories = [];
            super();
            this._navigator = k;
            this._arrowTimer = new Timer(100);
            this._arrowTimer.addEventListener(TimerEvent.TIMER, this._Str_19844);
            this._layouts = new Vector.<RoomLayout>();
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 104, "a"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 94, "b"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 36, "c"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 84, "d"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 80, "e"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 80, "f"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 416, "i"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 320, "j"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 448, "k"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 352, "l"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 384, "m"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_3159, 372, "n"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 80, "g"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 74, "h"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 416, "o"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 352, "p"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 304, "q"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 336, "r"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 748, "u"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2964, 438, "v"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 540, "t"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 0x0200, "w"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 396, "x"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 440, "y"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 456, "z"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 208, "0"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 1009, "1"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 1044, "2"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 183, "3"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 254, "4"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 0x0400, "5"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 801, "6"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 354, "7"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 888, "8"));
            this._layouts.push(new RoomLayout(HabboClubLevelEnum._Str_2575, 926, "9"));
            this._layouts.push(new RoomLayout(-1, 2500, "snowwar1"));
            this._layouts.push(new RoomLayout(-1, 2500, "snowwar2"));
        }

        private static function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }


        public function dispose():void
        {
            if (this._arrowTimer)
            {
                this._arrowTimer.removeEventListener(TimerEvent.TIMER, this._Str_19844);
                this._arrowTimer.reset();
                this._arrowTimer = null;
            }
        }

        private function _Str_19844(k:Event):void
        {
            var _local_2:String = "select_arrow";
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(this._selectedLayout.view.findChildByName(_local_2));
            var _local_4:int;
            var _local_5:int = 15;
            var _local_6:int = (((Math.abs((_local_3.y - _local_4)) < 2) || (Math.abs((_local_3.y - _local_5)) < 2)) ? 1 : 2);
            _local_3.y = (_local_3.y + ((this._arrowMovingDown) ? _local_6 : -(_local_6)));
            if (_local_3.y < _local_4)
            {
                this._arrowMovingDown = true;
                _local_3.y = (_local_4 + 1);
            }
            else
            {
                if (_local_3.y > _local_5)
                {
                    this._arrowMovingDown = false;
                    _local_3.y = (_local_5 - 1);
                }
            }
        }

        public function hide():void
        {
            if (this._content)
            {
                this._content.visible = false;
            }
        }

        public function show():void
        {
            this.prepare();
            this._content.visible = true;
            this.refresh();
            this._content.activate();
            this._arrowTimer.start();
        }

        private function prepare():void
        {
            if (this._content != null)
            {
                return;
            }
            this._content = IWindowContainer(this._navigator.getXmlWindow("roc_create_room"));
            this._list = IItemListWindow(this._content.findChildByName("layout_item_list"));
            this._Str_19409();
            var k:IButtonWindow = this._Str_24078();
            _Str_2786(k, this._Str_23902);
            var _local_2:IButtonWindow = this._Str_25310();
            _Str_2786(_local_2, this._Str_4604);
            var _local_3:IWindow = this._content.findChildByTag("close");
            _Str_2786(_local_3, this._Str_4604);
            this._roomNameInput = new TextFieldManager(this._navigator, ITextFieldWindow(this._content.findChildByName("room_name_input")), 25, null, this._navigator.getText("navigator.createroom.roomnameinfo"));
            this._roomDescInput = new TextFieldManager(this._navigator, ITextFieldWindow(this._content.findChildByName("room_desc_input")), 128, null, this._navigator.getText("navigator.createroom.roomdescinfo"));
            this._Str_23605();
            this._Str_23465();
            this._Str_10439(50);
            var _local_4:Rectangle = Util._Str_10228(this._content.desktop, this._content.width, this._content.height);
            this._content.x = _local_4.x;
            this._content.y = _local_4.y;
        }

        private function _Str_23605():void
        {
            var _local_2:_Str_2802;
            this._categoryMenu = (this._content.findChildByName("categories_list") as IDropMenuWindow);
            var k:Array = new Array();
            this._selectableAndVisibleCategories = [];
            for each (_local_2 in this._navigator.data._Str_11717)
            {
                if (((!(_local_2._Str_15540)) && ((!(_local_2._Str_13024)) || ((_local_2._Str_13024) && (this._navigator._Str_2627.hasSecurity(SecurityLevelEnum._Str_8629))))))
                {
                    this._selectableAndVisibleCategories.push(_local_2);
                    k.push(_local_2._Str_14718);
                }
            }
            this._categoryMenu.populate(k);
            this._categoryMenu.selection = 0;
        }

        private function _Str_23465():void
        {
            this._tradeSettings = (this._content.findChildByName("trade_settings_list") as IDropMenuWindow);
            var k:Array = new Array();
            k.push("${navigator.roomsettings.trade_not_allowed}");
            k.push("${navigator.roomsettings.trade_not_with_Controller}");
            k.push("${navigator.roomsettings.trade_allowed}");
            this._tradeSettings.populate(k);
            this._tradeSettings.selection = 0;
        }

        public function refresh():void
        {
            this._roomNameInput._Str_8407();
            this._roomNameInput.input._Str_4807 = 0xFFFFFFFF;
            this._roomDescInput._Str_8407();
            this._roomDescInput.input._Str_4807 = 0xFFFFFFFF;
            this._tradeSettings.selection = 0;
            this._categoryMenu.selection = 0;
            this._selectedLayout = this._layouts[0];
            this._Str_19409();
            if (this._navigator._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2575)
            {
                this._Str_10439(_Str_18545);
            }
            else
            {
                this._Str_10439(_Str_17355);
            }
            this._Str_16163();
        }

        private function _Str_10439(k:int):void
        {
            this._maxVisitors = (this._content.findChildByName("visitors_list") as IDropMenuWindow);
            var _local_2:Array = new Array();
            var _local_3:int = 10;
            while (_local_3 <= k)
            {
                _local_2.push(("" + _local_3));
                _local_3 = (_local_3 + 5);
            }
            this._maxVisitors.populate(_local_2);
            this._maxVisitors.selection = 0;
        }

        private function _Str_16163():void
        {
            var k:RoomLayout;
            var _local_2:Boolean;
            var _local_3:ITextWindow;
            for each (k in this._layouts)
            {
                if (k.view == null)
                {
                }
                else
                {
                    _local_2 = (k == this._selectedLayout);
                    k.view.findChildByName("bg_sel").visible = _local_2;
                    k.view.findChildByName("bg_unsel").visible = (!(_local_2));
                    _local_3 = ITextWindow(k.view.findChildByName("tile_size_txt"));
                    _local_3.textColor = ((_local_2) ? 0xFFFFFFFF : 0xFF000000);
                    _local_3.color = ((_local_2) ? 4285432196 : 4291546059);
                    this._navigator.refreshButton(k.view, "tile_icon_black", (!(_local_2)), null, 0);
                    this._navigator.refreshButton(k.view, "tile_icon_white", _local_2, null, 0);
                    this._navigator.refreshButton(k.view, "select_arrow", _local_2, null, 0);
                }
            }
        }

        private function _Str_19409():void
        {
            var k:RoomLayout;
            var _local_2:int;
            var _local_3:IWindowContainer;
            var _local_4:int;
            var _local_6:IWindow;
            var _local_7:RoomLayout;
            var _local_8:IWindowContainer;
            var _local_9:IWindow;
            while (this._list.numListItems > 0)
            {
                _local_6 = this._list.removeListItemAt(0);
                _local_6.destroy();
            }
            for each (k in this._layouts)
            {
                if (k.view != null)
                {
                    k.view.destroy();
                    k.view = null;
                }
            }
            _local_2 = 0;
            _local_4 = 0;
            while (_local_4 < this._layouts.length)
            {
                _local_7 = this._layouts[_local_4];
                if (!this.isAllowed(_local_7, false))
                {
                }
                else
                {
                    if (_local_2 == 0)
                    {
                        _local_3 = this._Str_25424();
                        this._list.addListItem(_local_3);
                    }
                    this.addThumbnail(_local_3, this._layouts[_local_4], ((_local_2 % 2) == 0));
                    _local_2 = ((_local_2 == 0) ? 1 : 0);
                }
                _local_4++;
            }
            this._Str_16163();
            var _local_5:String;
            if (((this._navigator._Str_2627.clubLevel < HabboClubLevelEnum._Str_2575) && (!(this._navigator.getBoolean("habbo_club_buy_disabled")))))
            {
                _local_5 = "roc_vip_promo";
            }
            if (_local_5 != null)
            {
                _local_8 = IWindowContainer(this._navigator.getXmlWindow(_local_5));
                if (_local_8)
                {
                    _local_9 = _local_8.findChildByName("link");
                    _Str_2786(_local_9, this._Str_22826);
                    this._list.addListItem(_local_8);
                }
            }
        }

        private function addThumbnail(k:IWindowContainer, _arg_2:RoomLayout, _arg_3:Boolean):void
        {
            var _local_4:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("roc_room_thumbnail"));
            _local_4.tags.push(_arg_2.name);
            if (!_arg_3)
            {
                _local_4.x = _local_4.width;
            }
            _Str_2786(_local_4, this._Str_22785);
            var _local_5:IStaticBitmapWrapperWindow = (_local_4.findChildByName("bg_pic") as IStaticBitmapWrapperWindow);
            _local_5.assetUri = (("${image.library.url}newroom/model_" + _arg_2.name) + ".png");
            k.addChild(_local_4);
            (this._navigator._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2575);
            k.width = (2 * _local_4.width);
            k.height = _local_4.height;
            _arg_2.view = _local_4;
            ITextWindow(_arg_2.view.findChildByName("tile_size_txt")).text = ((_arg_2._Str_15099 + " ") + this._navigator.getText("navigator.createroom.tilesize"));
            _local_4.findChildByName("club_icon").visible = ((_arg_2._Str_17446 == HabboClubLevelEnum._Str_2964) || (_arg_2._Str_17446 == HabboClubLevelEnum._Str_2575));
        }

        private function isAllowed(k:RoomLayout, _arg_2:Boolean=true):Boolean
        {
            switch (k._Str_17446)
            {
                case HabboClubLevelEnum._Str_3159:
                    return true;
                case HabboClubLevelEnum._Str_2964:
                    return (!(_arg_2)) || (this._navigator._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2964);
                case HabboClubLevelEnum._Str_2575:
                    return (!(_arg_2)) || (this._navigator._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2575);
                default:
                    return this._navigator._Str_2627.hasSecurity(SecurityLevelEnum._Str_3751);
            }
        }

        private function _Str_25424():IWindowContainer
        {
            return IWindowContainer(this._navigator.windowManager.createWindow("", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, new Rectangle(0, 0, 100, 300)));
        }

        private function _Str_17505():Boolean
        {
            var k:Boolean = this._roomNameInput._Str_22184(this._navigator.getText("navigator.createroom.nameerr"));
            return k;
        }

        private function _Str_24078():IButtonWindow
        {
            return IButtonWindow(this._content.findChildByName("create_button"));
        }

        private function _Str_25310():IButtonWindow
        {
            return IButtonWindow(this._content.findChildByName("back_button"));
        }

        private function _Str_23552(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:RoomLayout = this._Str_14617(_arg_2);
            if (this.isAllowed(_local_3, true))
            {
                this._selectedLayout = _local_3;
                this._Str_16163();
            }
            else
            {
                this._navigator.openCatalogClubPage("RoomCreateViewCtrl");
            }
        }

        private function _Str_14617(k:IWindow):RoomLayout
        {
            var _local_2:RoomLayout = this._Str_23514(k.tags[0]);
            return _local_2;
        }

        private function _Str_23514(k:String):RoomLayout
        {
            var _local_2:RoomLayout;
            for each (_local_2 in this._layouts)
            {
                if (_local_2.name == k)
                {
                    return _local_2;
                }
            }
            return this._layouts[0];
        }

        private function _Str_22785(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = (k.target as IWindowContainer);
            this._Str_23552(k, _local_2);
        }

        private function _Str_4604(k:WindowEvent):void
        {
            this.close();
        }

        private function _Str_22826(k:WindowEvent):void
        {
            Logger.log("HC LINK CLICKED");
            this._navigator.openCatalogClubPage("RoomCreateViewCtrl");
        }

        private function _Str_23902(k:WindowEvent):void
        {
            var _local_8:_Str_2802;
            var _local_9:int;
            var _local_2:String = this._roomNameInput.getText();
            var _local_3:String = this._roomDescInput.getText();
            var _local_4:String = ("model_" + this._selectedLayout.name);
            var _local_5:int = parseInt(this._maxVisitors._Str_4487()[this._maxVisitors.selection]);
            var _local_6:int;
            var _local_7:int;
            for each (_local_8 in this._selectableAndVisibleCategories)
            {
                if (this._categoryMenu.selection == _local_7)
                {
                    _local_6 = _local_8._Str_4760;
                    break;
                }
                _local_7++;
            }
            _local_9 = this._tradeSettings.selection;
            if (!this._Str_17505())
            {
                return;
            }
            this._navigator.send(new _Str_10588(_local_2, _local_3, _local_4, _local_6, _local_5, _local_9));
        }

        private function close():void
        {
            this._content.visible = false;
            this._arrowTimer.reset();
        }
    }
}
