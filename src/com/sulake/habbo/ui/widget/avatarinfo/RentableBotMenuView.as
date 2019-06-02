package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots._Str_6169;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillsEnum;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5937;
    import com.sulake.habbo.communication.messages.outgoing._Str_416._Str_3365;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class RentableBotMenuView extends AvatarContextInfoButtonView 
    {
        protected var _data:RentableBotInfoData;

        public function RentableBotMenuView(k:AvatarInfoWidget)
        {
            super(k);
            _Str_3403 = false;
        }

        public static function setup(k:RentableBotMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:RentableBotInfoData):void
        {
            k._data = _arg_6;
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override public function dispose():void
        {
            if (window)
            {
                window.removeEventListener(WindowMouseEvent.OVER, _Str_2743);
                window.removeEventListener(WindowMouseEvent.OUT, _Str_2743);
            }
            this._data = null;
            super.dispose();
        }

        protected function _Str_2771():void
        {
            var _local_7:_Str_6169;
            var _local_8:Array;
            var _local_9:IWindowContainer;
            var _local_10:int;
            if (((!(window)) || (!(this._data))))
            {
                return;
            }
            var k:IItemListWindow = (window.findChildByName("buttons") as IItemListWindow);
            if (!k)
            {
                return;
            }
            var _local_2:IWindowContainer = (_Str_2374.getListItemByName("link_template") as IWindowContainer);
            var _local_3:IWindowContainer = (_Str_2374.getListItemByName("nux_proceed_1") as IWindowContainer);
            k.procedure = this.buttonEventProc;
            k.autoArrangeItems = false;
            var _local_4:int = k.numListItems;
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                k.getListItemAt(_local_5).visible = false;
                _local_5++;
            }
            var _local_6:Boolean = ((this._data._Str_3246) || (this._data._Str_3529));
            _Str_2304("pick", ((this._data._Str_2899) ? ((this._data._Str_2899.indexOf(BotSkillsEnum._Str_17261) == -1) && (_local_6)) : _local_6));
            if (this._data._Str_2899)
            {
                _Str_2304("donate_to_all", (!(this._data._Str_2899.indexOf(BotSkillsEnum.DONATE_TO_ALL) == -1)));
                _Str_2304("donate_to_user", (!(this._data._Str_2899.indexOf(BotSkillsEnum.DONATE_TO_USER) == -1)));
                if (this._data._Str_3246)
                {
                    _Str_2304("change_bot_name", (!(this._data._Str_2899.indexOf(BotSkillsEnum.CHANGE_BOT_NAME) == -1)));
                    _Str_2304("change_bot_motto", (!(this._data._Str_2899.indexOf(BotSkillsEnum.CHANGE_BOT_MOTTO) == -1)));
                    _Str_2304("dress_up", (!(this._data._Str_2899.indexOf(BotSkillsEnum.DRESS_UP) == -1)));
                    _Str_2304("random_walk", (!(this._data._Str_2899.indexOf(BotSkillsEnum.RANDOM_WALK) == -1)));
                    _Str_2304("setup_chat", (!(this._data._Str_2899.indexOf(BotSkillsEnum.SETUP_CHAT) == -1)));
                    _Str_2304("dance", (!(this._data._Str_2899.indexOf(BotSkillsEnum.DANCE) == -1)));
                }
                _Str_2304("nux_take_tour", (!(this._data._Str_2899.indexOf(BotSkillsEnum.NUX_TAKE_TOUR) == -1)));
            }
            for each (_local_7 in this._data._Str_10833)
            {
                if (_local_7.id == BotSkillsEnum._Str_18934)
                {
                    _local_9 = (_local_2.clone() as IWindowContainer);
                    _local_8 = _local_7.data.split(",");
                    if (_local_8.length == 2)
                    {
                        _local_9.findChildByName("label").caption = _local_8[0];
                        _local_9.name = (":link " + _local_8[1]);
                        _local_9.visible = true;
                        k.addListItem(_local_9);
                    }
                }
                if (_local_7.id == BotSkillsEnum._Str_14917)
                {
                    if (_local_7.data == "")
                    {
                        _Str_2304("nux_proceed_1", true);
                    }
                    else
                    {
                        _local_8 = _local_7.data.split(",");
                        if (_local_8.length == 2)
                        {
                            _local_10 = parseInt(_local_8[1]);
                            if (_local_10 == 1)
                            {
                                _Str_2304("nux_proceed_1", true);
                                IWindowContainer(k.getListItemByName("nux_proceed_1")).findChildByName("label").caption = _local_8[0];
                            }
                            else
                            {
                                _local_9 = (_local_3.clone() as IWindowContainer);
                                _local_9.visible = true;
                                _local_9.name = ("nux_proceed_" + _local_10);
                                _local_9.findChildByName("label").caption = _local_8[0];
                                k.addListItemAt(_local_9, ((k.getListItemIndex(k.getListItemByName("nux_proceed_1")) + _local_10) - 1));
                            }
                        }
                    }
                }
                if (_local_7.id == BotSkillsEnum._Str_18173)
                {
                    _local_9 = (_local_2.clone() as IWindowContainer);
                    _local_8 = _local_7.data.split(",");
                    if (_local_8.length == 2)
                    {
                        _local_9.findChildByName("label").caption = _local_8[0];
                        _local_9.name = (":link navigator/search/" + _local_8[1]);
                        _local_9.visible = true;
                        k.addListItem(_local_9);
                    }
                }
            }
            k.autoArrangeItems = true;
            k.visible = true;
        }

        override protected function updateWindow():void
        {
            var k:XML;
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
            {
                return;
            }
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (!window)
                {
                    k = (XmlAsset(_Str_2268.assets.getAssetByName("avatar_menu_widget")).content as XML);
                    _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!window)
                    {
                        return;
                    }
                    window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _Str_2374 = (window.findChildByName("buttons") as IItemListWindow);
                _Str_2374.procedure = this.buttonEventProc;
                window.findChildByName("name").caption = _Str_2360;
                window.visible = false;
                activeView = window;
                this._Str_2771();
            }
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:Point;
            var _local_5:Rectangle;
            var _local_6:String;
            var _local_7:String;
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_5 = null;
                    switch (_arg_2.parent.name)
                    {
                        case "pick":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_5937(this._data.id));
                            break;
                        case "setup_chat":
                            _local_3 = true;
                            _local_5 = new Rectangle();
                            window.getGlobalRectangle(_local_5);
                            _local_4 = new Point((_local_5.x + (_local_5.width / 2)), (_local_5.y + _local_5.height));
                            this.widget._Str_21992(this._data.id, BotSkillsEnum.SETUP_CHAT, _local_4);
                            break;
                        case "random_walk":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.RANDOM_WALK, ""));
                            break;
                        case "dress_up":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.DRESS_UP, ""));
                            break;
                        case "dance":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.DANCE, ""));
                            break;
                        case "donate_to_all":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.DONATE_TO_ALL, ""));
                            break;
                        case "donate_to_user":
                            _local_3 = true;
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.DONATE_TO_USER, ""));
                            break;
                        case "nux_take_tour":
                            _local_3 = true;
                            this.widget.component.context.createLinkEvent("help/tour");
                            this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum.NUX_TAKE_TOUR, ""));
                            break;
                        case "change_bot_motto":
                            _local_3 = true;
                            _local_5 = new Rectangle();
                            window.getGlobalRectangle(_local_5);
                            _local_4 = new Point((_local_5.x + (_local_5.width / 2)), (_local_5.y + _local_5.height));
                            this.widget._Str_21992(this._data.id, BotSkillsEnum.CHANGE_BOT_MOTTO, _local_4);
							break;
						case "change_bot_name":
                            _local_3 = true;
                            _local_5 = new Rectangle();
                            window.getGlobalRectangle(_local_5);
                            _local_4 = new Point((_local_5.x + (_local_5.width / 2)), (_local_5.y + _local_5.height));
                            this.widget._Str_21992(this._data.id, BotSkillsEnum.CHANGE_BOT_NAME, _local_4);
                            break;
                    }
                    if (_arg_2.parent.name.indexOf(":link ") != -1)
                    {
                        _local_6 = _arg_2.parent.name.substr(6, (_arg_2.parent.name.length - 6));
                        this.widget.component.context.createLinkEvent(_local_6);
                        _local_3 = true;
                    }
                    if (_arg_2.parent.name.indexOf("nux_proceed_") != -1)
                    {
                        _local_7 = _arg_2.parent.name.substr(12, (_arg_2.parent.name.length - 12));
                        this.widget.handler.container.connection.send(new _Str_3365(this._data.id, BotSkillsEnum._Str_14917, _local_7));
                        _local_3 = true;
                    }
                }
                this._Str_2771();
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                _Str_2268.removeView(this, false);
            }
        }

        private function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }
    }
}



